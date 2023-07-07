//
//  HomeScreen.swift
//  Personal Notes
//
//  Created by SARVADHI on 25/06/23.
//

import SwiftUI
import FirebaseFirestore

struct HomeScreen: View {
    
    @State var user: Users?
    
    init() {
        setUpNavigationBarAppearance(titleColor: .black, barColor: .white)
//        let id = UserDefaults.standard.value(forKey: "user_id") as? String ?? ""
//        Firestore.firestore().collection("Users").document(id).getDocument { snapShot, error in
//            guard let snapshot = snapShot, let data = snapshot.data() else {
//                return
//            }
//            user = Users(dict: data)
//        }
    }
    
    var body: some View {
        NavigationView {
            TabView {
                MyNotes()
                    .tabItem {
                        Image(systemName: "note.text")
                        Text("Notes")
                    }
                // Tab 2
                Text("Tab 2")
                    .tabItem {
                        Image(systemName: "person.fill")
                        Text("Users")
                    }
            }
            .navigationBarHidden(false)
            .navigationTitle("Personal Notes")
            .navigationBarTitleDisplayMode(.inline)
        }
        
    }
}

struct HomeScreen_Previews: PreviewProvider {
    static var previews: some View {
        HomeScreen()
    }
}
