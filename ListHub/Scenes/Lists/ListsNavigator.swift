//
//  ListsNavigator.swift
//  ListHub
//
//  Created by Salar Soleimani on 2020-04-14.
//  Copyright © 2020 BEKSAS. All rights reserved.
//

import Foundation

final class ListsNavigator: Navigator {
  func setup() {
    let vc = ListsController.initFromNib()
    vc.viewModel = ListsViewModel(navigator: self, engine: appEngine)
    navigationController.setViewControllers([vc], animated: true)
    //AnalyticLogProvider.logNavigator(name: NSStringFromClass(type(of: self)), functionName: "setup")
  }
  func toAddList() {
    
  }
  func toList() {
    
  }
  func toSetting() {
    SettingNavigator(navigationController: navigationController, appEngine: appEngine).setup()
  }
}
