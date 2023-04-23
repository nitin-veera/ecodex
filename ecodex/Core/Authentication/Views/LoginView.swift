

import SwiftUI

struct LoginView: View {
    @Environment(\.presentationMode) var presentationMode
    @EnvironmentObject var viewModel: AuthViewModel
    @State private var email = ""
    @State private var password = ""
    @State private var showingRegistration = false
    
    var body: some View {
        ZStack {
            Color("ThemeColor")
                .ignoresSafeArea()
            VStack(alignment: .center) {
                Spacer()
                HStack {
                    Spacer()
                    Text("      Welcome Back!")
                        .font(.system(size: 36)).bold()
                        .foregroundColor(Color("TertiaryTheme"))
                    Spacer()
                    Spacer()
                    Spacer()
                }
                Image("EcoGuy2")
                    .resizable()
                    .frame(width: 150, height: 150)
                Group {
                    ZStack {
                        Rectangle()
                            .frame(width: 250, height: 40)
                            .cornerRadius(15)
                            .foregroundColor(.white)
                            .padding(.vertical, 7)
                            .shadow(color: Color(.gray).opacity(0.4), radius: 5)
                        HStack {
                            Image(systemName: "envelope")
                                .foregroundColor(.gray)
                                .padding(.leading, 85)
                            TextField("Email", text: $email)
                                .disableAutocorrection(true)
                                .autocapitalization(.none)
                        }
                    }
                    ZStack {
                        Rectangle()
                            .frame(width: 250, height: 40)
                            .cornerRadius(15)
                            .foregroundColor(.white)
                            .padding(.vertical, 7)
                            .shadow(color: Color(.gray).opacity(0.4), radius: 5)
                        HStack {
                            Image(systemName: "lock")
                                .foregroundColor(.gray)
                                .padding(.leading, 85)
                            SecureField("Password", text: $password)
                                .disableAutocorrection(true)
                                .autocapitalization(.none)
                        }
                    }
                }
                HStack {
                    Text("New User? ")
                        .font(.headline).bold()
                        .foregroundColor(.white)
                    Button(action: {
                        showingRegistration = true
                    }) {
                        Text("Get started")
                            .font(.headline).bold()
                            .foregroundColor(Color("SecondaryTheme"))
                            .underline()
                    }
                    .fullScreenCover(isPresented: $showingRegistration) {
                        RegistrationView()
                    }
                }
                Spacer()
                Button(action: { viewModel.login(withEmail: email, password: password) }) {
                    ZStack {
                        Rectangle()
                            .frame(width: 150, height: 50)
                            .cornerRadius(25)
                            .foregroundColor(Color("TertiaryTheme"))
                            .shadow(color: Color(.gray).opacity(0.4), radius: 5)
                        Text("Sign In")
                            .bold()
                            .foregroundColor(.white)
                    }
                }
                Spacer()
            }
        }
    }
}

struct SignInView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
