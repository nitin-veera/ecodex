
import SwiftUI

struct OldRegistrationView: View {
    @State private var email = ""
    @State private var password = ""
    @State private var username = ""
    @EnvironmentObject var viewModel: AuthViewModel
    
    var body: some View {
        NavigationStack {
            VStack {
                Text("Register!")
                TextField("Email", text: $email)
                TextField("Username", text: $username)
                SecureField("Password", text: $password)
                Button(action: { viewModel.register(withEmail: email, password: password, username: username) }) {
                    Text("Sign Up")
                }
            }
            .padding()
            
            NavigationLink  {
                LoginView()
                    .navigationBarHidden(true)
            } label: {
                HStack {
                    Text("Already have an account?")
                        .font(.footnote)
                    
                    Text("Login")
                        .font(.footnote)
                        .fontWeight(.semibold)
                }
            }
            .padding(.top, 32)
        }
        .padding()
        
    }
}

struct RegistrationView_Previews: PreviewProvider {
    static var previews: some View {
        RegistrationView()
    }
}
