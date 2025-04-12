//
//  GoggleLoginApp.swift
//  GoggleLogin
//
//  Created by dgsw30 on 4/12/25.
//

import SwiftUI
import GoogleSignIn

@main
struct GoggleLoginApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
                .onOpenURL { url in
                    GIDSignIn.sharedInstance.handle(url)
                }
        }
    }
}
