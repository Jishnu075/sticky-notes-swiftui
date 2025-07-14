//
//  FirebaseServices.swift
//  stickynotesSUI
//
//  Created by Jishnu Biju [Litmus7] on 14/07/25.
//

import Foundation
import FirebaseFirestore

class FirebaseServices {
    private let db = Firestore.firestore()
    
    
    func fetchAllNotes(completion: @escaping ([Note]) -> Void){
        db.collection("notes").order(by: "dateModified", descending: true)
            .addSnapshotListener { snapshot, error in
                
                if let error = error {
                    print("Error fetching notes: \(error)")
                    return
                }
                
                
                let fetchedNotes = snapshot?.documents.compactMap { document in
                    try? document.data(as: Note.self)
                    
                } ?? []
                
                //sortedNotes by first pinned
                let sortedNotes = fetchedNotes.sorted { first, second in
                                   if first.isPinned == second.isPinned {
                                       return first.dateModified > second.dateModified
                                   }
                                   return first.isPinned && !second.isPinned
                               }
                completion(sortedNotes)
                }
        
    }
    
    func testWrite() {
        let testData: [String: Any] = ["testField": "Hello Firebase", "timestamp": Timestamp()]
        db.collection("testCollection").addDocument(data: testData) { error in
            if let error = error {
                print("❌ Failed to write to Firebase: \(error)")
            } else {
                print("✅ Successfully wrote to Firebase")
            }
        }
    }

}
