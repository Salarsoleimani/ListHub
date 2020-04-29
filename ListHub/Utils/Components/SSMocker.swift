//
//  SSMocker.swift
//  ListHub
//
//  Created by Salar Soleimani on 2020-04-28.
//  Copyright © 2020 BEKSAS. All rights reserved.
//

import Foundation

public struct SSMocker<T: Codable> {
  static func loadGenericObjectsFromLocalJson(fileName: String) -> [T] {
    let path = Bundle.main.path(forResource: fileName, ofType: "json")
    let data = try! Data(contentsOf: URL(fileURLWithPath: path!), options: .alwaysMapped)
    
    let objects = try! JSONDecoder().decode([T].self, from: data)
    return objects
    
  }
  
  static func loadGenericObjectFromLocalJson(fileName: String) -> T {
    let path = Bundle.main.path(forResource: fileName, ofType: "json")
    let data = try! Data(contentsOf: URL(fileURLWithPath: path!), options: .alwaysMapped)
    
    let object = try! JSONDecoder().decode(T.self, from: data)
    return object
  }
}
