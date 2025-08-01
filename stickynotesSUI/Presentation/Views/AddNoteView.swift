//
//  AddNoteView.swift
//  stickynotesSUI
//
//  Created by Jishnu Biju [Litmus7] on 14/07/25.
//

import SwiftUI

struct AddNoteView: View {
    @ObservedObject var viewModel: NotesViewModel
    
    @State private var titleText: String = ""
    @State private var descriptionText: String = ""
    @State private var isPinned: Bool = false
    
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        ZStack {
            ScrollView {
                VStack(alignment: .leading) {
                    // title
                    ZStack(alignment: .topLeading) {
                        if titleText.isEmpty {
                            Text("Title")
                                .font(.largeTitle)
                                .foregroundColor(.gray)
                        }
                        
                        TextEditor(text: $titleText)
                            .opacity(titleText.isEmpty ? 0.25 : 1)
                            .font(.largeTitle)
                            .autocorrectionDisabled(true)
                            .textInputAutocapitalization(.sentences)
                            .frame(minHeight: 50)
                    }
                    
                    // desc
                    ZStack(alignment: .topLeading) {
                        if descriptionText.isEmpty {
                            Text("description")
                                .font(.body)
                                .foregroundColor(.gray)
                        }
                        
                        TextEditor(text: $descriptionText)
                            .opacity(descriptionText.isEmpty ? 0.25 : 1)
                            .font(.body)
                            .autocorrectionDisabled(true)
                            .textInputAutocapitalization(.sentences)
                            .frame(minHeight: 50)
                    }
                    
                    Spacer()
                        .frame(height: 80)
                }
                .padding()
            }
            
            // fab
            if !titleText.isEmpty {
                VStack {
                    Spacer()
                    HStack {
                        Spacer()
                        Button(action: {
                            let note = Note(title: titleText, content: descriptionText, dateCreated: Date.now, dateModified: Date.now, isPinned: isPinned, isArchived: false)
                            viewModel.addNote(note: note)
                            dismiss()
                            
                        }) {
                            //                        Image(systemName: "checkmark")
                            //                            .font(.title2)
                            //                            .foregroundColor(.white)
                            Text("Save")
                                .font(.footnote)
                                .foregroundStyle(.white )
                        }
                        .frame(width: 56, height: 56)
                        .background(Color.blue)
                        .clipShape(Circle())
                        .shadow(radius: 4)
                        .padding(.trailing, 16)
                        .padding(.bottom, 20)
                        //TODO: add button appearance animations later, a haptic feedback too?
                    }
                }
            }
        }
        .alert("Error", isPresented: $viewModel.showError) {
            Button("Ok"){
                viewModel.showError = false
                viewModel.currentError = nil
            }
        } message: {
            Text(viewModel.currentError?.message ?? "Something went wrong!")
        }
        .navigationTitle("Add Note")
        .toolbar {
            Button(action: {
                isPinned.toggle()
            }, label: {
                Image(systemName: isPinned ? "pin.fill" : "pin")
            })
        }
    }
}

