//
//  ListsCoachView.swift
//  ListHub
//
//  Created by Salar Soleimani on 2020-04-28.
//  Copyright © 2020 BEKSAS. All rights reserved.
//

import Instructions

extension ListsController: CoachMarksControllerDataSource {
  func setupCoachMark() {
    coachMarksController.dataSource = self
    coachMarksController.overlay.allowTap = true
    //coachMarksController.overlay.blurEffectStyle = .regular
  }
  
  func coachMarksController(_ coachMarksController: CoachMarksController, coachMarkViewsAt index: Int, madeFrom coachMark: CoachMark) -> (bodyView: CoachMarkBodyView, arrowView: CoachMarkArrowView?) {
    let coachMarkBodyView = TransparentCoachMarkBodyView()
    var coachMarkArrowView: TransparentCoachMarkArrowView? = nil
    
    coachMarkBodyView.hintLabel.text = "lists_add_coachmark".localize()
    
    if let arrowOrientation = coachMark.arrowOrientation {
      coachMarkArrowView = TransparentCoachMarkArrowView(orientation: arrowOrientation)
    }
    return (bodyView: coachMarkBodyView, arrowView: coachMarkArrowView)
    //    let coachViews = coachMarksController.helper.makeDefaultCoachViews(withArrow: true, arrowOrientation: coachMark.arrowOrientation, hintText: "lists_add_coachmark".localize(), nextText: nil)
    //    return (bodyView: coachViews.bodyView, arrowView: coachViews.arrowView)
  }
  func coachMarksController(_ coachMarksController: CoachMarksController, coachMarkAt index: Int) -> CoachMark {
    let viewRight = addListBarButton.value(forKey: "view") as! UIView
    return coachMarksController.helper.makeCoachMark(for: viewRight)
    
  }
  func numberOfCoachMarks(for coachMarksController: CoachMarksController) -> Int {
    1
  }
}
internal class TransparentCoachMarkArrowView : UIImageView, CoachMarkArrowView {
  // MARK: - Initialization
  init(orientation: CoachMarkArrowOrientation) {
    if orientation == .top {
      super.init(image: UIImage(named: "arrow-top"))
    } else {
      super.init(image: UIImage(named: "arrow-bottom"))
    }
    
    self.translatesAutoresizingMaskIntoConstraints = false
    
    self.addConstraint(NSLayoutConstraint(item: self, attribute: .width, relatedBy: .equal,
                                          toItem: nil, attribute: .notAnAttribute,
                                          multiplier: 1, constant: self.image!.size.width))
    
    self.addConstraint(NSLayoutConstraint(item: self, attribute: .height, relatedBy: .equal,
                                          toItem: nil, attribute: .notAnAttribute,
                                          multiplier: 1, constant: self.image!.size.height))
  }
  
  required init?(coder aDecoder: NSCoder) {
    fatalError("This class does not support NSCoding.")
  }
}
internal class TransparentCoachMarkBodyView : UIControl, CoachMarkBodyView {
  // MARK: - Internal properties
  var nextControl: UIControl? {
    get {
      return self
    }
  }
  
  weak var highlightArrowDelegate: CoachMarkBodyHighlightArrowDelegate? = nil
  
  var hintLabel = UITextView()
  
  // MARK: - Initialization
  override init (frame: CGRect) {
    super.init(frame: frame)
    
    self.setupInnerViewHierarchy()
  }
  
  convenience init() {
    self.init(frame: CGRect.zero)
  }
  
  required init?(coder aDecoder: NSCoder) {
    fatalError("This class does not support NSCoding.")
  }
  
  // MARK: - Private methods
  fileprivate func setupInnerViewHierarchy() {
    self.translatesAutoresizingMaskIntoConstraints = false
    
    hintLabel.backgroundColor = UIColor.clear
    hintLabel.textColor = UIColor.white
    hintLabel.font = ListHubFont(.installed(.montserrat, .regular), size: .standard(.h4)).instance
    hintLabel.isScrollEnabled = false
    hintLabel.textAlignment = .justified
    //hintLabel.layoutManager.hyphenationFactor = 1.0
    hintLabel.isEditable = false
    
    hintLabel.translatesAutoresizingMaskIntoConstraints = false
    hintLabel.isUserInteractionEnabled = false
    
    self.addSubview(hintLabel)
    
    self.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|[hintLabel]|", options: NSLayoutConstraint.FormatOptions(rawValue: 0),
                                                       metrics: nil, views: ["hintLabel": hintLabel]))
    
    self.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|[hintLabel]|", options: NSLayoutConstraint.FormatOptions(rawValue: 0),
                                                       metrics: nil, views: ["hintLabel": hintLabel]))
  }
}
