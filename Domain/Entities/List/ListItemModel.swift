//
//  ListItemModel.swift
//  Domain
//
//  Created by Behrad Kazemi on 5/6/20.
//  Copyright © 2020 BEKSAS. All rights reserved.
//

import Foundation
import QuickDB
public struct ListItemModel: QuickIndexable {
	public let uid: UUID
	public let modelUID: UUID
	public let title: String
}
