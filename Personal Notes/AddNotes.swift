//
//  AddNotes.swift
//  Personal Notes
//
//  Created by SARVADHI on 06/07/23.
//

import SwiftUI

struct AddNotes: View {
    @State private var title = ""
    @State private var description = ""
//    var attachtments: [String] = ["Item 1", "Item 2", "Item 3", "Item 4", "Item 5", "Item 6"]
    @State private var isShowingOptions = false
    @State private var isShowingImagePicker = false
    @State private var attachtments: [String] = []
//    @State private var isShowingImagePicker = false
    
    var body: some View {
        NavigationView {
            ZStack {
                VStack() {
                    VStack {
                        HStack {
                            Text("Title")
                                .frame(alignment: .leading) // Set alignment to leading
                            Spacer() // Add a spacer to push the text field to the trailing side
                        }
                        CustomTextField(email: $title, capitalization: .words, placeHolder: "Enter Title")
                        HStack {
                            Text("Description")
                                .frame(alignment: .leading) // Set alignment to leading
                            Spacer() // Add a spacer to push the text field to the trailing side
                        }
                        ZStack(alignment: .leading) {
                            TextView(text: $description)
                                .foregroundColor(.primary)
                                .frame(height: 200)
                                .padding(.horizontal, 12)
                                .background(Color.white)
                                .cornerRadius(10.0)
                                .keyboardType(.default)
                        }
                        
                        HStack {
                            Text("Attachtments")
                                .frame(alignment: .leading) // Set alignment to leading
                            Spacer() // Add a spacer to push the text field to the trailing side
                        }
                        
                        ZStack(alignment: .leading) {
                            ScrollView(.horizontal) {
                                LazyVGrid(columns: Array(repeating: GridItem(.fixed(100), spacing: 16), count: self.attachtments.count)) {
                                    ForEach(self.attachtments, id: \.self) { item in
                                        Text("Items")
                                            .frame(maxWidth: .infinity)
                                            .padding()
                                            .background(Color.blue)
                                            .cornerRadius(10)
                                            .foregroundColor(.white)
                                    }
                                }
                            }
                        }
                        HStack {
                            CustomButton(title: "Add Attachment") {
                                self.isShowingOptions = true
                            }
                            .actionSheet(isPresented: $isShowingOptions) {
                                ActionSheet(title: Text("Options"), message: Text("Choose an Options"), buttons: [
                                    .default(Text("Camera"), action: {
                                        print("Option 1 selected")
                                    }),
                                    .default(Text("Photos"), action: {
                                        self.isShowingImagePicker = true
                                        print("Option 2 selected")
                                    }),
                                    .cancel()
                                ])
                            }
                            .sheet(isPresented: $isShowingImagePicker) {
                                ImagePicker(selectedImage: .constant(UIImage()), imageUrls: $attachtments, mode: .multipleImage)
                            }
                        }
                        .padding(15)
                        
                    }
                    Spacer()
                    
                }
                
            }
            .padding(.all, 15)
            .background(Color.secondary.opacity(0.1).ignoresSafeArea())
            
        }
        .navigationBarHidden(false)
        .navigationTitle("Add Notes")
        .navigationBarItems(trailing: Button(action: {
            
        }, label: {
            Text("Save")
        }))
       
    }
}

struct AddNotes_Previews: PreviewProvider {
    static var previews: some View {
        AddNotes()
    }
}
