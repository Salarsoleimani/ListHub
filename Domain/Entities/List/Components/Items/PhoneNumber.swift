//
//  PhoneNumber.swift
//  Domain
//
//  Created by Behrad Kazemi on 5/3/20.
//  Copyright © 2020 BEKSAS. All rights reserved.
//

import Foundation
import QuickDB

public extension ComponentElements {
	enum PhoneNumber: ComponentTypeProtocol {
		
		//MARK: - Input component of Phone Number
		public struct Input: QuickIndexable, InputComponentType {
      public let uid: UUID
			public let title: String
			public var listUID: UUID
			
			public init(title: String, listUID: UUID) {
        self.uid = UUID()
				self.title = title
				self.listUID = listUID
			}
			public func asEnum() -> ComponentType.Inputs {
				return ComponentType.Inputs.phoneNumber(self)
			}
		}
    
		//MARK: - Output component of Phone Number
		public struct Output: Codable, OutputComponentType {
			
			public var itemUID: UUID
			public let title: String
			public let content: String
			
			public init(title: String, content: String, itemUID: UUID) {
				self.title = title
				self.content = content
				self.itemUID = itemUID
			}
			
			public func asEnum() -> ComponentType.Outputs {
				return ComponentType.Outputs.phoneNumber(self)
			}
		}
	}
}
