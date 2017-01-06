//
//  BookView.swift
//  AC3.2-Unit5Mid-Retake
//
//  Created by Edward Anchundia on 1/6/17.
//  Copyright © 2017 C4Q. All rights reserved.
//

import UIKit

class BookView: UIView {
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var authorLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        if let view = Bundle.main.loadNibNamed("BookView", owner: self, options: nil)?.first as? UIView {
            self.addSubview(view)
            view.frame = self.bounds
        }
    }
}
