//
//  ComponentTypeProtocol.swift
//  Domain
//
//  Created by Behrad Kazemi on 5/3/20.
//  Copyright © 2020 BEKSAS. All rights reserved.
//

import Foundation
import QuickDB

public protocol ComponentTypeProtocol {
	associatedtype Input: InputComponentType
	associatedtype Output: OutputComponentType
}

public protocol InputComponentType {
  var listUID: UUID { get }
	func asEnum() -> ComponentType.Inputs
}
public protocol OutputComponentType {
	func asEnum() -> ComponentType.Outputs
	var itemUID: UUID { get }
}
//public protocol ToInputConvertable {
//	func asInput() -> InputComponentType
//}
