//
//  ComponentsModel.swift
//  ListHub
//
//  Created by Salar Soleimani on 2020-05-07.
//  Copyright © 2020 BEKSAS. All rights reserved.
//

import Foundation

struct ComponentsModel: Codable {
  let id: Int
  let name: String
  func asCreationComponentType() -> CreationComponentType {
    switch id {
    case 0:
      return .simpleString(SimpleStringCreationViewModel(title: ""))
    case 1:
      return .phoneNumber(PhoneNumberCreationViewModel(title: ""))
    default:
      fatalError()
    }
  }
}
