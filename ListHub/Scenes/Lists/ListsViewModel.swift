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
      
      navigator.toAddList()
    }
    let openSettingTrigger = input.openSettingTrigger.map { [navigator] _ -> Void in
      navigator.toSetting()
    }
    return Output(addListTrigger: addListTrigger, openSettingTrigger: openSettingTrigger)
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
  }
}
