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
import Lottie

extension ListsController {
  func setupUI() {
    setupHero()
    setupNavigationUI()
    setupCollectionView()
    view.backgroundColor = ListHubColor.background.value
    
    setupLottie()
    setWalktrough()
  }
  private func setupNavigationUI() {
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
    let width = (StaticConstants.mainScreenWidth - 40) / 2
    let size = CGSize(width: width , height: width * 1.1)
    myListsCollectionView.collectionViewLayout = BEKCollectionLayoutComposer.makeLayout(ForItemSize: size, minimumLineSpacing:  8, minimumInteritemSpacing: 8, estimatedItemSize: .zero, scrollDirection: .vertical)
  }
  
  private func setupLottie() {
    let animation = AnimationView(name: "Empty")
    lottieAnimationView.contentMode = .scaleAspectFit
    lottieAnimationView.addSubview(animation)
    animation.frame = lottieAnimationView.bounds
    animation.loopMode = .repeat(3)
    animation.play()
    
    setupEmptyLabelUI()
  }
  private func setupEmptyLabelUI() {
    lottieLabel.text = "lists_empty_coachmark".localize()
    lottieLabel.font = ListHubFonts.onboardingTitle
    lottieLabel.textColor = ListHubColor.listCellTitle.value
  }
  
  private func setWalktrough() {
    showcase.backgroundAlpha = 0.9
    showcase.backgroundPromptColor = ListHubColor.walktroughBackground.value
    showcase.backgroundPromptColorAlpha = 0.95
    showcase.backgroundViewType = .full
    
    showcase.targetHolderRadius = 100
    showcase.targetHolderColor = ListHubColor.walktroughTarget.value
    showcase.aniRippleColor = ListHubColor.walktroughTarget.value

    showcase.primaryText = "lists_empty_coachmark_title".localize()
    showcase.primaryTextColor = ListHubColor.walktroughText.value
    showcase.primaryTextFont = ListHubFonts.h2Bold
    showcase.secondaryText = "lists_empty_coachmark_desc".localize()
    showcase.secondaryTextColor = ListHubColor.walktroughText.value
    showcase.secondaryTextFont = ListHubFonts.h4Regular
  }
}
