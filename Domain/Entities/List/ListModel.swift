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
  public var title: String
  public var description: String
  public var iconId: Int
  public var iconColor: String
  public var itemQuantity: Int

  public init(title: String, description: String = "", iconId: Int, iconColor: String) {
    self.uid = UUID()
    self.title = title
    self.description = description
    self.itemQuantity = 0
    self.iconId = iconId
    self.iconColor = iconColor
  }
}
