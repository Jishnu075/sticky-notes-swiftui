//
//  HomeScreenView.swift
//  stickynotesSUI
//
//  Created by Jishnu Biju [Litmus7] on 13/07/25.
//

import SwiftUI

struct HomeScreenView: View {
    @StateObject private var viewModel = NotesViewModel()
    
    let columns = [
        GridItem(.flexible(minimum: 140, maximum: .infinity)),
        GridItem(.flexible(minimum: 140, maximum: .infinity))    ]
    
    var body: some View {
        NavigationStack {
            
            ScrollView {
                LazyVGrid(columns: columns, spacing: 10) {
                    ForEach(viewModel.notes) { note in
                        NoteCard(title: note.title, description: note.content, isPinned: note.isPinned)
                    }
                }
            }
            .navigationTitle("Sticky Notes")
            .toolbar {
                ToolbarItem(placement: .primaryAction) {
                    NavigationLink (destination: AddNoteView()) {
                        Image(systemName: "plus")
                            .foregroundStyle(.white)
                            .frame(width: 30, height: 30)
                            .background(Color.black)
                            .clipShape(.circle)
                            
                            
                    }
                }
            }
        }.onAppear() {
            viewModel.fetchNotes()
        }
    }
}



#Preview {
    HomeScreenView()
}
