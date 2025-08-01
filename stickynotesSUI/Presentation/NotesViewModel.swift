//
//  NotesViewModel.swift
//  stickynotesSUI
//
//  Created by Jishnu Biju [Litmus7] on 14/07/25.
//

import Foundation

enum NotesError {
    case saveFailure
    case fetchFailure
    case networkError
    case updateFailure
    case deleteFailure
    
    var message: String {
        switch self {
        case .saveFailure:
            return "Failed to save note. Please try again."
        case .fetchFailure:
            return "Failed to load notes."
        case .networkError:
            return "Network connection error."
        case .updateFailure:
            return "Failed to update note. Please try again."
        case .deleteFailure:
            return "Failed to delete note. Please try again."
        }
    }
}

class NotesViewModel: ObservableObject {
    @Published var notes: [Note] = []
    @Published var currentError: NotesError? = nil
    @Published var showError: Bool = false
    private let firebaseServices = FirebaseServices()
    
    func fetchNotes () {
        firebaseServices.fetchAllNotes { [weak self] result in
            guard let self = self else { return }
            DispatchQueue.main.async {
                switch result {
                case .success(let notes):
                    self.notes = notes
                    self.currentError = nil
                    self.showError = false
                case .failure(let error):
                    self.currentError = .fetchFailure
                    self.showError = true
                }
            }
        }
    }
    
    func addNote(note: Note) {
        firebaseServices.addNote(note: note) { [weak self] success in
            guard let self = self else { return }
            if !success {
                self.notes.append(note)
                self.currentError = .saveFailure
                self.showError = true
            } else {
                self.currentError = nil
                self.showError = false
            }
            
        }
    }
}

