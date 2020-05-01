//
//  ComponentType.swift
//  Domain
//
//  Created by Salar Soleimani on 2020-04-14.
//  Copyright © 2020 BEKSAS. All rights reserved.
//

import Foundation
//
public enum ComponentType {
  case string(StringDataModel)
  case link(LinkDataModel)
  case phoneNumber(PhoneNumberDataModel)

  public init(from decoder: Decoder) throws {
    let container = try decoder.singleValueContainer()

    if let element = try? container.decode(StringDataModel.self) {
      self = .string(element)
      return
    }
    if let element = try? container.decode(LinkDataModel.self) {
      self = .link(element)
      return
    }
    if let element = try? container.decode(PhoneNumberDataModel.self) {
      self = .phoneNumber(element)
      return
    }
    throw DecodingError.typeMismatch(ComponentType.self, DecodingError.Context(codingPath: decoder.codingPath, debugDescription: "Wrong type for EventType"))
  }
}
public struct StringDataModel: DataTypesProtocol {

}
public struct LinkDataModel: DataTypesProtocol {

}
public struct PhoneNumberDataModel: DataTypesProtocol {

}
public protocol DataTypesProtocol: Codable {
//  var id: String { get }
//  var name: String { get }
//  var type: String { get }
//  var iconId: Int { get }
}
