//
//  CreationViewModelProtocol.swift
//  ListHub
//
//  Created by Salar Soleimani on 2020-05-17.
//  Copyright © 2020 BEKSAS. All rights reserved.
//

import BEKListKit
import UIKit

protocol CreationViewModelProtocol: Codable {
  associatedtype CellType: BEKBindableCell, UICollectionViewCell
  func getCell() -> BEKGenericCell.Collection<CellType>
  func asEnum() -> CreationComponentType
}
