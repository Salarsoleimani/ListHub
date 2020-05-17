//
//  IconCell.swift
//  ListHub
//
//  Created by Salar Soleimani on 2020-05-04.
//  Copyright © 2020 BEKSAS. All rights reserved.
//

import UIKit
import BEKListKit

class IconCell: UICollectionViewCell {
  // MARK:- Outlets
  @IBOutlet weak var iconImageView: UIImageView!

  // MARK:- Variables
  var viewModel: IconCellViewModel!
  // MARK:- LifeCycles

  override func awakeFromNib() {
    super.awakeFromNib()
    setupUI()
  }
  // MARK:- Functions
  func bindData(withViewModel viewModel: IconCellViewModel) {
    self.viewModel = viewModel
    iconImageView.image = viewModel.image
    iconImageView.tintColor = viewModel.color

  }
  private func setupUI() {
  }
  
}
// MARK:- BEKListKit
//extension IconCell: BEKBindableCell {
//  typealias ViewModeltype = IconCellViewModel
//  
//}
