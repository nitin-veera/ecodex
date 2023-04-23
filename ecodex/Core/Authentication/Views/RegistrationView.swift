

import SwiftUI

struct RegistrationView: View {
    @Environment(\.presentationMode) var presentationMode
    @EnvironmentObject var viewModel: AuthViewModel
    @State private var email = ""
    @State private var username = ""
    @State private var password = ""
    @State private var showingLogin = false

    var body: some View {
        ZStack {
            Color("ThemeColor")
                .ignoresSafeArea()
            VStack(alignment: .center) {
                Spacer()
                HStack {
                    Spacer()
                    Text("Sign Up!")
                        .font(.system(size: 36)).bold()
                        .foregroundColor(Color("TertiaryTheme"))
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
                            Image(systemName: "person")
                                .foregroundColor(.gray)
                                .padding(.leading, 85)
                            TextField("Username", text: $username)
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
                    Text("Already have one? ")
                        .font(.headline).bold()
                        .foregroundColor(.white)
                    Button(action: {
                        showingLogin = true
                    }) {
                        Text("Sign in")
                            .font(.headline).bold()
                            .foregroundColor(Color("SecondaryTheme"))
                            .underline()
                    }
                    .fullScreenCover(isPresented: $showingLogin) {
                        LoginView()
                    }
                }
                Spacer()
                Button(action: { viewModel.register(withEmail: email, password: password, username: username) }) {
                    ZStack {
                        Rectangle()
                            .frame(width: 150, height: 50)
                            .cornerRadius(25)
                            .foregroundColor(Color("TertiaryTheme"))
                        Text("Sign Up")
                            .bold()
                            .foregroundColor(.white)
                    }
                }
                Spacer()

            }
        }
    }
}

struct GetStartedView_Previews: PreviewProvider {
    static var previews: some View {
        RegistrationView()
    }
}
