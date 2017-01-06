//
//  BooksTableViewCell.swift
//  AC3.2-Unit5Mid-Retake
//
//  Created by Annie Tung on 1/6/17.
//  Copyright © 2017 C4Q. All rights reserved.
//

import UIKit

class BooksTableViewCell: UITableViewCell {
    
    static let CellIdentifier = "bookCell"

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var authorLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
