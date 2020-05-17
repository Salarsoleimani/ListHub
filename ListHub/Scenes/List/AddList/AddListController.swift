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
import Domain
class AddListController: UIViewController {
  // MARK:- Outlets
  @IBOutlet weak var iconButton: UIButton!
  @IBOutlet weak var titleTextField: UITextField!
  @IBOutlet weak var descriptionTextField: UITextField!
  
  @IBOutlet weak var selectedComponentsCollectionView: BEKMultiCellCollection!
  @IBOutlet weak var componentsCollectionView: UICollectionView!
  
  // MARK:- variables
  var viewModel: AddListViewModel!
  // MARK:- Constants
  let addListBarButton = UIBarButtonItem(title: "Add", style: .plain, target: nil, action: nil)
  
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
    let defaultIcon = BehaviorRelay<IconCellViewModel>(value:
      IconCellViewModel(model: IconModel(id: 0, name: "", tags: [String]()), colorModel: ColorModel(id: 0, name: "green", value: "#217C6B")))
    let inputs = AddListViewModel.Input(delegate: self, iconTrigger: iconButton.rx.tap.asDriver(), selectingComponent: selectedComponent, addListTrigger: addListBarButton.rx.tap.asDriver(), title: titleTextField.rx.text.orEmpty.asDriver(), description: descriptionTextField.rx.text.orEmpty.asDriver(), icon: defaultIcon)
    
    let outputs = viewModel.transform(input: inputs)
    
    outputs.iconTrigger.drive().disposed(by: disposeBag)
    
    outputs.components.drive(componentsCollectionView.rx.items(cellIdentifier: "cellId", cellType: AllComponentsCell.self)) { item, viewModel, cell in
      cell.configure(viewModel)
    }.disposed(by: disposeBag)
    
    outputs.selectedComponent.subscribe(onNext: { [selectedComponentsCollectionView] (whichComponent) in
      if let whichComponent = whichComponent, let cell = whichComponent.makeCell() {
        selectedComponentsCollectionView?.push(cell: cell)
        
      }
      
    }).disposed(by: disposeBag)
    
    outputs.addListTrigger.drive().disposed(by: disposeBag)
    titleTextField.rx.text.orEmpty.subscribe(onNext: { [viewModel] (titleText) in
      viewModel?.listModel.title = titleText
    }).disposed(by: disposeBag)
    descriptionTextField.rx.text.orEmpty.subscribe(onNext: { [viewModel] (descText) in
      viewModel?.listModel.description = descText
    }).disposed(by: disposeBag)
  }
  private func registerCells() {
    let allComponentsCellXib = UINib(nibName: "AllComponentsCell", bundle: nil)
    componentsCollectionView.register(allComponentsCellXib, forCellWithReuseIdentifier: "cellId")
  }
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
