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
// MARK:- Variables
  var icon: IconCellViewModel?
  // MARK:- Initialization
  init(navigator: AddListNavigator) {
    self.navigator = navigator
  }
// MARK:- Functions
  func transform(input: AddListViewModel.Input) -> AddListViewModel.Output {
    let allComponents = Driver.just(getAllComponents())
    
    let iconTrigger = input.iconTrigger.map { [navigator] _ -> Void in
      navigator.toIcons(delegate: input.delegate)
    }
    let selectedComponent = input.selectingComponent.map { (component) -> CreationComponentType? in
      return CreationComponentType(rawValue: component.id)
    }
    
    return Output(iconTrigger: iconTrigger, components: allComponents, selectedComponent: selectedComponent.asObservable())
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
  }
  struct Output {
    let iconTrigger: Driver<Void>
    let components: Driver<[ComponentsModel]>
    let selectedComponent: Observable<CreationComponentType?>
  }
}
