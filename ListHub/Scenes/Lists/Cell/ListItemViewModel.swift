//
//  ListItemViewModel.swift
//  ListHub
//
//  Created by Salar Soleimani on 2020-04-29.
//  Copyright © 2020 BEKSAS. All rights reserved.
//

import UIKit
import Domain

struct ListItemViewModel {
  let model: ListModel
  let title: String
  let iconImage: UIImage
  let iconColor: UIColor
  let quantity: String
  
  init(model: ListModel) {
    self.model = model
    self.title = model.title
    self.iconImage = UIImage(named: "ic_\(model.iconId)") ?? UIImage()
    self.iconColor = UIColor(hex: model.iconColor)
    let quantity = model.itemQuantity
    let itemLabel = quantity > 1 ? "items" : "item"
    self.quantity = "\(quantity) \(itemLabel)"
  }
}

