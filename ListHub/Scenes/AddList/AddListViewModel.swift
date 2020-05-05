//  
//  AddListViewModel.swift
//  ListHub
//
//  Created by Salar Soleimani on 2020-05-03.
//  Copyright © 2020 BEKSAS. All rights reserved.
//

import Foundation
import Domain
import RxCocoa

final class AddListViewModel: ViewModelType {
// MARK:- Constants
  private let navigator: AddListNavigator
// MARK:- Initialization
  init(navigator: AddListNavigator) {
    self.navigator = navigator
  }
// MARK:- Functions
  func transform(input: AddListViewModel.Input) -> AddListViewModel.Output {
    let iconTrigger = input.iconTrigger.map { [navigator] _ -> Void in
      navigator.toIcons(delegate: input.delegate)
    }
    return Output(iconTrigger: iconTrigger)
  }
}
// MARK:- Inputs & Outputs
extension AddListViewModel {
  struct Input {
    let delegate: AddListControllerDelegate
    let iconTrigger: Driver<Void>
  }
  struct Output {
    let iconTrigger: Driver<Void>
  }
}
