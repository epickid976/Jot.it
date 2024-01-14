//
//  Item.swift
//  Jot.it
//
//  Created by Jose Blanco on 1/9/24.
//

import Foundation
import SwiftData

@Model
final class Item {
    var timestamp: Date
    
    init(timestamp: Date) {
        self.timestamp = timestamp
    }
}

@Model
final class Note {
    @Attribute(.unique) var id: UUID
    var title: String
    var body: String
    var date: Date = Date()
    var lastModified: Date = Date()
    var tags: [Tag] = []
    
    init(id: UUID, title: String, body: String, tags: [Tag]) {
        self.id = id
        self.title = title
        self.body = body
        self.tags = tags
    }
}


