//
//  AddNoteView.swift
//  stickynotesSUI
//
//  Created by Jishnu Biju [Litmus7] on 14/07/25.
//

import SwiftUI

struct AddNoteView: View {
    @State private var titleText: String = ""
    @State private var descriptionText: String = ""
    
    var body: some View {
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
                
                Spacer(minLength: 50) // some space at bottom
            }
            .padding()
        }
        .navigationTitle("Add Note")
        .toolbar {
            Button(action: {
                print("click")
            }, label: {
                Text("Save")
            })
        }
    }
}
#Preview {
    AddNoteView()
}
