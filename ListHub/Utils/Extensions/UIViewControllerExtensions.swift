//
//  UIViewControllerExtensions.swift
//  ListHub
//
//  Created by Salar Soleimani on 2020-04-27.
//  Copyright © 2020 BEKSAS. All rights reserved.
//

import UIKit

extension UIViewController {
  static func initFromNib() -> Self {
    func instanceFromNib<T: UIViewController>() -> T {
      return T(nibName: String(describing: self), bundle: nil)
    }
    return instanceFromNib()
  }
}

