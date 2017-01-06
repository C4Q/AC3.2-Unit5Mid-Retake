//
//  Book+JSON.swift
//  AC3.2-Unit5Mid-Retake
//
//  Created by Madushani Lekam Wasam Liyanage on 1/6/17.
//  Copyright © 2017 C4Q. All rights reserved.
//

import Foundation

extension Book {
    
    func populate(from dict: [String:Any]) {
        
        if let title = dict["title"] as? String,
            let author = dict["author"] as? String {
                let bookDescription = nullToNil(value: dict["description"])
                self.title = title
                self.bookDescription = bookDescription
                self.author = author
        }
        
    }
    
}

func nullToNil(value: Any?) -> String? {
    if value is NSNull {
        return nil
    } else {
        return value as! String?
    }
}
