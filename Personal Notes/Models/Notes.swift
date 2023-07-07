//
//  Notes.swift
//  Personal Notes
//
//  Created by SARVADHI on 04/07/23.
//

import Foundation

public protocol Identifiable {

    /// A type representing the stable identity of the entity associated with
    /// an instance.
//    associatedtype ID : Hashable

    /// The stable identity of the entity associated with this instance.
    var noteId: String { get }
}

struct Notes: Identifiable {
    var userId: String
    var noteId: String
    var title: String
    var description: String
    var attachments: String
    
    init(dict: [String: Any]) {
        self.userId = dict["user_id"] as? String ?? ""
        self.noteId = dict["note_id"] as? String ?? ""
        self.title = dict["title"] as? String ?? ""
        self.description = dict["description"] as? String ?? ""
        self.attachments = dict["attachments"] as? String ?? ""
    }
    
    init(userId: String, noteId: String, title: String, description: String, attachments: String) {
        self.userId = userId
        self.noteId = noteId
        self.title = title
        self.description = description
        self.attachments = attachments
    }
    
    func toDictionary() -> [String: Any] {
        var dict: [String:Any] = [:]
        dict["user_id"] = self.userId
        dict["note_id"] = self.noteId
        dict["title"] = self.title
        dict["description"] = self.description
        dict["attachments"] = self.attachments
        return dict
    }
}



class NotesHelper {
    static func getAllNotes() -> [Notes] {
        return [
            Notes(userId: "", noteId: UUID().uuidString, title: "Note 1", description: "gqekjfbckjew hgfkjewhfkjewhfk fhkewhfkjew  oeiheq feqhfo ewfkhfjew few h", attachments: ""),
            Notes(userId: "", noteId: UUID().uuidString, title: "Note 2", description: "gqekjfbckjew hgfkjewhfkjewhfk fhkewhfkjew  oeiheq feqhfo ewfkhfjew few h", attachments: ""),
            Notes(userId: "", noteId: UUID().uuidString, title: "Note 3", description: "gqekjfbckjew hgfkjewhfkjewhfk fhkewhfkjew  oeiheq feqhfo ewfkhfjew few h", attachments: ""),
            Notes(userId: "", noteId: UUID().uuidString, title: "Note 3", description: "gqekjfbckjew hgfkjewhfkjewhfk fhkewhfkjew  oeiheq feqhfo ewfkhfjew few h", attachments: ""),
            Notes(userId: "", noteId: UUID().uuidString, title: "Note 3", description: "gqekjfbckjew hgfkjewhfkjewhfk fhkewhfkjew  oeiheq feqhfo ewfkhfjew few h", attachments: ""),
            Notes(userId: "", noteId: UUID().uuidString, title: "Note 3", description: "gqekjfbckjew hgfkjewhfkjewhfk fhkewhfkjew  oeiheq feqhfo ewfkhfjew few h", attachments: ""),
            Notes(userId: "", noteId: UUID().uuidString, title: "Note 3", description: "gqekjfbckjew hgfkjewhfkjewhfk fhkewhfkjew  oeiheq feqhfo ewfkhfjew few h", attachments: ""),
            Notes(userId: "", noteId: UUID().uuidString, title: "Note 3", description: "gqekjfbckjew hgfkjewhfkjewhfk fhkewhfkjew  oeiheq feqhfo ewfkhfjew few h", attachments: ""),
            Notes(userId: "", noteId: UUID().uuidString, title: "Note 3", description: "gqekjfbckjew hgfkjewhfkjewhfk fhkewhfkjew  oeiheq feqhfo ewfkhfjew few h", attachments: ""),
            Notes(userId: "", noteId: UUID().uuidString, title: "Note 3", description: "gqekjfbckjew hgfkjewhfkjewhfk fhkewhfkjew  oeiheq feqhfo ewfkhfjew few h", attachments: ""),
            Notes(userId: "", noteId: UUID().uuidString, title: "Note 3", description: "gqekjfbckjew hgfkjewhfkjewhfk fhkewhfkjew  oeiheq feqhfo ewfkhfjew few h", attachments: ""),
            Notes(userId: "", noteId: UUID().uuidString, title: "Note 3", description: "gqekjfbckjew hgfkjewhfkjewhfk fhkewhfkjew  oeiheq feqhfo ewfkhfjew few h", attachments: ""),
            Notes(userId: "", noteId: UUID().uuidString, title: "Note 3", description: "gqekjfbckjew hgfkjewhfkjewhfk fhkewhfkjew  oeiheq feqhfo ewfkhfjew few h", attachments: ""),
            // Add more notes with unique noteId values
        ]
    }
}
