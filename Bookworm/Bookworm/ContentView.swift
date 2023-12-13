//
//  ContentView.swift
//  Bookworm
//
//  Created by Sandeep Hegde on 13/12/23.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    
    @Environment(\.modelContext) var modelContext
    @Query var books: [Book]
    
    @State private var showingAddScreen = false
    
    var body: some View {
        NavigationStack {
            List(books) { book in
                NavigationLink(value: book) {
                    HStack {
                        EmojiRatingView(rating: book.rating)
                            .font(.largeTitle)
                        
                        VStack(alignment: .leading) {
                            Text(book.title)
                                .font(.headline)
                            
                            Text(book.author)
                                .foregroundStyle(.secondary)
                        }
                    }
                }
            }
            .navigationTitle("Bookwarm")
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button("Add Book", systemImage: "plus") {
                        showingAddScreen.toggle()
                    }
                }
            }
            .sheet(isPresented: $showingAddScreen) {
                AddBookView()
            }
        }
    }
}

#Preview {
    ContentView()
}
