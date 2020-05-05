//  
//  AddListController.swift
//  ListHub
//
//  Created by Salar Soleimani on 2020-05-03.
//  Copyright © 2020 BEKSAS. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class AddListController: UIViewController {
  // MARK:- Outlets
  @IBOutlet weak var iconButton: UIButton!
  // MARK:- variables
  var viewModel: AddListViewModel!
  // MARK:- Constants
  let disposeBag = DisposeBag()
  // MARK:- LifeCycles
  override func viewDidLoad() {
    super.viewDidLoad()
    setupUI()
    bindData()
  }
  // MARK:- Actions
  
  // MARK:- Functions
  private func bindData() {
    let inputs = AddListViewModel.Input(delegate: self, iconTrigger: iconButton.rx.tap.asDriver())
    let outputs = viewModel.transform(input: inputs)
    
    outputs.iconTrigger.drive().disposed(by: disposeBag)
  }
}
protocol AddListControllerDelegate {
  func iconSelected(_ icon: IconCellViewModel)
}
extension AddListController: AddListControllerDelegate {
  func iconSelected(_ icon: IconCellViewModel) {
    iconButton.tintColor = icon.color
    iconButton.setImage(icon.image, for: .normal)
  }
}
