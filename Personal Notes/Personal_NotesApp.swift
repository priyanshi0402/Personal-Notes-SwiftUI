//
//  Personal_NotesApp.swift
//  Personal Notes
//
//  Created by SARVADHI on 24/06/23.
//

import SwiftUI

@main
struct Personal_NotesApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    let id = UserDefaults.standard.value(forKey: "user_id") as? String ?? ""
    var body: some Scene {
        WindowGroup {
            if id == "" {
                LoginPage()
            } else {
                HomeScreen()
            }
           
        }
    }
}
