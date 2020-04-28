//
//  Application.swift
//  ListHub
//
//  Created by Salar Soleimani on 2020-04-14.
//  Copyright © 2020 BEKSAS. All rights reserved.
//

import UIKit
import Domain
import Siren
import SwiftRater
import IQKeyboardManagerSwift

final class Application {
  static let shared = Application()
  
  private init() {
    //AppAnalytics.shared.setup()
  }
  
  func configureMainInterface(in window: UIWindow) {
    let mainNavigationController = MainNavigationController()
    window.rootViewController = mainNavigationController
    window.makeKeyAndVisible()
    SplashNavigator(navigationController: mainNavigationController).setup()
  }
  
  func setupApplicationConfigurations() {
    LanguageManager.shared.defaultLanguage = .deviceLanguage
    IQKeyboardManager.shared.enable = true
    setupRateManager()
    setupUpdateManager()
    resetNotificationBadge()
    setupNavigationBarUI()
//    GADMobileAds.sharedInstance().start(completionHandler: nil)
//    GADMobileAds.sharedInstance().requestConfiguration.testDeviceIdentifiers = ["72ef0c1b55cbe0034f0d1a5fd0fca1df"]
  }
  private func setupNavigationBarUI() {
    UIBarButtonItem.appearance().setBackButtonTitlePositionAdjustment(UIOffset(horizontal: -1000, vertical: 0), for:UIBarMetrics.default)
    let attrs: [NSAttributedString.Key: Any] = [
      .foregroundColor: UIColor.white,
      .font: ListHubFont(.installed(.montserrat, .bold), size: .standard(.h1)).instance
    ]
    
    if #available(iOS 11.0, *) {
      UINavigationBar.appearance().prefersLargeTitles = true
      UINavigationBar.appearance().largeTitleTextAttributes = attrs
    }
    UINavigationBar.appearance().barTintColor = .red // [TODO]
    
    // buttons
    UINavigationBar.appearance().tintColor = .blue // [TODO]
    UINavigationBar.appearance().titleTextAttributes = attrs
    UINavigationBar.appearance().isTranslucent = true
  }
  
  private func setupUpdateManager() {
    Siren.shared.wail()
    Siren.shared.rulesManager = RulesManager(majorUpdateRules: Rules(promptFrequency: .immediately, forAlertType: .force), minorUpdateRules: Rules(promptFrequency: .daily, forAlertType: .option), patchUpdateRules: Rules(promptFrequency: .weekly, forAlertType: .skip), revisionUpdateRules: Rules.default, showAlertAfterCurrentVersionHasBeenReleasedForDays: 3)
  }
  
  private func resetNotificationBadge() {
    UIApplication.shared.applicationIconBadgeNumber = 0
  }
  
  private func setupRateManager() {
    SwiftRater.alertCancelTitle = "Rate_alertCancelTitle".localize()
    SwiftRater.alertMessage = "Rate_alertMessage".localize()
    SwiftRater.alertRateLaterTitle = "Rate_alertRateLaterTitle".localize()
    SwiftRater.alertRateTitle = "Rate_alertRateTitle".localize()
    SwiftRater.alertTitle = "Rate_alertTitle".localize()
    
    SwiftRater.daysUntilPrompt = 2
    SwiftRater.usesUntilPrompt = 10
    SwiftRater.significantUsesUntilPrompt = 3
    SwiftRater.daysBeforeReminding = 1
    SwiftRater.showLaterButton = true
    SwiftRater.debugMode = true
    SwiftRater.appLaunched()
  }
  
}
