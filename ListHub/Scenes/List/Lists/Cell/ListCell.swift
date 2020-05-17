//
//  ListCell.swift
//  ListHub
//
//  Created by Salar Soleimani on 2020-04-29.
//  Copyright © 2020 BEKSAS. All rights reserved.
//

import UIKit
import BEKListKit

class ListCell: UICollectionViewCell {
// MARK:- Outlets
  @IBOutlet weak var containerView: UIView!

  @IBOutlet weak var iconImageView: UIImageView!
  @IBOutlet weak var titleLabel: UILabel!
  @IBOutlet weak var quantityLabel: UILabel!
// MARK:- Variables
  var viewModel: ListItemViewModel!
// MARK:- LifeCycles
  override func awakeFromNib() {
    super.awakeFromNib()
    setupUI()
  }
// MARK:- Functions
  private func setupUI() {
    containerView.layer.cornerRadius = Constants.Radius.listCellRadius
    containerView.backgroundColor = LHColors.listCellBackground.value

    titleLabel.font = LHFonts.listCellTitle
    titleLabel.numberOfLines = 2
    titleLabel.textColor = LHColors.listCellTitle.value
    
    quantityLabel.font = LHFonts.listCellDescription
    quantityLabel.textColor = LHColors.listCellDescription.value
  }
}
// MARK:- BEKListKit
extension ListCell: BEKBindableCell {
  typealias ViewModeltype = ListItemViewModel
  func bindData(withViewModel viewModel: ListItemViewModel) {
    self.viewModel = viewModel
    iconImageView.image = viewModel.iconImage
    iconImageView.tintColor = viewModel.iconColor
    titleLabel.text = viewModel.title
    quantityLabel.text = viewModel.quantity
  }
}
