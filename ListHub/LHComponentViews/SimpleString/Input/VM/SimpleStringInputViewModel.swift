//
//  SimpleStringInputViewModel.swift
//  ListHub
//
//  Created by Behrad Kazemi on 5/2/20.
//  Copyright © 2020 BEKSAS. All rights reserved.
//

import BEKListKit
import Domain

struct SimpleStringInputViewModel: InputViewModelProtocol {
  typealias CellType = SimpleStringInputCell
  
  var titleName: String
  var inputValue: String = ""
  let model: ComponentElements.SimpleString.Input
  init(model: ComponentElements.SimpleString.Input) {
    self.titleName = model.title
    self.model = model
  }
  func asEnum() -> ComponentType.Inputs {
    return .simpleString(model)
  }
  
  func getCell() -> BEKGenericCell.Collection<SimpleStringInputCell> {
    return BEKGenericCell.Collection<SimpleStringInputCell>(viewModel: self)
  }
}
