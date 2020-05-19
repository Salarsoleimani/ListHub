//  
//  AddItemViewModel.swift
//  ListHub
//
//  Created by Salar Soleimani on 2020-05-17.
//  Copyright © 2020 BEKSAS. All rights reserved.
//

import Foundation
import Domain
import RxCocoa
import BEKListKit

final class AddItemViewModel: ViewModelType {
// MARK:- Constants
  private let navigator: AddItemNavigator
  private let dbManager: DatabaseManagerProtocol
  private let listId: UUID
// MARK:- Initialization
  init(navigator: AddItemNavigator, dbManager: DatabaseManagerProtocol, listId: UUID) {
    self.navigator = navigator
    self.dbManager = dbManager
    self.listId = listId
  }
// MARK:- Functions
  func transform(input: AddItemViewModel.Input) -> AddItemViewModel.Output {
    let inputCells = BehaviorRelay<[BEKGenericCollectionCellType]>(value: [BEKGenericCollectionCellType]())
    dbManager.get(InputComponentsForListUID: listId) { [inputCells] (inputs) in
      let inputCell = inputs.compactMap { (input) -> BEKGenericCollectionCellType in
        return input.asEnum().getCell()
      }
      inputCells.accept(inputCell)
    }
    return Output(inputCells: inputCells.asDriver())
  }
  
}
// MARK:- Inputs & Outputs
extension AddItemViewModel {
  struct Input {

  }
  struct Output {
    let inputCells: Driver<[BEKGenericCollectionCellType]>
  }
}
