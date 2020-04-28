//
//  OnboardingViewModel.swift
//  ListHub
//
//  Created by Salar Soleimani on 2020-04-27.
//  Copyright © 2020 BEKSAS. All rights reserved.
//

import UIKit
import Domain
import RxCocoa

final class OnboardingViewModel: ViewModelType {
// MARK:- Constants
  private let navigator: OnboardingNavigator
// MARK:- Initialization
  init(navigator: OnboardingNavigator) {
    self.navigator = navigator
  }
// MARK:- Functions
  func transform(input: OnboardingViewModel.Input) -> OnboardingViewModel.Output {
    let isLastPage = BehaviorRelay<Bool>(value: false)
    
    let index = input.indexPath.map { [makeOnboardingData] (_, indexPath) -> Int in
      isLastPage.accept((makeOnboardingData().count != indexPath.row + 1))
      return indexPath.row
    }
    
    let letsGoTrigger = input.letsGoTrigger.do(onNext: { [navigator] _ in
      Defaults.isOnboardingWatched = true
      navigator.toLists()
    }).skip(1)
    
    return Output(items: makeOnboardingData(), pageControllIndex: index, isLastPage: isLastPage.asDriver(), letsGoTrigger: letsGoTrigger)
  }
  
  private func makeOnboardingData() -> [OnboardingItemViewModel] {
    var models = [OnboardingItemViewModel]()
    for i in 1...3 {
      let element = OnboardingItemViewModel(title: "onboarding_title\(i)".localize(), description: "onboarding_description\(i)".localize(), image: UIImage(named: "img_onboarding\(i)") ?? UIImage())
      models.append(element)
    }
    return models
  }
}
// MARK:- Inputs & Outputs
extension OnboardingViewModel {
  struct Input {
    let indexPath: Driver<(cell: UICollectionViewCell, at: IndexPath)>
    let letsGoTrigger: Driver<Void>
  }
  struct Output {
    let items: [OnboardingItemViewModel]
    let pageControllIndex: Driver<Int>
    let isLastPage: Driver<Bool>
    let letsGoTrigger: Driver<Void>
  }
}
