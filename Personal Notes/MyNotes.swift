//
//  MyNotes.swift
//  Personal Notes
//
//  Created by SARVADHI on 03/07/23.
//

import SwiftUI

struct MyNotes: View {
    
    let notes: [Notes] = NotesHelper.getAllNotes()
    @State private var isShowAddNotes = false
    
    init() {
//        setUpNavigationBarAppearance(titleColor: .blue, barColor: .red)
    }
    
    var body: some View {
        NavigationView {
            List(notes, id: \.noteId) { note in
                HStack {
                    VStack(alignment: .leading) {
                        Text(note.title)
                            .font(.headline)
                        Text(note.description)
                            .font(.subheadline)
                    }
                    Image(systemName: "paperclip")
                }
                
            }
            .floatingActionButton(color: .blue, image: Image(systemName: "plus")) {
                self.isShowAddNotes = true
            }
            NavigationLink(destination: AddNotes(), isActive: $isShowAddNotes, label: { EmptyView() })
        }
        
    }
}

extension View {
    func floatingActionButton<ImageView: View>(
        color: Color,
        image: ImageView,
        action: @escaping () -> Void) -> some View {
            self.modifier(FloatingActionButton(color: color,
                                               image: image,
                                               action: action))
        }
}

struct FloatingActionButton<ImageView: View>: ViewModifier {
    let color: Color // background color of the FAB
    let image: ImageView // image shown in the FAB
    let action: () -> Void
    
    private let size: CGFloat = 60 // size of the FAB circle
    private let margin: CGFloat = 15
    
    func body(content: Content) -> some View {
        GeometryReader { geo in
            ZStack {
                Color.clear // allows the ZStack to fill the entire screen
                content
                button(geo)
            }
        }
    }
    
    @ViewBuilder private func button(_ geo: GeometryProxy) -> some View {
        Image(systemName: "plus")
            .foregroundColor(.white)
            .imageScale(.large)
            .frame(width: size, height: size)
            .background(Circle().fill(.blue))
            .shadow(color: .gray, radius: 2, x: 1, y: 1)
            .onTapGesture(perform: action)
            .offset(x: (geo.size.width - size) / 2 - margin,
                    y: (geo.size.height - size) / 2 - margin)
    }
        
}

struct MyNotes_Previews: PreviewProvider {
    static var previews: some View {
        MyNotes()
    }
}
