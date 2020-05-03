//
//  SimpleString.swift
//  Domain
//
//  Created by Behrad Kazemi on 5/1/20.
//  Copyright © 2020 BEKSAS. All rights reserved.
//

import Foundation
import QuickDB

public extension ComponentElements {
	enum SimpleString: ComponentTypeProtocol {
		public struct Input: Codable, InputComponentTypeConvertable {
			public func asType() -> ComponentType.Inputs {
				return ComponentType.Inputs.simpleString(self)
			}
			
			public init(title: String) {
				self.title = title
			}
			public let title: String
		}
		public struct Output: Codable, OutputComponentTypeConvertable {
			
			public func asType() -> ComponentType.Outputs {
				return ComponentType.Outputs.simpleString(self)
			}
			public init(title: String, content: String) {
				self.title = title
				self.content = content
			}
			public let title: String
			public let content: String
		}
	}
}
