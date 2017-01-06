//
//  Book+JSON.swift
//  AC3.2-Unit5Mid-Retake
//
//  Created by Eashir Arafat on 1/6/17.
//  Copyright © 2017 C4Q. All rights reserved.
//

import Foundation

extension Book {
    func populate(with dict: [String:Any]) {
        if let title = dict["title"] as? String {
            self.title = title
        }
        else { title = nil }
        
        if let descrip = dict["description"] as? String {
            self.descrip = descrip
        }
        else { descrip = nil }
        
        if let author = dict["author"] as? String {
            self.author = author
        }
        else { author = nil }
        /*
         
 */
    }
}
