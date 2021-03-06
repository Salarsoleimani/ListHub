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
  public func add(List list: ListModel, components: [InputComponentType], response: ((Bool) -> Void)?) {
    quickDB.insert(model: list, withTag: listTag) { [insert, response] (completed) in
      if completed {
        for component in components {
          insert(component.asEnum(), list.uid.uuidString)
        }
        if response != nil {
          response!(true)
        }
      }
    }
  }
  private func insert(inputType: ComponentType.Inputs, listId: String) {
    switch inputType {
    case .simpleString(let type):
      quickDB.insert(model: type, withTag: listId)
    case .phoneNumber(let type):
      quickDB.insert(model: type, withTag: listId)
    }
  }
  
  public func get(Lists response: @escaping ([ListModel]) -> Void) {
    quickDB.getAll(TagsMatchedWithItems: [listTag], LatestObjects: { (items: [ListModel]) in
      response(items)
    }) { (error) in
      print("error on getting all lists: \(error)")
    }
  }
  
  public func delete(List id: UUID, response: ((Bool) -> Void)?) {
    quickDB.delete(ItemIds: [id], completion: response)
  }
  
  public func update(List list: ListModel, response: ((Bool) -> Void)?) {
    quickDB.update(model: list, completion: response) { (error) in
      print("error on update listId: \(list.uid.uuidString)\n with error: \(error)")
    }
  }
  
  public func add(Item item: ListItemModel, components: [OutputComponentType], response: ((Bool) -> Void)?) {
    quickDB.insert(model: item, withTag: listItemTag, completion: response)
  }
  
  public func get(ItemsForListUID: UUID, response: @escaping ([ListItemModel]) -> Void) {
    quickDB.getAll(TagsMatchedWithItems: [listItemTag], LatestObjects: { (items: [ListItemModel]) in
      response(items.filter{$0.modelUID == ItemsForListUID})
    }) { (error) in
      print("error on getting all lists: \(error)")
    }
  }
  
  public func delete(Item id: UUID, response: ((Bool) -> Void)?) {
    quickDB.delete(ItemIds: [id], completion: response)
  }
  
  public func update(Item item: ListItemModel, response: ((Bool) -> Void)?) {
    quickDB.update(model: item, completion: response) { (error) in
      print("error on update listItemId: \(item.uid.uuidString)\n with error: \(error)")
    }
  }
  
  public func add(Item input: InputComponentType, response: ((Bool) -> Void)?) {
    //quickDB.insert(model: input, withTag: inputComponent, completion: response)
  }
  
  public func get(InputComponentsForListUID: UUID, response: @escaping ([InputComponentType]) -> Void) {
    quickDB.getAll(TagsMatchedWithItems: [InputComponentsForListUID.uuidString], LatestObjects: { (simpleStringItems: [ComponentElements.SimpleString.Input]) in
      quickDB.getAll(TagsMatchedWithItems: [InputComponentsForListUID.uuidString], LatestObjects: { (phoneNumStringItems: [ComponentElements.PhoneNumber.Input]) in
        var lastResponse: [InputComponentType] = simpleStringItems
        lastResponse.append(contentsOf: phoneNumStringItems)
        response(lastResponse)
      }) { (error) in
        print("error on getting phoneString: \(error)")
      }
		}) { (error) in
      print("error on getting simpleString: \(error)")
		}
  }
  
  public func get(OutputComponentsForItemUID: UUID, response: @escaping ([OutputComponentType]) -> Void) {
    
  }
  
  public func update(Item outputs: [OutputComponentType], response: ((Bool) -> Void)?) {
    
  }
  
  public func update(Item inputs: [InputComponentType], response: ((Bool) -> Void)?) {
    
  }
  
  public func delete(Item input: InputComponentType, response: ((Bool) -> Void)?) {
    
  }
  

  // MARK:- Constants
  private let quickDB: QuickDB
  
  // Tags
  private let listTag = Constants.Tags.list
  private let listItemTag = Constants.Tags.listItem
  private let simpleStringInputComponentTag = Constants.Tags.simpleStringTag
  private let phoneNumberInputComponentTag = Constants.Tags.phoneNumberTag
  private let outputComponentTag = Constants.Tags.outputComponent

  // MARK:- Initialization
  public init() {
    self.quickDB = QuickDB.shared
  }
  public func resetFactory() {
    quickDB.resetFactory()
  }
//  public func add(List list: ListModel, response: ((Bool) -> Void)?) {
////    quickDB.insert(model: list, withTag: Constants.Tags.list, completion: response)
//  }
  
}
