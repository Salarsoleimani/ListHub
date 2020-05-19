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
	
		//MARK: - Input component of Simple String
		public struct Input: QuickIndexable, InputComponentType {
      public let uid: UUID
			public var listUID: UUID
			public let title: String
			
			public init(title: String, listUID: UUID) {
        self.uid = UUID()
				self.title = title
				self.listUID = listUID
			}
      
			public func asEnum() -> ComponentType.Inputs {
				return ComponentType.Inputs.simpleString(self)
			}
		}
    
		//MARK: - Output component of Simple String
    public struct Output: QuickIndexable, OutputComponentType {
      public let uid: UUID
			public var itemUID: UUID
			public let title: String
			public let content: String
			
			public init(title: String, content: String, itemUID: UUID) {
        self.uid = UUID()
				self.title = title
				self.content = content
				self.itemUID = itemUID
			}
			
			public func asEnum() -> ComponentType.Outputs {
				return ComponentType.Outputs.simpleString(self)
			}

		}
	}
}
