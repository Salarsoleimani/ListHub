//
//  ServicePackage.swift
//  ListHub
//
//  Created by Salar Soleimani on 2020-05-07.
//  Copyright © 2020 BEKSAS. All rights reserved.
//

import Foundation
import Domain

final class ServicePackage {
  public let dbManager: DatabaseManagerProtocol
  public init(dbManager: DatabaseManagerProtocol) {
    self.dbManager = dbManager
  }
}
