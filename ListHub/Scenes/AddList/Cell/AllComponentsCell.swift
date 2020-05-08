//
//  AllComponentsCell.swift
//  ListHub
//
//  Created by Salar Soleimani on 2020-05-07.
//  Copyright © 2020 BEKSAS. All rights reserved.
//

import UIKit

class AllComponentsCell: UICollectionViewCell {
  @IBOutlet weak var titleLabel: UILabel!
  
  override func awakeFromNib() {
    super.awakeFromNib()
    // Initialization code
  }
  func configure(_ model: ComponentsModel) {
    titleLabel.text = model.name
  }
  
}
