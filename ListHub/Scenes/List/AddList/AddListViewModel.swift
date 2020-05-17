//  
//  AddListViewModel.swift
//  ListHub
//
//  Created by Salar Soleimani on 2020-05-03.
//  Copyright © 2020 BEKSAS. All rights reserved.
//

import Foundation
import Domain
import RxCocoa
import BEKListKit
import RxSwift

final class AddListViewModel: ViewModelType {
// MARK:- Constants
  private let navigator: AddListNavigator
  private let dbManager: DatabaseManagerProtocol
  var listModel = ListModel(title: "", description: "", iconId: 0, iconColor: "#363374")

// MARK:- Variables
  var icon: IconCellViewModel? {
    didSet {
      listModel.iconColor = icon!.colorModel.value
      listModel.iconId = icon!.model.id
    }
  }
  // MARK:- Initialization
  init(navigator: AddListNavigator) {
    self.navigator = navigator
    self.dbManager = navigator.servicePackage.dbManager
  }
// MARK:- Functions
  func transform(input: AddListViewModel.Input) -> AddListViewModel.Output {
    let allComponents = Driver.just(getAllComponents())
    
    let iconTrigger = input.iconTrigger.map { [navigator] _ -> Void in
      navigator.toIcons(delegate: input.delegate, icon: input.icon)
    }
    let selectedComponent = input.selectingComponent.map { (component) -> CreationComponentType? in
      
      return component.asCreationComponentType()
    }
    
    let previousSelectedComponents = Driver.just([CreationComponentType]())
    
    let currentSelectedComponents = Driver.combineLatest(selectedComponent, previousSelectedComponents).map { (selected, componets) -> [CreationComponentType] in
      var allComponents = componets
      if let safeComponent = selected {
        allComponents.append(safeComponent)
      }
      return allComponents
    }
    let addListTrigger = input.addListTrigger.flatMapLatest { () -> Driver<[CreationComponentType]> in
      return currentSelectedComponents
    }.do(onNext: { [dbManager, navigator](items) in
      let components = items.compactMap { (item) -> InputComponentType in
        return item.asInput(listUID: self.listModel.uid)
      }
      dbManager.add(List: self.listModel, components: components) { [navigator] (isAdded) in
        if isAdded {
          navigator.popToLists(self.listModel)
        }
      }
    }).mapToVoid()
    
    return Output(iconTrigger: iconTrigger, components: allComponents, selectedComponent: selectedComponent.asObservable(), addListTrigger: addListTrigger)
  }
  private func getAllComponents() -> [ComponentsModel] {
    SSMocker<ComponentsModel>.loadGenericObjectsFromLocalJson(fileName: "Components")
  }
}
// MARK:- Inputs & Outputs
extension AddListViewModel {
  struct Input {
    let delegate: AddListControllerDelegate
    let iconTrigger: Driver<Void>
    let selectingComponent: Driver<ComponentsModel>
    let addListTrigger: Driver<Void>
    let title: Driver<String>
    let description: Driver<String>
    let icon: BehaviorRelay<IconCellViewModel>
  }
  struct Output {
    let iconTrigger: Driver<Void>
    let components: Driver<[ComponentsModel]>
    let selectedComponent: Observable<CreationComponentType?>
    let addListTrigger: Driver<Void>
  }
}
