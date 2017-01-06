//
//  Book+JSON.swift
//  AC3.2-Unit5Mid-Retake
//
//  Created by Sabrina Ip on 1/6/17.
//  Copyright © 2017 C4Q. All rights reserved.
//

import Foundation

extension Book {
    func populate(with dict: [String:Any]) {
        guard let title = dict["title"] as? String else { return }
        self.title = title
        
        if let author = dict["author"] as? String {
            self.author = author
        } else {
            self.author = nil
        }
        
        if let bookDescription = dict["description"] as? String {
            self.bookDescription = bookDescription
        } else {
            self.bookDescription = nil
        }
        
    }
}
