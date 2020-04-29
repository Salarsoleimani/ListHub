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
    let titleFont = ListHubFont(.installed(.montserrat, .bold), size: .standard(.h2)).instance
    let quantityFont = ListHubFont(.installed(.montserrat, .regular), size: .standard(.h4)).instance
    titleLabel.font = titleFont
    quantityLabel.font = quantityFont
    titleLabel.numberOfLines = 2
    [titleLabel, quantityLabel].forEach{$0?.textColor = ListHubColor.text.value}
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
