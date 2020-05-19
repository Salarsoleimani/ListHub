//
//  ComponentType+SimpleString.swift
//  ListHub
//
//  Created by Behrad Kazemi on 5/3/20.
//  Copyright © 2020 BEKSAS. All rights reserved.
//

import Foundation
import Domain

extension ComponentType.Inputs {
	func asViewModel() throws -> SimpleStringInputViewModel {
		if case let ComponentType.Inputs.simpleString(item) = self {
      return SimpleStringInputViewModel(model: item)
		}
		let error = NSError().compose(domain: "ComponentType.Inputs.asViewModel()", code: -1, message: "Can't find simpleString type")
		throw error
	}
}

extension ComponentType.Outputs {
	func asViewModel() throws -> SimpleStringOutputViewModel {
		if case let ComponentType.Outputs.simpleString(item) = self {
			return SimpleStringOutputViewModel(titleName: item.title, inputValue: item.content)
		}
		let error = NSError().compose(domain: "ComponentType.Inputs.asViewModel()", code: -1, message: "Can't find simpleString type")
		throw error
	}
}
