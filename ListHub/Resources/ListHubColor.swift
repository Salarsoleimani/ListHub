//
//  ListHubColors.swift
//  ListHub
//
//  Created by Salar Soleimani on 2020-04-14.
//  Copyright © 2020 BEKSAS. All rights reserved.
//

import Foundation
import UIKit

enum ListHubColor {
  case background
  
  case navigationButtonTint
  
  case listCellBackground
  case listCellTitle
  case listCellDescription
  case listCellShadow
  
  case custom(hex: Int, alpha: Double)
  case customWithDarkModeString(hexForDarkMode: Int, hexForLightMode: Int, alpha: Double)
  case customWithDarkModeColor(colorForDarkMode: UIColor, colorForLightMode: UIColor, alpha: Double)
  
  func withAlpha(_ alpha: Double) -> UIColor {
    return self.value.withAlphaComponent(CGFloat(alpha))
  }
}

extension ListHubColor {
  
  var value: UIColor {
    var instanceColor = UIColor.clear
    
    switch self {
    // Shared
    case .background:
      instanceColor = UIColor.UITraitCollectionColor(darkModeColor: UIColor(hex: 0x232323), lightModeColor: UIColor(hex: 0xF9F9F9))
      
    // Navigation
    case .navigationButtonTint:
      instanceColor = UIColor.UITraitCollectionColor(darkModeColor: UIColor(hex: 0xF2F2F2), lightModeColor: UIColor(hex: 0x686868))
      
    // Lists
    case .listCellBackground:
      instanceColor = UIColor.UITraitCollectionColor(darkModeColor: UIColor(hex: 0x2F2F2F), lightModeColor: UIColor(hex: 0xF5F5F5).withAlphaComponent(0.5))
    case .listCellTitle:
      instanceColor = UIColor.UITraitCollectionColor(darkModeColor: UIColor(hex: 0xF2F2F2), lightModeColor: UIColor(hex: 0x686868))
    case .listCellDescription:
      instanceColor = UIColor(hex: 0x7F7F7F)
    case .listCellShadow:
      instanceColor = UIColor.UITraitCollectionColor(darkModeColor: UIColor(hex: 0x2C2C2C).withAlphaComponent(0.5), lightModeColor: UIColor(hex: 0xD8D8D8).withAlphaComponent(0.5))
      
    // Custom
    case .custom(let hexString, let opacity):
      instanceColor = UIColor(hex: hexString).withAlphaComponent(CGFloat(opacity))
    case .customWithDarkModeString(let hexStringForDarkMode, let hexStringForLightMode, let opacity):
      instanceColor = UIColor.UITraitCollectionColor(darkModeHex: hexStringForDarkMode, lightModeHex: hexStringForLightMode).withAlphaComponent(CGFloat(opacity))
    case .customWithDarkModeColor(let colorForDarkMode, let colorForLightMode, let opacity):
      UIColor.UITraitCollectionColor(darkModeColor: colorForDarkMode, lightModeColor: colorForLightMode).withAlphaComponent(CGFloat(opacity))
    }
    return instanceColor
  }
}

