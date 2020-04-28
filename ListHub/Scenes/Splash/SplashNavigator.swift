//
//  SplashNavigator.swift
//
//  Created by Behrad Kazemi on 12/29/18.
//  Copyright © 2018 Behrad Kazemi. All rights reserved.
//

import Foundation

final class SplashNavigator: Navigator {
  func setup() {
    let vc = SplashViewController.initFromNib()
    vc.viewModel = SplashViewModel(navigator: self)
    navigationController.viewControllers = [vc]
    //AnalyticLogProvider.logNavigator(name: NSStringFromClass(type(of: self)), functionName: "setup")
  }
  func toOnboarding() {
    OnboardingNavigator(navigationController: navigationController).setup()
  }
  
  func toLists() {
    ListsNavigator(navigationController: navigationController).setup()
  }
}
