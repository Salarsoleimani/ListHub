//
//  IconModel.swift
//  ListHub
//
//  Created by Salar Soleimani on 2020-04-28.
//  Copyright © 2020 BEKSAS. All rights reserved.
//

import UIKit

struct ColorModel: Codable {
  let id: Int
  let name: String
  let value: String
}
extension ColorModel {
  func getColor() -> UIColor {
    return UIColor(hexString: value)!
  }
}


