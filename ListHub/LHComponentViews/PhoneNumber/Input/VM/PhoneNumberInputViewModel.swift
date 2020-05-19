//
//  PhoneNumberInputViewModel.swift
//  ListHub
//
//  Created by Behrad Kazemi on 5/3/20.
//  Copyright © 2020 BEKSAS. All rights reserved.
//

import BEKListKit
import Domain

struct PhoneNumberInputViewModel: InputViewModelProtocol {
  typealias CellType = PhoneNumberInputCell
  
  var title: String = ""
  var inputValue: String = ""
  let model: ComponentElements.PhoneNumber.Input
  
  init(model: ComponentElements.PhoneNumber.Input) {
    self.title = model.title
    self.model = model
  }
  func asEnum() -> ComponentType.Inputs {
    return .phoneNumber(model)
  }
  
  func getCell() -> BEKGenericCell.Collection<PhoneNumberInputCell> {
    return BEKGenericCell.Collection<PhoneNumberInputCell>(viewModel: self)
  }
}
