//  
//  AddItemViewModel.swift
//  ListHub
//
//  Created by Salar Soleimani on 2020-05-17.
//  Copyright © 2020 BEKSAS. All rights reserved.
//

import Foundation
import Domain

final class AddItemViewModel: ViewModelType {
// MARK:- Constants
  private let navigator: AddItemNavigator
// MARK:- Initialization
  init(navigator: AddItemNavigator) {
    self.navigator = navigator
  }
// MARK:- Functions
  func transform(input: AddItemViewModel.Input) -> AddItemViewModel.Output {

    return Output()
  }
}
// MARK:- Inputs & Outputs
extension AddItemViewModel {
  struct Input {

  }
  struct Output {

  }
}
