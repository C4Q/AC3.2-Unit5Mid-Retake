//
//  Book+JSON.swift
//  AC3.2-Unit5Mid-Retake
//
//  Created by Annie Tung on 1/6/17.
//  Copyright © 2017 C4Q. All rights reserved.
//

import Foundation
/*{
 "title": "1Q84",
 "description": "In 1980s Tokyo, a woman who punishes perpetrators of domestic violence has ties to an aspiring novelist with an unusual project.",
 "contributor": "by Haruki Murakami",
 "author": "Haruki Murakami",
 "contributor_note": "",
 "price": 0,
 "age_group": "",
 "publisher": "Vintage",
 .
 .
 .*/
extension Book {
    func populate(from dict: [String:Any]) {
        guard let title = dict["title"] as? String, title != "",
            let description = dict["description"] as? String, description != "",
            let author = dict["author"] as? String , author != "" else { return }
        
        self.title = title
        self.describ = description
        self.author = author
    }
}
