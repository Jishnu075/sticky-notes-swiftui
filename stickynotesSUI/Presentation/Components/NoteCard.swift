//
//  NoteCard.swift
//  stickynotesSUI
//
//  Created by Jishnu Biju [Litmus7] on 13/07/25.
//

import SwiftUI

struct NoteCard: View {
    let title: String
    let description: String
    let isPinned: Bool
    var cardColor: Color = Color.yellow
    @State private var showingBottomSheet = false
    
    var body: some View {
            VStack (alignment: .leading, spacing: 8) {
                Text (title)
                    .font(.headline)
                    .lineLimit(2)
                
                Text (description)
                    .font(.caption)
                    .lineLimit(4)
            }
            .padding()
            .frame(minWidth: 160, minHeight: 160)
            .aspectRatio(1, contentMode: .fit)
            .background(
                RoundedRectangle(cornerRadius: 12, style: .circular)
                    .fill(cardColor)
                    .shadow(color: .gray.opacity(0.4), radius: 4, x: 2, y: 2)
            ).onTapGesture {
                showingBottomSheet = true
            }
            .sheet(isPresented: $showingBottomSheet) {
                NoteDetailBottomSheet(title: title, description: description, isPinned: isPinned)
            }
            .overlay(alignment: .topTrailing) {
                if isPinned {
                    Image(systemName: "pin.fill")
                        .padding(.top, 6)
                        .padding(.trailing, 6)
                }
            }
    }
}

#Preview {
    NoteCard(title: "testone", description: "testtwo", isPinned: false)
}
