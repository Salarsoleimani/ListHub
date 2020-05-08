//  
//  AddListController.swift
//  ListHub
//
//  Created by Salar Soleimani on 2020-05-03.
//  Copyright © 2020 BEKSAS. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa
import BEKListKit

class AddListController: UIViewController {
  // MARK:- Outlets
  @IBOutlet weak var iconButton: UIButton!
  @IBOutlet weak var titleLabel: UITextField!
  @IBOutlet weak var descriptionLabel: UITextField!

  @IBOutlet weak var selectedComponentsCollectionView: BEKMultiCellCollection!
  @IBOutlet weak var componentsCollectionView: UICollectionView!

  // MARK:- variables
  var viewModel: AddListViewModel!
  // MARK:- Constants
  let disposeBag = DisposeBag()
  // MARK:- LifeCycles
  override func viewDidLoad() {
    super.viewDidLoad()
    registerCells()
    setupUI()
    bindData()
  }
  // MARK:- Actions
  
  // MARK:- Functions
  private func bindData() {
    let selectedComponent = componentsCollectionView.rx.modelSelected(ComponentsModel.self).asDriver()

    let inputs = AddListViewModel.Input(delegate: self, iconTrigger: iconButton.rx.tap.asDriver(), selectingComponent: selectedComponent)
    let outputs = viewModel.transform(input: inputs)
    
    outputs.iconTrigger.drive().disposed(by: disposeBag)
    
    outputs.components.drive(componentsCollectionView.rx.items(cellIdentifier: "cellId", cellType: AllComponentsCell.self)) { item, viewModel, cell in
      cell.configure(viewModel)
    }.disposed(by: disposeBag)
    
    outputs.selectedComponent.subscribe(onNext: { [selectedComponentsCollectionView] (whichComponent) in
      if let whichComponent = whichComponent {
        switch whichComponent {
        case .simpleString:
          selectedComponentsCollectionView?.push(cell: BEKGenericCell.Collection<SimpleStringCreationCell>(viewModel: SimpleStringCreationViewModel()))
        case .phoneString:
          print("")
        case .linkString:
          print("")
        }
      }
      
    }).disposed(by: disposeBag)
  }
  private func registerCells() {
    let allComponentsCellXib = UINib(nibName: "AllComponentsCell", bundle: nil)
    componentsCollectionView.register(allComponentsCellXib, forCellWithReuseIdentifier: "cellId")
  }
}
enum CreationComponentType: Int {
  case simpleString, phoneString, linkString
}
protocol AddListControllerDelegate {
  func iconSelected(_ icon: IconCellViewModel)
}
extension AddListController: AddListControllerDelegate {
  func iconSelected(_ icon: IconCellViewModel) {
    viewModel.icon = icon
    iconButton.tintColor = icon.color
    iconButton.setTitle("", for: .normal)
    iconButton.setImage(icon.image, for: .normal)
  }
}
