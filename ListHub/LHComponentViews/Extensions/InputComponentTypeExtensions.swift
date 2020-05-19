//
//  InputComponentTypeExtensions.swift
//  ListHub
//
//  Created by Salar Soleimani on 2020-05-19.
//  Copyright © 2020 BEKSAS. All rights reserved.
//

import Domain
import BEKListKit

extension ComponentType.Inputs {
  func getCell() -> BEKGenericCollectionCellType {
    switch self {
    case .simpleString(let vm):
      return SimpleStringInputViewModel(model: vm).getCell()
    case .phoneNumber(let vm):
      return PhoneNumberInputViewModel(model: vm).getCell()
    }
  }
}
