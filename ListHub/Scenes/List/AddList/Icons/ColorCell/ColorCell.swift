//
//  ColorCell.swift
//  ListHub
//
//  Created by Salar Soleimani on 2020-05-04.
//  Copyright © 2020 BEKSAS. All rights reserved.
//

import UIKit
import BEKListKit

class ColorCell: UICollectionViewCell {
  // MARK:- Outlets
  @IBOutlet weak var colorView: UIView!
  // MARK:- Variables
  var viewModel: ColorModel!
  // MARK:- LifeCycles

  override func awakeFromNib() {
    super.awakeFromNib()
    setupUI()
  }
  // MARK:- Functions

  private func setupUI() {
    colorView.layer.cornerRadius = 32
  }
  
}
// MARK:- BEKListKit
extension ColorCell: BEKBindableCell {
  typealias ViewModeltype = ColorModel
  func bindData(withViewModel viewModel: ColorModel) {
    self.viewModel = viewModel
    colorView.backgroundColor = viewModel.getColor()
  }
}
