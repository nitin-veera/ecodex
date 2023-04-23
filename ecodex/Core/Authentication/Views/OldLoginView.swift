

import SwiftUI
import Firebase

struct OldLoginView: View {
    @State private var email = ""
    @State private var password = ""
    @EnvironmentObject var viewModel: AuthViewModel

    var body: some View {
        NavigationStack {
            VStack {
                Text("Login!")
                TextField("Email", text: $email)
                SecureField("Password", text: $password)
                Button(action: { viewModel.login(withEmail: email, password: password) }) {
                    Text("Sign in")
                }
                
                NavigationLink  {
                    RegistrationView()
                        .navigationBarHidden(true)
                } label: {
                    HStack {
                        Text("Don't have an account?")
                            .font(.footnote)
                        
                        Text("Sign Up")
                            .font(.footnote)
                            .fontWeight(.semibold)
                    }
                }
                .padding(.top, 32)
            }
            .padding()
            
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        OldLoginView()
    }
}
