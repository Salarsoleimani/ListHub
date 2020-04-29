//
//  Navigator.swift
//  ListHub
//
//  Created by Salar Soleimani on 2020-04-14.
//  Copyright © 2020 BEKSAS. All rights reserved.
//

import UIKit
import Domain
import AppEngine

class Navigator: NSObject {
  internal let navigationController: UINavigationController
  internal let appEngine: EngineManagerProtocol

  init(navigationController: UINavigationController, appEngine: EngineManagerProtocol) {
    self.navigationController = navigationController
    self.appEngine = appEngine
  }
}


