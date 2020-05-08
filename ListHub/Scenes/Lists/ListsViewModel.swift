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
    let addListTrigger = input.addListTrigger.map { [navigator] _ -> Void in
      //////////// [TODO] - remove muck
      let list1 = ListModel(title: "Movie", description: "hame khuba", iconId: 1, iconColor: 0x3C6CFF)
      var list2 = ListModel(title: "Work", description: "hame khubaye 2", iconId: 0, iconColor: 0xB933FF)
      list2.itemQuantity = 4
      var list3 = ListModel(title: "Tables and 2 lines", description: "hame khubaye 2", iconId: 0, iconColor: 0x913030)
      list3.itemQuantity = 2
      ////////////
      navigator.toAddList()
    }
    let openSettingTrigger = input.openSettingTrigger.map { [navigator] _ -> Void in
      navigator.toSetting()
    }
    
    let rxLists = BehaviorRelay<[ListModel]>(value: [ListModel]())
    
    let shouldShowEmptyList = BehaviorRelay<Bool>(value: true)
    
    dbManager.get { [shouldShowWalktrough, rxLists] (lists) in
      rxLists.accept(lists)
      lists.count == 0 ? shouldShowWalktrough.accept(true) : shouldShowWalktrough.accept(false)
      lists.count == 0 ? shouldShowEmptyList.accept(false) : shouldShowEmptyList.accept(true)
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
    let lists: BehaviorRelay<[ListModel]>
    let shouldShowEmptyList: Driver<Bool>
  }
}
