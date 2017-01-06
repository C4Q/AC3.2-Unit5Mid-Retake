//
//  Book+JSON.swift
//  AC3.2-Unit5Mid-Retake
//
//  Created by Thinley Dorjee on 1/6/17.
//  Copyright © 2017 C4Q. All rights reserved.
//

import Foundation

extension Book {
    func populate(with dict: [String:Any]) {
        if let title = dict["title"] as? String,
            let author = dict["author"] as? String{
    
            self.title = title
            self.author = author

        }
    }
}
