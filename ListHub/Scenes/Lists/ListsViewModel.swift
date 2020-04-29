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
  private let engine: EngineManagerProtocol
// MARK:- Initialization
  init(navigator: ListsNavigator, engine: EngineManagerProtocol) {
    self.navigator = navigator
    self.engine = engine
  }
// MARK:- Functions
  func transform(input: ListsViewModel.Input) -> ListsViewModel.Output {
    let addListTrigger = input.addListTrigger.map { [navigator] _ -> Void in
//      let list1 = ListModel(title: "Movie", description: "hame khuba", iconId: 1, iconColor: 0x3C6CFF, templateType: .none)
//      let list2 = ListModel(title: "Work", description: "hame khubaye 2", iconId: 1, iconColor: 0xB933FF, templateType: .none)
//      self.engine.add(List: list1, response: nil)
//      self.engine.add(List: list2, response: nil)
      navigator.toAddList()
    }
    let openSettingTrigger = input.openSettingTrigger.map { [navigator] _ -> Void in
      navigator.toSetting()
    }
    
    let rxLists = BehaviorRelay<[ListModel]>(value: [ListModel]())
    engine.getLists { [rxLists](lists) in
      rxLists.accept(lists)
    }
    
    return Output(addListTrigger: addListTrigger, openSettingTrigger: openSettingTrigger, lists: rxLists)
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
  }
}
