//
//  ContentView.swift
//  My Thougjts ACTUALLLL
//
//  Created by Payton Curry on 3/30/21.
//

import SwiftUI

struct ContentView: View {
    @State var thought: String = "Loading..."
    
    var body: some View {
        NavigationView {
            VStack {
                Text(thought)
                    .fontWeight(.light)
                
                    .navigationTitle("Payton's Thoughts")
                Button("Reload") {
                    loadThought()
                }
                Spacer()
                Text("A majority of the code from this app came from a reddit user named Stiggg. Thank you, Stiggg!")
                    .padding(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
            }
        }
        
        
    }
    
    func loadThought() {
            // Change to the URL to your text file on github or where ever you want
            let url = URL(string: "https://raw.githubusercontent.com/paytontech/paytonsthoughts/main/thoughts")!
            URLSession.shared.dataTask(with: url) { data, response, error in
                DispatchQueue.main.async {
                    guard let data = data, let text = String(data: data, encoding: .utf8) else {
                        thought = "Error!"
                        return
                    }

                    thought = text
                }
            }.resume()
        
        }
    }

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
