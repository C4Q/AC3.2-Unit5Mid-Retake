//
//  Book+JSON.swift
//  AC3.2-Unit5Mid-Retake
//
//  Created by Edward Anchundia on 1/6/17.
//  Copyright © 2017 C4Q. All rights reserved.
//

import Foundation

extension Book {
    func populate(from bookDict: [String: Any]) {
        guard let title = bookDict["title"] as? String,
            let author = bookDict["author"] as? String,
            let description = bookDict["description"] as? String else { return }
        self.title = title
        self.author = author
        self.descriptions = description
    }
}
