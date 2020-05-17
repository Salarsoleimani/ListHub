//
//  OnboardingController.swift
//  DoSomething
//
//  Created by Salar Soleimani on 2020-04-14.
//  Copyright © 2020 BEKSAS. All rights reserved.
//

import UIKit
import BEKListKit
import RxSwift
import RxCocoa

final class OnboardingController: UIViewController {
  // MARK:- Outlets
  @IBOutlet weak var onboardingCollectionView: BEKMultiCellCollection!
  @IBOutlet weak var onboardingPageControll: UIPageControl!
  @IBOutlet weak var letsGoButton: UIButton!
  // MARK:- Constants
  let disposeBag = DisposeBag()
  // MARK:- Variables
  var viewModel: OnboardingViewModel!
  // MARK:- LifeCycles
  override func viewDidLoad() {
    super.viewDidLoad()
    setupUI()
    bindData()
  }
  // MARK:- Actions

  // MARK:- Functions
  private func bindData() {
    let inputs = OnboardingViewModel.Input(indexPath: onboardingCollectionView.rx.willDisplayCell.asDriver(), letsGoTrigger: letsGoButton.rx.tap.asDriver())
    let outputs = viewModel.transform(input: inputs)
    
    outputs.items.forEach { (item) in
      onboardingCollectionView.push(cell: BEKGenericCell.Collection<OnboardingCell>(viewModel: item))
    }
    outputs.pageControllIndex.drive(onboardingPageControll.rx.currentPage).disposed(by: disposeBag)
    outputs.isLastPage.drive(letsGoButton.rx.isHidden).disposed(by: disposeBag)
    outputs.letsGoTrigger.drive().disposed(by: disposeBag)
  }
  
}
