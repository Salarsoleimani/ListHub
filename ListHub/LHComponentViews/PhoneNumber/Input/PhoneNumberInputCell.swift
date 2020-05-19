//
//  PhoneNumberInputCell.swift
//  ListHub
//
//  Created by Behrad Kazemi on 5/3/20.
//  Copyright © 2020 BEKSAS. All rights reserved.
//

import UIKit
import BEKListKit
import RxSwift

class PhoneNumberInputCell: UICollectionViewCell {
  
  @IBOutlet weak var titleLabel: UILabel!
  @IBOutlet weak var titleTextField: UITextField!
  let disposeBag = DisposeBag()
  var viewModel: PhoneNumberInputViewModel!
  override func awakeFromNib() {
    super.awakeFromNib()
    // Initialization code
  }
  
}
// MARK:- BEKListKit
extension PhoneNumberInputCell: BEKBindableCell {
  typealias ViewModeltype = PhoneNumberInputViewModel
  func bindData(withViewModel viewModel: PhoneNumberInputViewModel) {
    self.viewModel = viewModel
    titleTextField.rx.text.orEmpty.subscribe(onNext: { [unowned self] (text) in
      self.viewModel.title = text
    }).disposed(by: disposeBag)
  }
}
