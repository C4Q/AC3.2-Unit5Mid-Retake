//
//  Book+Extension.swift
//  AC3.2-Unit5Mid-Retake
//
//  Created by Erica Y Stevens on 1/6/17.
//  Copyright © 2017 C4Q. All rights reserved.
//

import Foundation

extension Book {
    func populate(from dict: [String:Any]) {
        if let title = dict["title"] as? String?,
            let author = dict["author"] as? String?,
            let abstract = dict["description"] as? String? {
            self.title = title ?? nil
                self.author = author ?? nil
                self.abstract = abstract ?? nil
        }
    }
}
