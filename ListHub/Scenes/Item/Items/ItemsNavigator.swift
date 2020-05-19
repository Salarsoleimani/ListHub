//  
//  ItemsNavigator.swift
//  ListHub
//
//  Created by Salar Soleimani on 2020-05-17.
//  Copyright © 2020 BEKSAS. All rights reserved.
//

import Foundation

final class ItemsNavigator: Navigator {
  func setup(_ listId: UUID) {
    let vc = ItemsController.initFromNib()
    vc.viewModel = ItemsViewModel(navigator: self, dbManager: servicePackage.dbManager, listId: listId)
    navigationController.pushViewController(vc, animated: true)
  }
  func toAddItem(_ listId: UUID) {
    AddItemNavigator(navigationController: navigationController, servicePackage: servicePackage).setup(listId)
  }
}
