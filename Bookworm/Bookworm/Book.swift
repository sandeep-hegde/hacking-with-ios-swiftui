//
//  Book.swift
//  Bookworm
//
//  Created by Sandeep Hegde on 13/12/23.
//

import Foundation
import SwiftData

// Book Data Model
@Model
class Book {
    var title: String
    var author: String
    var genre: String
    var review: String
    var rating: Int
    
    init(title: String, author: String, genre: String, review: String, rating: Int) {
        self.title = title
        self.author = author
        self.genre = genre
        self.review = review
        self.rating = rating
    }
}
