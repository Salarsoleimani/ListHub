//  
//  IconsNavigator.swift
//  ListHub
//
//  Created by Salar Soleimani on 2020-05-04.
//  Copyright © 2020 BEKSAS. All rights reserved.
//

import Foundation

final class IconsNavigator: Navigator {
  fileprivate var iconsVC: IconsController?
  fileprivate var delegate: AddListControllerDelegate?
  func setup(delegate: AddListControllerDelegate) {
    iconsVC = IconsController.initFromNib()
    self.delegate = delegate
    iconsVC!.viewModel = IconsViewModel(navigator: self)
    if let lastVc = navigationController.viewControllers.last {
      lastVc.present(iconsVC!, animated: true, completion: nil)
    }
  }
  
  func popView(WithIcon icon: IconCellViewModel) {
    delegate?.iconSelected(icon)
    iconsVC?.dismiss(animated: true, completion: nil)
  }
}
