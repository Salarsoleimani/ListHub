//  
//  AddListViewModel.swift
//  ListHub
//
//  Created by Salar Soleimani on 2020-05-03.
//  Copyright © 2020 BEKSAS. All rights reserved.
//

import Foundation
import Domain

final class AddListViewModel: ViewModelType {
// MARK:- Constants
  private let navigator: AddListNavigator
// MARK:- Initialization
  init(navigator: AddListNavigator) {
    self.navigator = navigator
  }
// MARK:- Functions
  func transform(input: AddListViewModel.Input) -> AddListViewModel.Output {

    return Output()
  }
}
// MARK:- Inputs & Outputs
extension AddListViewModel {
  struct Input {

  }
  struct Output {

  }
}
