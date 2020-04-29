//
//  ListsControllerUI.swift
//  ListHub
//
//  Created by Salar Soleimani on 2020-04-28.
//  Copyright © 2020 BEKSAS. All rights reserved.
//

import UIKit
import Hero
import BEKListKit

extension ListsController {
  func setupUI() {
    setupHero()
    setupNavigationUI()
    setupCollectionView()
    view.backgroundColor = ListHubColor.background.value
  }
  private func setupNavigationUI() {
    navigationController?.setNavigationBarHidden(false, animated: false)
    navigationItem.title = "lists_navigation_title".localize()
    navigationItem.rightBarButtonItem = addListBarButton
    navigationItem.leftBarButtonItem = settingBarButton
  }
  private func setupHero() {
    isHeroEnabled = true
    hero.isEnabled = true
    //view.heroID = Constants.HeroIds.toSetting.rawValue
    heroModalAnimationType = .pageIn(direction: .right)

  }
  private func setupCollectionView() {
    let width = (StaticConstants.mainScreenWidth - 48) / 2
    let size = CGSize(width: width , height: width)
    myListsCollectionView.collectionViewLayout = BEKCollectionLayoutComposer.makeLayout(ForItemSize: size, minimumLineSpacing:  8.0, minimumInteritemSpacing: 8.0, estimatedItemSize: size, scrollDirection: .vertical)
  }
}
