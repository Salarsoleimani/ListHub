//
//  IconCellViewModel.swift
//  ListHub
//
//  Created by Salar Soleimani on 2020-05-05.
//  Copyright © 2020 BEKSAS. All rights reserved.
//

import UIKit
import Domain

struct IconCellViewModel {
  let model: IconModel
  let colorModel: ColorModel
  let image: UIImage
  var color: UIColor
  
  init(model: IconModel, colorModel: ColorModel) {
    self.model = model
    self.colorModel = colorModel
    self.image = model.getImage()
    self.color = colorModel.getColor()
  }
}
