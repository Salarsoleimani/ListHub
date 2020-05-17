//
//  CreationComponentType.swift
//  ListHub
//
//  Created by Salar Soleimani on 2020-05-17.
//  Copyright © 2020 BEKSAS. All rights reserved.
//

import BEKListKit
import Domain

enum CreationComponentType {
  case simpleString(SimpleStringCreationViewModel)
  case phoneNumber(PhoneNumberCreationViewModel)
  
  public init(from decoder: Decoder) throws {
    let container = try decoder.singleValueContainer()
    
    if let element = try? container.decode(SimpleStringCreationViewModel.self) {
      self = .simpleString(element)
      return
    }
    
    throw DecodingError.typeMismatch(CreationComponentType.self, DecodingError.Context(codingPath: decoder.codingPath, debugDescription: "Wrong type for CreationComponentType"))
  }
  func makeCell() -> BEKGenericCollectionCellType?{
    switch self {
    case .simpleString(let vm):
      let cell = vm.getCell()
      return cell
    case .phoneNumber(let vm):
      let cell = vm.getCell()
      return cell
    }
  }
  func asInput(listUID: UUID) -> InputComponentType {
    switch self {
    case .simpleString(let vm):
      return vm.asInput(listUID)
    case .phoneNumber(let vm):
      return vm.asInput(listUID)
    }
  }
  
}
