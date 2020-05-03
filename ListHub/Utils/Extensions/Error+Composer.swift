//
//  Error+Composer.swift
//  ListHub
//
//  Created by Behrad Kazemi on 5/2/20.
//  Copyright © 2020 BEKSAS. All rights reserved.
//

import Foundation
extension NSError{
	func compose(domain: String, code: Int, message: String) -> NSError {
		return NSError(domain: domain, code: code, userInfo: ["message": message])
		
	}
}
