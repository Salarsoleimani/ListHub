//  
//  IconsViewModel.swift
//  ListHub
//
//  Created by Salar Soleimani on 2020-05-04.
//  Copyright © 2020 BEKSAS. All rights reserved.
//

import Foundation
import Domain
import RxSwift
import RxCocoa

final class IconsViewModel: ViewModelType {
// MARK:- Constants
  private let navigator: IconsNavigator
// MARK:- Initialization
  init(navigator: IconsNavigator) {
    self.navigator = navigator
  }
// MARK:- Functions
  func transform(input: IconsViewModel.Input) -> IconsViewModel.Output {
    let colors = getColors()
    let randomColor = colors.randomElement() ?? ColorModel(id: 0, name: "green", value: "#217C6B")
    let icons = getIcons().map{IconCellViewModel(model: $0, colorModel: randomColor)}
    
    let outputIcons = Driver.combineLatest(Driver.just(icons), input.selectedColor).map { (oldIconsVM, selectedColor) -> [IconCellViewModel] in
      var newIconsVm = [IconCellViewModel]()
      for oldIcon in oldIconsVM {
        newIconsVm.append(IconCellViewModel(model: oldIcon.model, colorModel: selectedColor))
      }
      return newIconsVm
    }.startWith(icons)
    let iconSelected = input.selectedIcon.map { [navigator] selectedIcon -> Void in
      navigator.popView(WithIcon: selectedIcon)
    }
    return Output(icons: outputIcons, colors: Driver.just(colors), selectedIconTrigger: iconSelected)
  }
  func getIcons() -> [IconModel] {
    SSMocker<IconModel>.loadGenericObjectsFromLocalJson(fileName: "Icons")
  }
  func getColors() -> [ColorModel] {
    SSMocker<ColorModel>.loadGenericObjectsFromLocalJson(fileName: "Colors")
  }
}
// MARK:- Inputs & Outputs
extension IconsViewModel {
  struct Input {
    let selectedColor: Driver<ColorModel>
    let selectedIcon: Driver<IconCellViewModel>
  }
  struct Output {
    let icons: Driver<[IconCellViewModel]>
    let colors: Driver<[ColorModel]>
    let selectedIconTrigger: Driver<Void>
  }
}
