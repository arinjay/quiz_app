//
//  CustomTableViewCell.swift
//  Quiz_App
//
//  Created by Arinjay on 23/03/18.
//  Copyright © 2018 Arinjay. All rights reserved.
//

import UIKit

protocol YourCellDelegate: class {
    func didTapButton(_ sender: UIButton)
}

class CustomTableViewCell: UITableViewCell {

    @IBOutlet weak var questionLabel: UILabel!
    
    weak var delegate: YourCellDelegate?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    @IBAction func buttonTapped(_ sender: UIButton) {
        delegate?.didTapButton(sender)
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
