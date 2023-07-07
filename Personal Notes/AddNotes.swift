//
//  AddNotes.swift
//  Personal Notes
//
//  Created by SARVADHI on 06/07/23.
//

import SwiftUI

struct AddNotes: View {
    @State private var title = ""
    var body: some View {
        NavigationView {
            ZStack {
                VStack(spacing: 25) {
                    VStack() {
                        HStack {
                            Text("Title")
                                .frame(alignment: .leading) // Set alignment to leading
                            Spacer() // Add a spacer to push the text field to the trailing side
                        }
                        ZStack(alignment: .leading) { // Set alignment to leading
                            TextField("Enter Title", text: $title)
                                .font(.system(size: 17))
                                .foregroundColor(.primary)
                                .frame(height: 50)
                                .padding(.horizontal, 12)
                                .background(Color.white)
                                .cornerRadius(10.0)
                                .keyboardType(.default)
                        }
                        
                        HStack {
                            Text("Description")
                                .frame(alignment: .leading) // Set alignment to leading
                            Spacer() // Add a spacer to push the text field to the trailing side
                        }
                        ZStack(alignment: .leading) {
                            
                            // Set alignment to leading
                            TextField("Enter Description", text: $title)
                                .font(.system(size: 17))
                                .foregroundColor(.primary)
                                .frame(height: 200)
                                .padding(.horizontal, 12)
                                .background(Color.white)
                                .cornerRadius(10.0)
                                .keyboardType(.default)
                        }
                    }
                    Spacer()
                    
                }
                .padding()
                .background(Color.secondary.opacity(0.1).ignoresSafeArea())
            }
            
            
        }
        .navigationBarHidden(false)
        .navigationTitle("Add Notes")
//        .backb
        
       
    }
}

struct AddNotes_Previews: PreviewProvider {
    static var previews: some View {
        AddNotes()
    }
}
