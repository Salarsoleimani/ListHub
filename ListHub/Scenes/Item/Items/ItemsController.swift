//  
//  ItemsController.swift
//  ListHub
//
//  Created by Salar Soleimani on 2020-05-17.
//  Copyright © 2020 BEKSAS. All rights reserved.
//

import UIKit
import RxSwift

class ItemsController: UIViewController {
  // MARK:- Outlets
  
  // MARK:- variables
  let addItemBarButton = UIBarButtonItem(image: #imageLiteral(resourceName: "ic_add_list"), style: .plain, target: nil, action: nil)

  var viewModel: ItemsViewModel!
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
    let input = ItemsViewModel.Input(addItemTrigger: addItemBarButton.rx.tap.asDriver())
    let outputs = viewModel.transform(input: input)
    outputs.openAddItem.drive().disposed(by: disposeBag)
  }
}
