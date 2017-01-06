//
//  extension_Books.swift
//  AC3.2-Unit5Mid-Retake
//
//  Created by Miti Shah on 1/6/17.
//  Copyright © 2017 C4Q. All rights reserved.
//

import Foundation

extension Books {
    func populate(from dict: [String:Any]) {
        if let title = dict["title"] as? String,
            let author = dict["author"] as? String,
            let bookDescription = dict["description"] as? String {
            
            self.title = title
            self.author = author
            self.bookDescription = bookDescription
            
        }
    }
}
