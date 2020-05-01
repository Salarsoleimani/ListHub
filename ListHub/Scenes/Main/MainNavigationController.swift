//
//  MainNavigationController.swift
//  ListHub
//
//  Created by Salar Soleimani on 2020-04-14.
//  Copyright © 2020 BEKSAS. All rights reserved.
//

import UIKit
import AMScrollingNavbar

class MainNavigationController: ScrollingNavigationController {
  override func viewDidLoad() {
    super.viewDidLoad()
    setupUI()
    setupNavigationBarUI()
  }
  private func setupUI() {
    let image = UIImage()
    navigationBar.setBackgroundImage(image, for: .default)
    navigationBar.shadowImage = image
    navigationBar.tintColor = ListHubColor.navigationButtonTint.value
  }
  private func setupNavigationBarUI() {
      UIBarButtonItem.appearance().setBackButtonTitlePositionAdjustment(UIOffset(horizontal: -1000, vertical: 0), for: .default)
      let attrs: [NSAttributedString.Key: Any] = [
        .foregroundColor: UIColor.white,
        .font: ListHubFonts.navigationLargeTitle
      ]
  //    if #available(iOS 11.0, *) {
  //      UINavigationBar.appearance().prefersLargeTitles = true
  //      UINavigationBar.appearance().largeTitleTextAttributes = attrs
  //    }
      //UINavigationBar.appearance().barTintColor = ListHubColor.navigationButtonTint.value // [TODO]
      // buttons
      UINavigationBar.appearance().titleTextAttributes = attrs
      UINavigationBar.appearance().isTranslucent = true
    }
}
