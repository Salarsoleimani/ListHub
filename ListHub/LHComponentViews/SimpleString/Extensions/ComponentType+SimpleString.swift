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
			return SimpleStringInputViewModel(titleName: item.title)
		}
		let error = NSError().compose(domain: "ComponentType.Inputs.asViewModel()", code: -1, message: "Can't find simpleString type")
		throw error
	}
}

