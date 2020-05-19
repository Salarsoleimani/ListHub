//
//  ListsNavigator.swift
//  ListHub
//
//  Created by Salar Soleimani on 2020-04-14.
//  Copyright © 2020 BEKSAS. All rights reserved.
//

import RxCocoa
import Domain

final class ListsNavigator: Navigator {
  func setup() {
    let vc = ListsController.initFromNib()
    vc.viewModel = ListsViewModel(navigator: self, dbManager: servicePackage.dbManager)
    navigationController.isNavigationBarHidden = false
    navigationController.setViewControllers([vc], animated: true)
    //AnalyticLogProvider.logNavigator(name: NSStringFromClass(type(of: self)), functionName: "setup")
  }
  func toAddList(_ lists: BehaviorRelay<ListModel>) {
    AddListNavigator(navigationController: navigationController, servicePackage: servicePackage, allLists: lists).setup()
  }
  func toListItems(listId: UUID) {
    ItemsNavigator(navigationController: navigationController, servicePackage: servicePackage).setup(listId)
  }
  func toSetting() {
    SettingNavigator(navigationController: navigationController, servicePackage: servicePackage).setup()
  }
}
