//
//  Tag.swift
//  Jot.it
//
//  Created by Jose Blanco on 1/9/24.
//

import Foundation
import SwiftData
import SwiftUI

@Model
final class Tag {
    @Attribute(.unique) var id: UUID
    var title: String
    var hexColor: String
    
    init(id: UUID, title: String, hexColor: String) {
        self.id = id
        self.title = title
        self.hexColor = hexColor
    }
}
