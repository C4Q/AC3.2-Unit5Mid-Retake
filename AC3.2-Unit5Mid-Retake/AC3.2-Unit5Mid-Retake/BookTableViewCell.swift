//
//  BookTableViewCell.swift
//  AC3.2-Unit5Mid-Retake
//
//  Created by Edward Anchundia on 1/6/17.
//  Copyright © 2017 C4Q. All rights reserved.
//

import UIKit

class BookTableViewCell: UITableViewCell {

    @IBOutlet weak var bookView: BookView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
