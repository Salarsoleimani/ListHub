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
import Instructions

class ListsController: UIViewController {
  // MARK:- Outlets
  @IBOutlet weak var myListsCollectionView: BEKMultiCellCollection!
  // MARK:- variables
  var viewModel: ListsViewModel!
  // MARK:- Constants
  let settingBarButton = UIBarButtonItem(image: #imageLiteral(resourceName: "ic_add_list"), style: .plain, target: nil, action: nil)
  let addListBarButton = UIBarButtonItem(image: #imageLiteral(resourceName: "ic_add_list"), style: .plain, target: nil, action: nil)
  
  let coachMarksController = CoachMarksController()
  
  let disposeBag = DisposeBag()
  // MARK:- LifeCycles
  override func viewDidLoad() {
    super.viewDidLoad()
    setupUI()
    bindData()
    setupCoachMark()
  }
  override func viewDidAppear(_ animated: Bool) {
    super.viewDidAppear(animated)
    coachMarksController.start(in: .currentWindow(of: self))
  }
  override func viewWillDisappear(_ animated: Bool) {
    super.viewWillDisappear(animated)
    coachMarksController.stop(immediately: true)
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
