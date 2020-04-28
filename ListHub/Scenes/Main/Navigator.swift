//
//  Navigator.swift
//  ListHub
//
//  Created by Salar Soleimani on 2020-04-14.
//  Copyright © 2020 BEKSAS. All rights reserved.
//

import UIKit

class Navigator: NSObject {
  internal let navigationController: UINavigationController
  
  init(navigationController: UINavigationController) {
    self.navigationController = navigationController
  }
}
