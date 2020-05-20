//
//  PhoneNumberCreationCell.swift
//  ListHub
//
//  Created by Salar Soleimani on 2020-05-17.
//  Copyright © 2020 BEKSAS. All rights reserved.
//

import UIKit
import BEKListKit
import RxSwift

class PhoneNumberCreationCell: UICollectionViewCell {
  @IBOutlet weak var titleLabel: UILabel!
  @IBOutlet weak var titleTextField: UITextField!
  var viewModel: PhoneNumberCreationViewModel!
  let disposeBag = DisposeBag()
  
  override func awakeFromNib() {
    super.awakeFromNib()
  }
  
}
// MARK:- BEKListKit
extension PhoneNumberCreationCell: BEKBindableCell {
  typealias ViewModeltype = PhoneNumberCreationViewModel
  func bindData(withViewModel viewModel: PhoneNumberCreationViewModel) {
    self.viewModel = viewModel
    titleTextField.rx.text.orEmpty.subscribe(onNext: { [unowned self] (text) in
      self.viewModel.title = text
    }).disposed(by: disposeBag)
  }
}
