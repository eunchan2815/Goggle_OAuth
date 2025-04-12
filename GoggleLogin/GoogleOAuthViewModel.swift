//
//  GoogleOAuthViewModel.swift
//  GoggleLogin
//
//  Created by dgsw30 on 4/12/25.
//


import GoogleSignIn
import SwiftUI

class GoogleOAuthViewModel: ObservableObject {
    @Published var oauthUserData = OAuthUserData()
    @Published var errorMessage: String?
    @Published var givenName: String?
    
    func checkUserInfo() {
        if GIDSignIn.sharedInstance.currentUser != nil {
            let user = GIDSignIn.sharedInstance.currentUser
            guard let user = user else {
                return
            }
            self.givenName = user.profile?.givenName ?? ""
            oauthUserData.oauthId = user.userID ?? ""
            oauthUserData.idToken = user.idToken?.tokenString ?? ""
            
        } else {
            self.errorMessage = "error: Not Logged In"
        }
    }
    
    func signIn() {
        guard let presentingViewController = (UIApplication.shared.connectedScenes.first as? UIWindowScene)?.windows.first?.rootViewController else {
            return
        }
        
        GIDSignIn.sharedInstance.signIn(
            withPresenting: presentingViewController)
        { _, error in
            if let error = error {
                self.errorMessage = "error: \(error.localizedDescription)"
            }
            
            self.checkUserInfo()
        }
    }
    
    func signOut() {
        GIDSignIn.sharedInstance.signOut()
    }
}