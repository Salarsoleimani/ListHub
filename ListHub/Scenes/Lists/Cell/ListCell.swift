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
    containerView.backgroundColor = ListHubColor.listCellBackground.value

    titleLabel.font = ListHubFonts.listCellTitle
    titleLabel.numberOfLines = 2
    titleLabel.textColor = ListHubColor.listCellTitle.value
    
    quantityLabel.font = ListHubFonts.listCellDescription
    quantityLabel.textColor = ListHubColor.listCellDescription.value
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
