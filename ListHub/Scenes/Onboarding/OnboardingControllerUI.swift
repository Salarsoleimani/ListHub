//
//  OnboardingControllerUI.swift
//  ListHub
//
//  Created by Salar Soleimani on 2020-04-27.
//  Copyright © 2020 BEKSAS. All rights reserved.
//

import UIKit
import BEKListKit

extension OnboardingController {
  func setupUI() {    
    setupCollectionView()
    view.backgroundColor = ListHubColor.background.value
  }
  private func setupCollectionView() {
    let size = CGSize(width: StaticConstants.mainScreenWidth, height: StaticConstants.mainScreenHeight)
    onboardingCollectionView.isPagingEnabled = true
    onboardingCollectionView.collectionViewLayout = BEKCollectionLayoutComposer.makeLayout(ForItemSize: size, minimumLineSpacing:  8.0, minimumInteritemSpacing: 8.0, estimatedItemSize: .zero, scrollDirection: .horizontal)
  }
}
