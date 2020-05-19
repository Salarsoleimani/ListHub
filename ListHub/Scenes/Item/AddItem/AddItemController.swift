//  
//  AddItemController.swift
//  ListHub
//
//  Created by Salar Soleimani on 2020-05-17.
//  Copyright © 2020 BEKSAS. All rights reserved.
//

import UIKit
import BEKListKit
import RxSwift

class AddItemController: UIViewController {
  // MARK:- Outlets
  @IBOutlet weak var inputComponentsCollectionView: BEKMultiCellCollection!

  // MARK:- variables
  var viewModel: AddItemViewModel!
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
    let input = AddItemViewModel.Input()
    let outputs = viewModel.transform(input: input)
    outputs.inputCells.do(onNext: { [inputComponentsCollectionView] (cells) in
      inputComponentsCollectionView?.push(cells: cells)
    }).drive().disposed(by: disposeBag)
  }
}
