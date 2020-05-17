//  
//  AddListUI.swift
//  ListHub
//
//  Created by Salar Soleimani on 2020-05-03.
//  Copyright © 2020 BEKSAS. All rights reserved.
//

import UIKit
import BEKListKit

extension AddListController {
  func setupUI() {
    setupSelectedComponentsCVUI()
    setupNavigationUI()
    view.backgroundColor = LHColors.background.value
  }
  private func setupSelectedComponentsCVUI() {
    let width = StaticConstants.mainScreenWidth
    let size = CGSize(width: width , height: 100)
    selectedComponentsCollectionView.collectionViewLayout = BEKCollectionLayoutComposer.makeLayout(ForItemSize: size, minimumLineSpacing:  0, minimumInteritemSpacing: 0, estimatedItemSize: .zero, scrollDirection: .vertical)
  }
  private func setupNavigationUI() {
    navigationItem.rightBarButtonItem = addListBarButton
  }
}


