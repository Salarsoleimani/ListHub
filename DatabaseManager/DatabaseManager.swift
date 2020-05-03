//
//  DatabaseManager.swift
//  DatabaseManager
//
//  Created by Salar Soleimani on 2020-04-28.
//  Copyright © 2020 BEKSAS. All rights reserved.
//

import Domain
import QuickDB

final public class DBManager: DatabaseManagerProtocol {
  // MARK:- Constants
  private let quickDB: QuickDB
  // MARK:- Initialization
  public init() {
    self.quickDB = QuickDB.shared
  }
  // MARK:- List
  public func get(Lists response: ([ListModel]) -> Void) {
//    quickDB.getAll(TagsMatchedWithItems: [Constants.Tags.list], LatestObjects: { (items: [ListModel]) in
//      response(items)
//    }) { (error) in
//      print("error on getting all lists: \(error)")
//    }
  }

  public func add(List list: ListModel, response: ((Bool) -> Void)?) {
//    quickDB.insert(model: list, withTag: Constants.Tags.list, completion: response)
  }
  
  public func delete(List id: UUID, response: @escaping (Bool) -> Void) {
    // [TODO]
  }
  
  public func update(List list: ListModel, components: [ComponentType], response: @escaping (Bool) -> Void) {
    // [TODO]
  }
  // MARK:- Icon
  
}
