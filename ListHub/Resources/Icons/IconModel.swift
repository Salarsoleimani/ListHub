//
//  IconModel.swift
//  ListHub
//
//  Created by Salar Soleimani on 2020-04-28.
//  Copyright © 2020 BEKSAS. All rights reserved.
//

import UIKit

struct IconModel: Codable {
  let id: Int
  let name: String
  let tags: [String]
}
extension IconModel {
  func getImage() -> UIImage {
    return UIImage(named: name) ?? UIImage()
  }
}
