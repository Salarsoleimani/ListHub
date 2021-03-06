//  
//  ItemsControllerUI.swift
//  ListHub
//
//  Created by Salar Soleimani on 2020-05-17.
//  Copyright © 2020 BEKSAS. All rights reserved.
//

import UIKit

extension ItemsController {
  func setupUI() {
    setupNavigationUI()
  }
  private func setupNavigationUI() {
    navigationItem.rightBarButtonItem = addItemBarButton
  }
}
