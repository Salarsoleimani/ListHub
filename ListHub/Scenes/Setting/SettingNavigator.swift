//
//  SettingNavigator.swift
//  ListHub
//
//  Created by Salar Soleimani on 2020-04-28.
//  Copyright © 2020 BEKSAS. All rights reserved.
//

import Hero

final class SettingNavigator: Navigator {
  func setup() {
    let vc = SettingController.initFromNib()
    vc.viewModel = SettingViewModel(navigator: self)
    let nav = UINavigationController(rootViewController: vc)
    vc.isHeroEnabled = true
    vc.heroModalAnimationType = .zoomSlide(direction: HeroDefaultAnimationType.Direction.left)
    //navigationController.pushViewController(vc, animated: true)
    //navigationController.heroNavigationAnimationType = .zoomSlide(direction: HeroDefaultAnimationType.Direction.left)
    navigationController.heroReplaceViewController(with: nav)
    //navigationController.pushViewController(vc, animated: true)
    //AnalyticLogProvider.logNavigator(name: NSStringFromClass(type(of: self)), functionName: "setup")
  }

  func toLists() {
    
  }
}
