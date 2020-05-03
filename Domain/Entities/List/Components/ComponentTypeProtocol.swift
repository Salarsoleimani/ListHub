//
//  ComponentTypeProtocol.swift
//  Domain
//
//  Created by Behrad Kazemi on 5/3/20.
//  Copyright © 2020 BEKSAS. All rights reserved.
//

import Foundation
public protocol ComponentTypeProtocol {
	associatedtype Input: InputComponentTypeConvertable
	associatedtype Output: OutputComponentTypeConvertable
}

public protocol InputComponentTypeConvertable {
	func asType() -> ComponentType.Inputs
}
public protocol OutputComponentTypeConvertable {
	func asType() -> ComponentType.Outputs
}
