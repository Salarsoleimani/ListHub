//
//  SettingViewModel.swift
//  ListHub
//
//  Created by Salar Soleimani on 2020-04-28.
//  Copyright © 2020 BEKSAS. All rights reserved.
//

import Domain
import RxCocoa

final class SettingViewModel: ViewModelType {
// MARK:- Constants
  private let navigator: SettingNavigator
// MARK:- Initialization
  init(navigator: SettingNavigator) {
    self.navigator = navigator
  }
// MARK:- Functions
  func transform(input: SettingViewModel.Input) -> SettingViewModel.Output {
    
    let dismissTrigger = input.dismissTrigger.map { [navigator] _ -> Void in
      navigator.toLists()
    }
    return Output(dismissTrigger: dismissTrigger)
  }
}
// MARK:- Inputs & Outputs
extension SettingViewModel {
  struct Input {
    let dismissTrigger: Driver<Void>
  }
  struct Output {
    let dismissTrigger: Driver<Void>
  }
}
