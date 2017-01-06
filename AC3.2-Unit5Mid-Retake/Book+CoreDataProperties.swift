//
//  Book+CoreDataProperties.swift
//  AC3.2-Unit5Mid-Retake
//
//  Created by Thinley Dorjee on 1/6/17.
//  Copyright © 2017 C4Q. All rights reserved.
//

import Foundation
import CoreData


extension Book {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Book> {
        return NSFetchRequest<Book>(entityName: "Book");
    }

    @NSManaged public var title: String?
    @NSManaged public var author: String?

}
