//
//  AppEngine.swift
//  AppEngine
//
//  Created by Salar Soleimani on 2020-04-28.
//  Copyright © 2020 BEKSAS. All rights reserved.
//

import Domain
import DatabaseManager

final public class AppEngineManager: EngineManagerProtocol {
  private let dbManager: DatabaseManagerProtocol

  public init() {
    self.dbManager = DBManager()
  }
  
  public func getLists(response: @escaping ([ListModel]) -> Void) {
    dbManager.get(Lists: response)
  }
  
    public func add(List list: ListModel, components: [InputComponentType], response: ((Bool) -> Void)?) {
    
  }
}
