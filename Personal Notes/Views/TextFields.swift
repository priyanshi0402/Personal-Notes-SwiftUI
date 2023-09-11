//
//  TextFields.swift
//  Personal Notes
//
//  Created by SARVADHI on 03/08/23.
//

import Foundation
import SwiftUI

struct SecureTextField: View {
    @Binding var password: String
    @State private var isSecure = true
    
    var body: some View {
        VStack() {
            ZStack(alignment: .trailing) {
                if isSecure {
                    SecureField("Enter Password", text: $password)
                        .font(.system(size: 17))
                        .foregroundColor(.primary)
                        .frame(height: 50)
                        .padding(.horizontal, 12)
                        .background(Color.white)
                        .cornerRadius(10.0)
                } else {
                    TextField("Enter Password", text: $password)
                        .font(.system(size: 17))
                        .foregroundColor(.primary)
                        .frame(height: 50)
                        .padding(.horizontal, 12)
                        .background(Color.white)
                        .cornerRadius(10.0)
                }
                Button {
                    isSecure.toggle()
                } label: {
                    Image(systemName: isSecure ? "eye.slash" : "eye")
                        .accentColor(.gray)
                }
                .padding()
            }
        }
    
    }
}

struct CustomTextField: View {
    @Binding var email: String
    var type: UIKeyboardType = .default
    var capitalization: UITextAutocapitalizationType = .none
    var placeHolder: String = ""
    var imageName: String?
    
    var body: some View {
        VStack() {
            ZStack(alignment: .trailing) {
                TextField(placeHolder, text: $email)
                    .font(.system(size: 17))
                    .foregroundColor(.primary)
                    .frame(height: 50)
                    .padding(.horizontal, 12)
                    .background(Color.white)
                    .cornerRadius(10.0)
                    .autocapitalization(capitalization)
                    .keyboardType(type)
                
                if let image = imageName {
                    //"envelope.fill"
                    Image(systemName: image)
                        .foregroundColor(.gray)
                        .padding()
                }
                
            }
            
        }
    }
}
