//
//  ContentView.swift
//  WeSplit
//
//  Created by Sandeep Hegde on 12/08/23.
//

// Importing the SwiftUI framework to utilize its features.
import SwiftUI

// Defining a ContentView struct that conforms to the View protocol from SwiftUI.
struct ContentView: View {
    // The body computed property returns the view's content for rendering.
    var body: some View {
        // Creating a text view with the content "Hello, world!".
        Text("Hello, world!")
            // Adding padding around the text view.
            .padding()
    }
}

// Provides a preview of the ContentView in Xcode's canvas.
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
