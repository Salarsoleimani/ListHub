//
//  PhoneNumberCreationViewModel.swift
//  ListHub
//
//  Created by Salar Soleimani on 2020-05-17.
//  Copyright © 2020 BEKSAS. All rights reserved.
//

import Domain
import BEKListKit
import UIKit

struct PhoneNumberCreationViewModel: CreationViewModelProtocol {
  typealias CellType = PhoneNumberCreationCell

  func asEnum() -> CreationComponentType {
    return .phoneNumber(self)
  }
  
  func getCell() -> BEKGenericCell.Collection<PhoneNumberCreationCell> {
    return BEKGenericCell.Collection<PhoneNumberCreationCell>(viewModel: self)
  }
  var title: String
  
  func asInput(_ listUID: UUID) -> InputComponentType {
    return ComponentElements.PhoneNumber.Input(placeHolderTitle: title, listUID: listUID)
  }
}
