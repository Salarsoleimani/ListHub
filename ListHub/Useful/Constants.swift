//
//  Constants.swift
//  VirusCare
//
//  Created by Salar Soleimani on 2020-02-28.
//  Copyright © 2020 BEKApps. All rights reserved.
//

import UIKit

// testAdUnitIds
let testAdBannerUnitID = "ca-app-pub-3940256099942544/2934735716"
let testAdInterstitialUnitID = "ca-app-pub-3940256099942544/4411468910"
let testAdInterstitialVideoUnitID = "ca-app-pub-3940256099942544/5135589807"
let testAdRewardedVideoUnitID = "ca-app-pub-3940256099942544/1712485313"
let testAdNativeAdvancedUnitID = "ca-app-pub-3940256099942544/3986624511"
let testAdNativeAdvancedVideoUnitID = "ca-app-pub-3940256099942544/2521693316"
// my ads unit ids
let adBannerHomeBottom = "ca-app-pub-1135958579537389/1781667294"
let adRewardedHome = "ca-app-pub-1135958579537389/6650850596"


enum Constants {
  enum Keys: String {
    case fontScale = "com.storageKey.fontScale"
    case fontFamily = "com.storageKey.fontFamily"
    case isAdsRemoved = "com.storageKey.isAdsRemoved"
    case isOnboardingWatched = "com.storageKey.isOnboardingWatched"
    
    case appOpenedCount = "com.storageKey.appOpenedCount"
  }
  enum Links: String {
    case youtube = "https://www.youtube.com/channel/UCVv19836gsoYpdpU_FTE21Q"
    case instagram = "https://www.instagram.com/viruscareapp"
    case mail = "coronacareapp@gmail.com"
    case mailSubject = "About virus care application"
  }
  enum HeroIds: String {
    case toSetting = "Hero.ToSetting"
  }
  struct Radius {
    static let listCellRadius: CGFloat = 10
  }
}
