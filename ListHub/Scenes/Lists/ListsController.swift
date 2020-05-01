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
import AMScrollingNavbar

class ListsController: UIViewController {
  // MARK:- Outlets
  @IBOutlet weak var myListsCollectionView: BEKMultiCellCollection!
  
  @IBOutlet weak var lottieContainerView: UIView!
  @IBOutlet weak var lottieLabel: UILabel!
  @IBOutlet weak var lottieAnimationView: UIView!

  // MARK:- variables
  var viewModel: ListsViewModel!
  // MARK:- Constants
  let settingBarButton = UIBarButtonItem(image: #imageLiteral(resourceName: "ic_setting"), style: .plain, target: nil, action: nil)
  let addListBarButton = UIBarButtonItem(image: #imageLiteral(resourceName: "ic_add_list"), style: .plain, target: nil, action: nil)
    
  let disposeBag = DisposeBag()
  // MARK:- LifeCycles
  override func viewDidLoad() {
    super.viewDidLoad()
    setupUI()
    setupDelegates()
    bindData()
    followNavHideWhenScrolling(true)
  }
  
  override func viewDidDisappear(_ animated: Bool) {
    followNavHideWhenScrolling(false)
  }
  // MARK:- Actions
  
  // MARK:- Functions
  private func bindData() {
    let inputs = ListsViewModel.Input(selectedList: myListsCollectionView.rx.itemSelected.asDriver(), addListTrigger: addListBarButton.rx.tap.asDriver(), openSettingTrigger: settingBarButton.rx.tap.asDriver())
    let outputs = viewModel.transform(input: inputs)
    
    outputs.addListTrigger.drive().disposed(by: disposeBag)
    outputs.openSettingTrigger.drive().disposed(by: disposeBag)
    outputs.lists.subscribe(onNext: { [myListsCollectionView] (lists) in
      for list in lists {
        let vm = ListItemViewModel(model: list)
        let cell = BEKGenericCell.Collection<ListCell>(viewModel: vm)
        myListsCollectionView?.push(cell: cell)
      }
    }).disposed(by: disposeBag)
    outputs.showList.drive(lottieContainerView.rx.isHidden).disposed(by: disposeBag)
  }
  private func setupDelegates() {
    myListsCollectionView.delegate = self
  }
  private func followNavHideWhenScrolling(_ isStartToFollow: Bool) {
    if let navigationController = navigationController as? ScrollingNavigationController {
      isStartToFollow ? navigationController.followScrollView(myListsCollectionView) : navigationController.stopFollowingScrollView()
    }
  }
}
extension ListsController: UICollectionViewDelegateFlowLayout {
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
    return UIEdgeInsets(top: 16, left: 16, bottom: 16, right: 16)
  }
}
