//
//  NoteDetailBottomSheet.swift
//  stickynotesSUI
//
//  Created by Jishnu Biju [Litmus7] on 01/08/25.
//

import SwiftUI

struct NoteDetailBottomSheet: View {
    @State var title: String
    @State var description: String
    @State var isPinned: Bool
    @Environment(\.dismiss) private var dismiss
    
    @State private var showDeleteAlert: Bool = false
    @State private var isEdited: Bool = false
    
    var body: some View {
        NavigationView {
            VStack(alignment: .leading, spacing: 16) {
                HStack {
                    TextField("Title", text: $title)
                        .font(.title2)
                        .fontWeight(.bold)
                        .onChange(of: title) { isEdited = true }
                    Spacer()
                    
                    Button(action: {
                        isPinned.toggle()
                        isEdited = true
                    }, label: {
                        Image(systemName:  isPinned ? "pin.fill" :"pin")
                            .foregroundStyle(.orange)
                    })
                }
                ScrollView {
                    TextField("Description", text: $description)
                        .font(.body)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .onChange(of: description) { isEdited = true }
                }
                
                Spacer()
                
                Button("Delete",systemImage: "trash", action: {
                    showDeleteAlert = true
                })
                .buttonStyle(.bordered)
                .foregroundColor(.red)
            }
            .padding()
            .navigationBarTitleDisplayMode(.inline)
            .alert(isPresented: $showDeleteAlert) {
                Alert(title: Text("Are you sure?"), message: Text("Deleting this note will permanently remove it."),
                      primaryButton: .destructive(Text("Delete")) {
                    print("Delete pressed")
                },secondaryButton: .cancel())
            }
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button( isEdited ? "Save and Close" :"Close") {
                        dismiss()
                    }
                }
            }
        }
        .presentationCompactAdaptation(.fullScreenCover)

    }
}

