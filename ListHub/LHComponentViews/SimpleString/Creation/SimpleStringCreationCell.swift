//
//  SimpleStringCreationCell.swift
//  ListHub
//
//  Created by Behrad Kazemi on 5/6/20.
//  Copyright © 2020 BEKSAS. All rights reserved.
//

import UIKit
import BEKListKit

class SimpleStringCreationCell: UICollectionViewCell {
  @IBOutlet weak var titleLabel: UILabel!
  @IBOutlet weak var titleTextField: UITextField!
  var viewModel: SimpleStringCreationViewModel!
  override func awakeFromNib() {
    super.awakeFromNib()
  }
  
}
// MARK:- BEKListKit
extension SimpleStringCreationCell: BEKBindableCell {
  typealias ViewModeltype = SimpleStringCreationViewModel
  func bindData(withViewModel viewModel: SimpleStringCreationViewModel) {
    self.viewModel = viewModel
  }
}
