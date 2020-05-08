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
  public var itemQuantity: Int

  public init(title: String, description: String = "", iconId: Int, iconColor: Int) {
    self.uid = UUID()
    self.title = title
    self.description = description
    self.itemQuantity = 0
    self.iconId = iconId
    self.iconColor = iconColor
  }
}
