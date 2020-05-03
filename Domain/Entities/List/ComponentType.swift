//
//  ComponentType.swift
//  Domain
//
//  Created by Behrad Kazemi on 2020-05-01.
//  Copyright © 2020 BEKSAS. All rights reserved.
//

import Foundation

/// - Note:
///		Seperated in two different parts of Inputs & Outputs
///		each part contains the Input or Output part of the defined Components.
///
///
/// - SeeAlso:
/// ComponentType

public enum ComponentType {
	
	//MARK: - Inputs
	public enum Inputs {
		case simpleString(ComponentElements.SimpleString.Input)
		case phoneNumber(ComponentElements.PhoneNumber.Input)
		public init(from decoder: Decoder) throws {
			let container = try decoder.singleValueContainer()

			if let element = try? container.decode(ComponentElements.SimpleString.Input.self) {
				self = .simpleString(element)
				return
			}
			
			if let element = try? container.decode(ComponentElements.PhoneNumber.Input.self) {
				self = .phoneNumber(element)
				return
			}
			throw DecodingError.typeMismatch(ComponentType.self, DecodingError.Context(codingPath: decoder.codingPath, debugDescription: "Wrong type for EventType"))
		}
	}
	
	//MARK: - Outputs
	public enum Outputs {
		case simpleString(ComponentElements.SimpleString.Output)
		case phoneNumber(ComponentElements.PhoneNumber.Output)
		public init(from decoder: Decoder) throws {
			let container = try decoder.singleValueContainer()

			if let element = try? container.decode(ComponentElements.SimpleString.Output.self) {
				self = .simpleString(element)
				return
			}
			
			if let element = try? container.decode(ComponentElements.PhoneNumber.Output.self) {
				self = .phoneNumber(element)
				return
			}
			throw DecodingError.typeMismatch(ComponentType.self, DecodingError.Context(codingPath: decoder.codingPath, debugDescription: "Wrong type for EventType"))
		}
	}
}
