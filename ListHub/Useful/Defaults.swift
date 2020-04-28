//
//  Defaults.swift
//  ListHub
//
//  Created by Salar Soleimani on 2020-04-14.
//  Copyright © 2020 BEKSAS. All rights reserved.
//

import Foundation

/// UserDefaults for Application layer
struct Defaults {
  @UserDefault(Constants.Keys.appOpenedCount.rawValue, defaultValue: 0)
  static var appOpenedCount: Int
  
  @UserDefault(Constants.Keys.isAdsRemoved.rawValue, defaultValue: false)
  static var isAdsRemoved: Bool
  
  @UserDefault(Constants.Keys.isOnboardingWatched.rawValue, defaultValue: false)
  static var isOnboardingWatched: Bool
  
  @UserDefault(Constants.Keys.fontScale.rawValue, defaultValue: 1.0)
  static var fontScale: Double
  
  @UserDefault(Constants.Keys.fontFamily.rawValue, defaultValue: "Montserrat")
  static var fontFamily: String
}
