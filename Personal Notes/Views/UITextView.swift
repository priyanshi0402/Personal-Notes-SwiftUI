//
//  UITextView.swift
//  Personal Notes
//
//  Created by SARVADHI on 18/07/23.
//

import Foundation
import SwiftUI
import UIKit

struct TextView: UIViewRepresentable {
    @Binding var text: String
    
    func makeUIView(context: Context) -> UITextView {
        let textview = UITextView()
        textview.delegate = context.coordinator
        textview.font = UIFont.systemFont(ofSize: 17)
        return textview
    }
    
    func updateUIView(_ uiView: UITextView, context: Context) {
        uiView.text = text
    }
    
    func makeCoordinator() -> Coordinator {
        Coordinator(parent: self)
    }
    
    class Coordinator: NSObject, UITextViewDelegate {
        var parent: TextView
        init(parent: TextView) {
            self.parent = parent
        }
        
        func textViewDidChange(_ textView: UITextView) {
            parent.text = textView.text
        }
    }
}
