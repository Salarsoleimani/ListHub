//
//  SettingUI.swift
//  ListHub
//
//  Created by Salar Soleimani on 2020-04-28.
//  Copyright © 2020 BEKSAS. All rights reserved.
//

import UIKit
import Hero

extension SettingController {
  func setupUI() {
    setupHero()
    navigationItem.title = "setting_navigation_title".localize()
      
    view.backgroundColor = UIColor.red
  }
  private func setupHero() {
    isHeroEnabled = true
    hero.isEnabled = true
    
    //view.heroID = Constants.HeroIds.toSetting.rawValue
  }
}
