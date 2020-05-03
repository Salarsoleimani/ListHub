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
		public struct Input: Codable {
			public init(title: String) {
				self.title = title
			}
			public let title: String
		}
		public struct Output: Codable {
			public let title: String
			public let content: String
		}
	}
}
