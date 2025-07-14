//
//  Note.swift
//  stickynotesSUI
//
//  Created by Jishnu Biju [Litmus7] on 14/07/25.
//
import Foundation
import FirebaseFirestore

struct Note: Codable, Identifiable {
    @DocumentID var id: String?
    var title: String
    var content: String
    var dateCreated: Date
    var dateModified: Date
    var isPinned: Bool
    var isArchived: Bool
    var colorHex: String?
    var tags: [String]?
}
