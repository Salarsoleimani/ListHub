//
//  UIViewExtensions.swift
//  ListHub
//
//  Created by Salar Soleimani on 2020-05-05.
//  Copyright © 2020 BEKSAS. All rights reserved.
//

import UIKit

// Inspired by hackingwithswift ange you can see the samples here: https://www.hackingwithswift.com/articles/155/advanced-uiview-shadow-effects-using-shadowpath
public enum ShadowType {
  case `default`, rounded, curved
}
public extension UIView {
  func addShadow(_ type: ShadowType, color: UIColor) {
    let shadowRadius: CGFloat = 5
    layer.shadowColor = color.cgColor
    layer.shadowOpacity = 1
    if type == .default {
      return
    } else if type == .curved {
      let height = bounds.height
      let width = bounds.width
      layer.shadowOffset = CGSize(width: 0, height: 10)
      layer.shadowOpacity = 0.5

      // how strong to make the curling effect
      let curveAmount: CGFloat = 20
      let shadowPath = UIBezierPath()

      // the top left and right edges match our view, indented by the shadow radius
      shadowPath.move(to: CGPoint(x: shadowRadius, y: 0))
      shadowPath.addLine(to: CGPoint(x: width - shadowRadius, y: 0))

      // the bottom-right edge of our shadow should overshoot by the size of our curve
      shadowPath.addLine(to: CGPoint(x: width - shadowRadius, y: height + curveAmount))

      // the bottom-left edge also overshoots by the size of our curve, but is added with a curve back up towards the view
      shadowPath.addCurve(to: CGPoint(x: shadowRadius, y: height + curveAmount), controlPoint1: CGPoint(x: width, y: height - shadowRadius), controlPoint2: CGPoint(x: 0, y: height - shadowRadius))
      layer.shadowPath = shadowPath.cgPath
      return
    }
    layer.shadowPath = UIBezierPath(rect: bounds).cgPath
    layer.shadowRadius = shadowRadius
    layer.shadowOffset = .zero
    
  }
  
  func addBottomShadow(color: UIColor) {
    layer.shadowColor = color.cgColor
    let shadowSize: CGFloat = 20
    let shadowDistance: CGFloat = 20
    let contactRect = CGRect(x: -shadowSize, y: bounds.height - (shadowSize * 0.4) + shadowDistance, width: bounds.width + shadowSize * 2, height: shadowSize)
    layer.shadowPath = UIBezierPath(ovalIn: contactRect).cgPath
    layer.shadowRadius = 5
    layer.shadowOpacity = 0.4
  }
  
  func addDepthShadow(color: UIColor, shadowOffsetX: CGFloat) {
    layer.shadowColor = color.cgColor
    let height = bounds.height
    let width = bounds.width
    let shadowWidth: CGFloat = 1.2
    let shadowHeight: CGFloat = 0.5
    let shadowRadius: CGFloat = 5

    let shadowPath = UIBezierPath()
    shadowPath.move(to: CGPoint(x: shadowRadius / 2, y: height - shadowRadius / 2))
    shadowPath.addLine(to: CGPoint(x: width, y: height - shadowRadius / 2))
    shadowPath.addLine(to: CGPoint(x: width * shadowWidth + shadowOffsetX, y: height + (height * shadowHeight)))
    shadowPath.addLine(to: CGPoint(x: width * -(shadowWidth - 1) + shadowOffsetX, y: height + (height * shadowHeight)))
    layer.shadowPath = shadowPath.cgPath

    layer.shadowRadius = shadowRadius
    layer.shadowOffset = .zero
    layer.shadowOpacity = 0.2
  }
}
