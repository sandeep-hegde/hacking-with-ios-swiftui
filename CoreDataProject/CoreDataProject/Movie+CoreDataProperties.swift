//
//  Movie+CoreDataProperties.swift
//  CoreDataProject
//
//  Created by Sandeep Hegde on 14/12/23.
//
//

import Foundation
import CoreData


extension Movie {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Movie> {
        return NSFetchRequest<Movie>(entityName: "Movie")
    }

    @NSManaged public var title: Int16
    @NSManaged public var director: String?
    @NSManaged public var year: String?

}

extension Movie : Identifiable {

}
