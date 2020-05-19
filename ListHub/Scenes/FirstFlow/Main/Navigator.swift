//
//  Navigator.swift
//  ListHub
//
//  Created by Salar Soleimani on 2020-04-14.
//  Copyright © 2020 BEKSAS. All rights reserved.
//

import UIKit
import Domain

class Navigator: NSObject {
  internal let navigationController: UINavigationController
  internal let servicePackage: ServicePackage

  init(navigationController: UINavigationController, servicePackage: ServicePackage) {
    self.navigationController = navigationController
    self.servicePackage = servicePackage
  }
}


