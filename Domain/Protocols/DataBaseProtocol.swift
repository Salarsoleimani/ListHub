//
//  DataBaseProtocol.swift
//  Domain
//
//  Created by Behrad Kazemi on 4/14/20.
//  Copyright © 2020 BEKSAS. All rights reserved.
//

import Foundation

public protocol DataBaseEProtocol {
	func get(Entities response: (Result<[EntityModel], DataBaseError>) -> Void)
	func delete(Entity entityId: UUID, response: (Result<Void, DataBaseError>) -> Void)
	func update(Entity model: EntityModel, components: [ComponentType], response: (Result<Void, DataBaseError>) -> Void)
}
