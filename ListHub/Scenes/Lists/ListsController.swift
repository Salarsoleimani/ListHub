//
//  ListsController.swift
//  ListHub
//
//  Created by Salar SOleimani on 4/13/20.
//  Copyright © 2020 BEKSAS. All rights reserved.
//

import UIKit
import BEKListKit
import RxSwift

class ListsController: UIViewController {
  // MARK:- Outlets
  @IBOutlet weak var myListsCollectionView: BEKMultiCellCollection!
  // MARK:- variables
  var viewModel: ListsViewModel!
  // MARK:- Constants
  let settingBarButton = UIBarButtonItem(image: #imageLiteral(resourceName: "ic_add_list"), style: .plain, target: nil, action: nil)
  let addListBarButton = UIBarButtonItem(image: #imageLiteral(resourceName: "ic_add_list"), style: .plain, target: nil, action: nil)
  
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
    let inputs = ListsViewModel.Input(selectedList: myListsCollectionView.rx.itemSelected.asDriver(), addListTrigger: addListBarButton.rx.tap.asDriver(), openSettingTrigger: settingBarButton.rx.tap.asDriver())
    let outputs = viewModel.transform(input: inputs)
    
    outputs.addListTrigger.drive().disposed(by: disposeBag)
    outputs.openSettingTrigger.drive().disposed(by: disposeBag)
  }
}

