//
//  Book + JSON.swift
//  AC3.2-Unit5Mid-Retake
//
//  Created by Marcel Chaucer on 1/6/17.
//  Copyright © 2017 C4Q. All rights reserved.
//

import Foundation

extension Book {
    func populate(from bookDict: [String:Any]) {
        let title = bookDict["title"] as? String ?? ""
        let bookDescription = bookDict["description"] as? String ?? ""
        let author = bookDict["author"] as? String ?? ""
        
        self.title = title
        self.bookDescription = bookDescription
        self.author = author
    }

}

