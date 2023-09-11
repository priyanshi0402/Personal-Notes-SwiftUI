//
//  Buttons.swift
//  Personal Notes
//
//  Created by SARVADHI on 23/08/23.
//

import Foundation
import SwiftUI

struct CustomButton: View {
    var title: String = ""
    let action: () -> Void
    
    var body: some View {
        Button(action: action) {
            Text(title)
                .foregroundColor(.white)
                .frame(width: 210, height: 55, alignment: .center)
                .font(.system(size: 18, weight: .medium))
        }
        .background(Color.blue)
        .cornerRadius(10)
    }
    
}
