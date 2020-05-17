//  
//  AddListNavigator.swift
//  ListHub
//
//  Created by Salar Soleimani on 2020-05-03.
//  Copyright © 2020 BEKSAS. All rights reserved.
//

import Foundation
import RxCocoa
import Domain

final class AddListNavigator: Navigator {
  private let allLists: BehaviorRelay<ListModel>
  init(navigationController: UINavigationController, servicePackage: ServicePackage, allLists: BehaviorRelay<ListModel>) {
    self.allLists = allLists
    super.init(navigationController: navigationController, servicePackage: servicePackage)
  }
  func setup() {
    let vc = AddListController.initFromNib()
    vc.viewModel = AddListViewModel(navigator: self)
    navigationController.pushViewController(vc, animated: true)
  }
  func toIcons(delegate: AddListControllerDelegate, icon: BehaviorRelay<IconCellViewModel>) {
    IconsNavigator(navigationController: navigationController, servicePackage: servicePackage).setup(delegate: delegate, icon: icon)
  }
  func popToLists(_ newList: ListModel) {
    allLists.accept(newList)
    navigationController.popViewController(animated: true)
  }
}
