import SwiftUI

struct ContentView: View {
    @StateObject private var viewModel = GoogleOAuthViewModel()
    
    var body: some View {
        VStack {
            Button(action: {
                viewModel.signIn()
            }) {
                Text("Sign In with Google")
                    .font(.title2)
                    .padding()
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(8)
            }
            
            if let givenName = viewModel.givenName {
                Text("Welcome, \(givenName)")
                    .padding()
            } else {
                Text("Not Logged In")
                    .padding()
            }
            
            if let errorMessage = viewModel.errorMessage {
                Text("\(errorMessage)")
                    .foregroundColor(.red)
                    .padding()
            }
        }
        .padding()
    }
}
