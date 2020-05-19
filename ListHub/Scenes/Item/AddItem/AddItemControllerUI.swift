//  
//  AddItemUI.swift
//  ListHub
//
//  Created by Salar Soleimani on 2020-05-17.
//  Copyright © 2020 BEKSAS. All rights reserved.
//

import UIKit
import BEKListKit

extension AddItemController {
  func setupUI() {
    setupCollectionView() 
  }
  private func setupCollectionView() {
    let width = (StaticConstants.mainScreenWidth)
    let size = CGSize(width: width , height: 200)
    
    inputComponentsCollectionView.collectionViewLayout = BEKCollectionLayoutComposer.makeLayout(ForItemSize: size, scrollDirection: .vertical)

  }
}
