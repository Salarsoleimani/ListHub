//
//  ListsViewModel.swift
//  ListHub
//
//  Created by Salar Soleimani on 2020-04-14.
//  Copyright © 2020 BEKSAS. All rights reserved.
//

import Domain
import RxCocoa

final class ListsViewModel: ViewModelType {
  // MARK:- Constants
  private let navigator: ListsNavigator
  private let dbManager: DatabaseManagerProtocol
  let shouldShowWalktrough = BehaviorRelay<Bool>(value: true)
  
  // MARK:- Initialization
  init(navigator: ListsNavigator, dbManager: DatabaseManagerProtocol) {
    self.navigator = navigator
    self.dbManager = dbManager
  }
  // MARK:- Functions
  func transform(input: ListsViewModel.Input) -> ListsViewModel.Output {
    let rxLists = BehaviorRelay<ListModel>(value: ListModel(title: "", iconId: 0, iconColor: ""))

    let addListTrigger = input.addListTrigger.map { [rxLists, navigator] _ -> Void in
      navigator.toAddList(rxLists)
    }
    let openSettingTrigger = input.openSettingTrigger.map { [navigator] _ -> Void in
      navigator.toSetting()
    }
    
    let shouldShowEmptyList = BehaviorRelay<Bool>(value: true)
    
    dbManager.get { [shouldShowWalktrough, rxLists] (lists) in
      lists.count == 0 ? shouldShowWalktrough.accept(true) : shouldShowWalktrough.accept(false)
      lists.count == 0 ? shouldShowEmptyList.accept(true) : shouldShowEmptyList.accept(false)
      for list in lists {
        rxLists.accept(list)
      }
    }
    
    return Output(addListTrigger: addListTrigger, openSettingTrigger: openSettingTrigger, lists: rxLists, shouldShowEmptyList: shouldShowEmptyList.asDriver())
  }
}
// MARK:- Inputs & Outputs
extension ListsViewModel {
  struct Input {
    let selectedList: Driver<IndexPath>
    let addListTrigger: Driver<Void>
    let openSettingTrigger: Driver<Void>
  }
  struct Output {
    let addListTrigger: Driver<Void>
    let openSettingTrigger: Driver<Void>
    let lists: BehaviorRelay<ListModel>
    let shouldShowEmptyList: Driver<Bool>
  }
}
