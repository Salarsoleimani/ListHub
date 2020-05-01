//
//  OnboardingCell.swift
//  DoSomething
//
//  Created by Salar Soleimani on 2020-04-18.
//  Copyright © 2020 Salar Soleimani. All rights reserved.
//

import UIKit
import BEKListKit

class OnboardingCell: UICollectionViewCell {
// MARK:- Outlets
  @IBOutlet weak var imageView: UIImageView!
  @IBOutlet weak var titleLabel: UILabel!
  @IBOutlet weak var descriptionLabel: UILabel!
// MARK:- Variables
  var viewModel: OnboardingItemViewModel!
// MARK:- LifeCycles
  override func awakeFromNib() {
    super.awakeFromNib()
    setupUI()
  }
// MARK:- Functions
  private func setupUI() {
    titleLabel.font = ListHubFonts.onboardingTitle
    descriptionLabel.font = ListHubFonts.onboardingDescription
    descriptionLabel.numberOfLines = 0
  }
}
// MARK:- BEKListKit
extension OnboardingCell: BEKBindableCell {
  typealias ViewModeltype = OnboardingItemViewModel
  func bindData(withViewModel viewModel: OnboardingItemViewModel) {
    self.viewModel = viewModel
    imageView.image = viewModel.image
    titleLabel.text = viewModel.title
    descriptionLabel.text = viewModel.description
  }
}
