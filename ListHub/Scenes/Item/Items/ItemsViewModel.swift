//  
//  ItemsViewModel.swift
//  ListHub
//
//  Created by Salar Soleimani on 2020-05-17.
//  Copyright © 2020 BEKSAS. All rights reserved.
//

import Foundation
import Domain

final class ItemsViewModel: ViewModelType {
// MARK:- Constants
  private let navigator: ItemsNavigator
// MARK:- Initialization
  init(navigator: ItemsNavigator) {
    self.navigator = navigator
  }
// MARK:- Functions
  func transform(input: ItemsViewModel.Input) -> ItemsViewModel.Output {

    return Output()
  }
}
// MARK:- Inputs & Outputs
extension ItemsViewModel {
  struct Input {

  }
  struct Output {

  }
}
