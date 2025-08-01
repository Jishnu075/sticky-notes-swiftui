//
//  NoteDetailBottomSheet.swift
//  stickynotesSUI
//
//  Created by Jishnu Biju [Litmus7] on 01/08/25.
//

import SwiftUI

struct NoteDetailBottomSheet: View {
    let title: String
    let description: String
    let isPinned: Bool
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        NavigationView {
            VStack(alignment: .leading, spacing: 16) {
                HStack {
                    Text(title)
                        .font(.title2)
                        .fontWeight(.bold)
                    
                    Spacer()
                    
                    if isPinned {
                        Image(systemName: "pin.fill")
                            .foregroundColor(.orange)
                    }
                }
                
                ScrollView {
                    Text(description)
                        .font(.body)
                        .frame(maxWidth: .infinity, alignment: .leading)
                }
                
                Spacer()
                
                HStack(spacing: 20) {
                    Button("Edit") {
                        //edit action
                    }
                    .buttonStyle(.borderedProminent)
                    
                    Button("Delete") {
                        //delete action
                    }
                    .buttonStyle(.bordered)
                    .foregroundColor(.red)
                    
                    Button("Share") {
                        //share action
                    }
                    .buttonStyle(.bordered)
                }
            }
            .padding()
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button("Done") {
                        dismiss()
                    }
                }
            }
        }
    }
}

