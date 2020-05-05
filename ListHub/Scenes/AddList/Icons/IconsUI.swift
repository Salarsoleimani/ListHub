//  
//  IconsUI.swift
//  ListHub
//
//  Created by Salar Soleimani on 2020-05-04.
//  Copyright © 2020 BEKSAS. All rights reserved.
//

import UIKit
import BEKListKit

extension IconsController {
  func setupUI() {
    view.backgroundColor = LHColors.background.value
    //setupIconsCollectionView()
    //setupColorsCollectionView()
  }
  private func setupColorsCollectionView() {
    let width = 64
    let size = CGSize(width: width , height: width)
    colorsCollectionView.collectionViewLayout = BEKCollectionLayoutComposer.makeLayout(ForItemSize: size, minimumLineSpacing:  0, minimumInteritemSpacing: 0, estimatedItemSize: .zero, scrollDirection: .horizontal)
  }
  private func setupIconsCollectionView() {
    let width = (StaticConstants.mainScreenWidth) / 6
    let size = CGSize(width: width , height: width)
    iconsCollectionView.collectionViewLayout = BEKCollectionLayoutComposer.makeLayout(ForItemSize: size, minimumLineSpacing:  8, minimumInteritemSpacing: 8, estimatedItemSize: .zero, scrollDirection: .vertical)
  }
}
