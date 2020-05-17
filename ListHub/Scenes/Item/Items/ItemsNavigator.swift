//  
//  ItemsNavigator.swift
//  ListHub
//
//  Created by Salar Soleimani on 2020-05-17.
//  Copyright © 2020 BEKSAS. All rights reserved.
//

import Foundation

final class ItemsNavigator: Navigator {
  func setup() {
    let vc = ItemsController.initFromNib()
    vc.viewModel = ItemsViewModel(navigator: self)
    navigationController.pushViewController(vc, animated: true)
  }
}
