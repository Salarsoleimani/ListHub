//
//  SimpleStringOutputCell.swift
//  ListHub
//
//  Created by Behrad Kazemi on 5/2/20.
//  Copyright © 2020 BEKSAS. All rights reserved.
//

import UIKit
import BEKListKit

class SimpleStringOutputCell: UICollectionViewCell {

	@IBOutlet weak var titleLabel: UILabel!
	@IBOutlet weak var contentLabel: UILabel!
	
	var viewModel: SimpleStringOutputViewModel!
	override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
}

extension SimpleStringOutputCell: BEKBindableCell{
	typealias ViewModelType = SimpleStringOutputViewModel
	
	func bindData(withViewModel viewModel: SimpleStringOutputViewModel) {
		self.viewModel = viewModel
		titleLabel.text = viewModel.titleName
		contentLabel.text = viewModel.inputValue
	}
}
