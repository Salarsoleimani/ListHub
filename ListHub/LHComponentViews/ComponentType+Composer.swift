//
//  ComponentType+Composer.swift
//  ListHub
//
//  Created by Behrad Kazemi on 5/2/20.
//  Copyright © 2020 BEKSAS. All rights reserved.
//

import Foundation
import Domain
struct test {
	func tes(){
		let type = ComponentElements.SimpleString.Input(title: "ali").asType()
		if let vm: PhoneNumberInputViewModel = try? type.asViewModel(){
			
		}
	}
}
