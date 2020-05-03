//
//  File.swift
//  ListHub
//
//  Created by Salar Soleimani on 2020-04-30.
//  Copyright © 2020 BEKSAS. All rights reserved.
//

import Foundation

struct ListHubFonts {
  static let h2Bold = SSFont(.installed(.montserrat, .bold), size: .standard(.h1)).instance
  static let h4Regular = SSFont(.installed(.montserrat, .regular), size: .standard(.h4)).instance

  // Navigation
  static let navigationLargeTitle = SSFont(.installed(.montserrat, .bold), size: .standard(.h1)).instance
  // Onboarding
  static let onboardingTitle = SSFont(.installed(.montserrat, .bold), size: .standard(.h2)).instance
  static let onboardingDescription = SSFont(.installed(.montserrat, .regular), size: .standard(.h4)).instance
  
  // Lists
  static let listCellTitle = SSFont(.installed(.montserrat, .bold), size: .standard(.h2)).instance
  static let listCellDescription = SSFont(.installed(.montserrat, .regular), size: .standard(.h4)).instance
}
