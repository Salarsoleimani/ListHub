//
//  SimpleStringInputCell.swift
//  ListHub
//
//  Created by Behrad Kazemi on 5/2/20.
//  Copyright © 2020 BEKSAS. All rights reserved.
//

import UIKit
import BEKListKit

class SimpleStringInputCell: UICollectionViewCell {

	@IBOutlet weak var titleLabel: UILabel!
	@IBOutlet weak var titleTextField: UITextField!
	var viewModel: SimpleStringInputViewModel!
	override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
}

extension SimpleStringInputCell: BEKBindableCell {
	typealias ViewModelType = SimpleStringInputViewModel
	
	func bindData(withViewModel viewModel: SimpleStringInputViewModel) {
		self.viewModel = viewModel
		titleLabel.text = viewModel.titleName
		titleTextField.text = viewModel.inputValue
	}
}
