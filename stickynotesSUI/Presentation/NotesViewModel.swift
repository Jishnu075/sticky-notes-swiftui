//
//  NotesViewModel.swift
//  stickynotesSUI
//
//  Created by Jishnu Biju [Litmus7] on 14/07/25.
//

import Foundation

class NotesViewModel: ObservableObject {
    @Published var notes: [Note] = []
    private let firebaseServices = FirebaseServices()
    
    func fetchNotes () {
        firebaseServices.fetchAllNotes { [weak self] notes in
            DispatchQueue.main.async {
                self?.notes = notes
            }
            
        }
    }
}
