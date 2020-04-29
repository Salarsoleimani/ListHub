//
//  EntityModel.swift
//  Domain
//
//  Created by Salar Soleimani on 2020-04-14.
//  Copyright © 2020 BEKSAS. All rights reserved.
//

import QuickDB

public struct ListModel: QuickIndexable {
  public var uid: UUID
  public let title: String
  public let description: String
  public let iconId: Int
  public let iconColor: Int
  public let itemQuantity: Int
  public let templateType: ListTemplateType
  //public let components: [ComponentType]?
  public init(title: String, description: String = "", iconId: Int, iconColor: Int, templateType: ListTemplateType) {
    self.uid = UUID()
    self.title = title
    self.description = description
    self.itemQuantity = 1
    self.iconId = iconId
    self.iconColor = iconColor
    self.templateType = templateType
  }
}
