//  
//  ItemsViewModel.swift
//  ListHub
//
//  Created by Salar Soleimani on 2020-05-17.
//  Copyright © 2020 BEKSAS. All rights reserved.
//

import RxCocoa
import Domain

final class ItemsViewModel: ViewModelType {
// MARK:- Constants
  private let navigator: ItemsNavigator
  private let dbManager: DatabaseManagerProtocol
  private let listId: UUID

// MARK:- Initialization
  init(navigator: ItemsNavigator, dbManager: DatabaseManagerProtocol, listId: UUID) {
    self.navigator = navigator
    self.dbManager = dbManager
    self.listId = listId
  }
// MARK:- Functions
  func transform(input: ItemsViewModel.Input) -> ItemsViewModel.Output {
    let addItemTrigger = input.addItemTrigger.map { [listId, navigator] _ -> Void in
      navigator.toAddItem(listId)
    }
//    dbManager.get(ItemsForListUID: listId) { [rxItems] (items) in
//      for item in items {
//        rxItems.accept(item)
//      }
//    }
    return Output(openAddItem: addItemTrigger)
  }
}
// MARK:- Inputs & Outputs
extension ItemsViewModel {
  struct Input {
    let addItemTrigger: Driver<Void>
  }
  struct Output {
    let openAddItem: Driver<Void>
  }
}
