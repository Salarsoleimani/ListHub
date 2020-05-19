//
//  ListsViewModel.swift
//  ListHub
//
//  Created by Salar Soleimani on 2020-04-14.
//  Copyright © 2020 BEKSAS. All rights reserved.
//

import Domain
import RxCocoa
import RxSwift

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
    let shouldShowEmptyList = BehaviorRelay<Bool>(value: true)

    let lists = input.viewApearTrigger.map { [dbManager, shouldShowWalktrough] _ -> [ListModel] in
      var rxLists = [ListModel]()
      dbManager.get { [shouldShowWalktrough] (lists) in
        lists.count == 0 ? shouldShowWalktrough.accept(true) : shouldShowWalktrough.accept(false)
        lists.count == 0 ? shouldShowEmptyList.accept(false) : shouldShowEmptyList.accept(true)
        rxLists = lists
      }
      return rxLists
    }
    
    let sampleList = BehaviorRelay<ListModel>(value: ListModel(title: "", iconId: 0, iconColor: ""))
    let addListTrigger = input.addListTrigger.map { [sampleList, navigator] _ -> Void in
      navigator.toAddList(sampleList)
    }
    
    let openSettingTrigger = input.openSettingTrigger.map { [navigator] _ -> Void in
      navigator.toSetting()
    }
    
    let selectedList = input.selectedList.do(onNext: { [navigator] (list) in
      navigator.toListItems(listId: list.uid)
    }).mapToVoid()
    
    return Output(addList: addListTrigger, openSetting: openSettingTrigger, lists: lists, shouldShowEmptyList: shouldShowEmptyList.asDriver(), openListItem: selectedList)
  }
}
// MARK:- Inputs & Outputs
extension ListsViewModel {
  struct Input {
    let selectedList: Driver<ListModel>
    let addListTrigger: Driver<Void>
    let openSettingTrigger: Driver<Void>
    let viewApearTrigger: Driver<Void>
  }
  struct Output {
    let addList: Driver<Void>
    let openSetting: Driver<Void>
    let lists: Driver<[ListModel]>
    let shouldShowEmptyList: Driver<Bool>
    let openListItem: Driver<Void>
  }
}
