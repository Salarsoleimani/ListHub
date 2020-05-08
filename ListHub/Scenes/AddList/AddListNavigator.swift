//  
//  AddListNavigator.swift
//  ListHub
//
//  Created by Salar Soleimani on 2020-05-03.
//  Copyright © 2020 BEKSAS. All rights reserved.
//

import Foundation

final class AddListNavigator: Navigator {
  func setup() {
    let vc = AddListController.initFromNib()
    vc.viewModel = AddListViewModel(navigator: self)
    navigationController.pushViewController(vc, animated: true)
  }
  func toIcons(delegate: AddListControllerDelegate) {
    IconsNavigator(navigationController: navigationController, servicePackage: servicePackage).setup(delegate: delegate)
  }
}
