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
    
    let inputs = AddListViewModel.Input(delegate: self, iconTrigger: iconButton.rx.tap.asDriver(), selectingComponent: selectedComponent, addListTrigger: addListBarButton.rx.tap.asDriver(), title: titleTextField.rx.text.orEmpty.asDriver(), description: descriptionTextField.rx.text.orEmpty.asDriver())
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
  }
  private func registerCells() {
    let allComponentsCellXib = UINib(nibName: "AllComponentsCell", bundle: nil)
    componentsCollectionView.register(allComponentsCellXib, forCellWithReuseIdentifier: "cellId")
  }
}
enum CreationComponentType {
  case simpleString(SimpleStringCreationViewModel)
  public init(from decoder: Decoder) throws {
    let container = try decoder.singleValueContainer()
    
    if let element = try? container.decode(SimpleStringCreationViewModel.self) {
      self = .simpleString(element)
      return
    }
    
    throw DecodingError.typeMismatch(CreationComponentType.self, DecodingError.Context(codingPath: decoder.codingPath, debugDescription: "Wrong type for CreationComponentType"))
  }
  func makeCell() -> BEKGenericCollectionCellType?{
    switch self {
    case .simpleString(let vm):
      let cell = vm.getCell()
      return cell
    }
  }
  func asInput(listUID: UUID) -> InputComponentType{
    switch self {
    case .simpleString(let vm):
      return vm.asInput(listUID)
    }
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
