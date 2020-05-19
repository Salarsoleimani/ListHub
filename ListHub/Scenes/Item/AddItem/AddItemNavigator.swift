//  
//  AddItemNavigator.swift
//  ListHub
//
//  Created by Salar Soleimani on 2020-05-17.
//  Copyright © 2020 BEKSAS. All rights reserved.
//

import Foundation

final class AddItemNavigator: Navigator {
  func setup(_ listId: UUID) {
    let vc = AddItemController.initFromNib()
    vc.viewModel = AddItemViewModel(navigator: self, dbManager: servicePackage.dbManager, listId: listId)
    navigationController.pushViewController(vc, animated: true)
  }
}
