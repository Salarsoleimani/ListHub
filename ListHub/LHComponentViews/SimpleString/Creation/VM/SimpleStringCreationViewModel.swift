//
//  SimpleStringCreationViewModel.swift
//  ListHub
//
//  Created by Behrad Kazemi on 5/6/20.
//  Copyright © 2020 BEKSAS. All rights reserved.
//

import Domain
import BEKListKit
import UIKit

protocol CreationViewModelProtocol: Codable {
  associatedtype CellType: BEKBindableCell, UICollectionViewCell
  func getCell() -> BEKGenericCell.Collection<CellType>
  func asEnum() -> CreationComponentType
}
struct SimpleStringCreationViewModel: CreationViewModelProtocol {
  func asEnum() -> CreationComponentType {
    return .simpleString(self)
  }
  
  func getCell() -> BEKGenericCell.Collection<SimpleStringCreationCell> {
    return BEKGenericCell.Collection<SimpleStringCreationCell>(viewModel: self)
  }
  
  typealias CellType = SimpleStringCreationCell
 
  var title: String
  func asInput(_ listUID: UUID) -> InputComponentType {
    return ComponentElements.SimpleString.Input(title: title, listUID: listUID)
  }
}
