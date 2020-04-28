//
//  OnboardingNavigator.swift
//  DoSomething
//
//  Created by Salar Soleimani on 2020-04-14.
//  Copyright © 2020 BEKSAS. All rights reserved.
//

final class OnboardingNavigator: Navigator {
  func setup() {
    let vc = OnboardingController.initFromNib()
    vc.viewModel = OnboardingViewModel(navigator: self)
    navigationController.pushViewController(vc, animated: true)
    //AnalyticLogProvider.logNavigator(name: NSStringFromClass(type(of: self)), functionName: "setup")
  }
  func toLists() {
    ListsNavigator(navigationController: navigationController).setup()
  }
}
