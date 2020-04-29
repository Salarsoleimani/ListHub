//
//  DataBaseProtocol.swift
//  Domain
//
//  Created by Behrad Kazemi on 4/14/20.
//  Copyright © 2020 BEKSAS. All rights reserved.
//

import Foundation

public protocol DatabaseManagerProtocol {
  func add(List list: ListModel, response: @escaping (Bool) -> Void)
	func get(Lists response: @escaping ([ListModel]) -> Void)
	func delete(List id: UUID,  response: @escaping (Bool) -> Void)
	func update(List list: ListModel, components: [ComponentType], response: @escaping (Bool) -> Void)
}


