//
//  DataBaseProtocol.swift
//  Domain
//
//  Created by Behrad Kazemi on 4/14/20.
//  Copyright © 2020 BEKSAS. All rights reserved.
//

import Foundation

public protocol DatabaseManagerProtocol {
	
	//MARK: - List Related Functions
	func add(List list: ListModel, components: [InputComponentType], response: ((Bool) -> Void)?)
	func get(Lists response: @escaping ([ListModel]) -> Void)
	func delete(List id: UUID,  response: ((Bool) -> Void)?)
	func update(List list: ListModel, response: ((Bool) -> Void)?)
  
	//MARK: - Item Related Functions
	func add(Item item: ListItemModel, components: [OutputComponentType], response: ((Bool) -> Void)?)
	func get(ItemsForListUID: UUID, response: @escaping ([ListItemModel]) -> Void)
	func delete(Item id: UUID,  response: ((Bool) -> Void)?)
	func update(Item item: ListItemModel, response: ((Bool) -> Void)?)
	
	//MARK: - Component Related Functions
	func add(Item input: InputComponentType, response:  ((Bool) -> Void)?)
	func get(InputComponentsForListUID: UUID, response: @escaping ([InputComponentType]) -> Void)
	func get(OutputComponentsForItemUID: UUID, response: @escaping ([OutputComponentType]) -> Void)
	func update(Item outputs: [OutputComponentType], response:  ((Bool) -> Void)?)
	func update(Item inputs: [InputComponentType], response:  ((Bool) -> Void)?)
	func delete(Item input: InputComponentType, response: ((Bool) -> Void)?)
}


