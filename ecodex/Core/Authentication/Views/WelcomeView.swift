
import SwiftUI

struct WelcomeView: View {
    @State private var showingRegistration = false
    @State private var showingLogin = false
    
    var body: some View {
        ZStack {
            Color("ThemeColor")
                .ignoresSafeArea()
            VStack {
                Group {
                    Spacer()
                    Spacer()
                    Image("EcoDex")
                        .resizable()
                        .frame(width: 175, height: 175)
                        .scaledToFit()
                        .cornerRadius(30)
                }
                Spacer()
                Button(action: {
                    showingRegistration = true
                }) {
                    ZStack {
                        Rectangle()
                            .frame(width: 250, height: 50)
                            .foregroundColor(Color("SecondaryTheme"))
                            .cornerRadius(15)
                            .shadow(color: Color(.gray).opacity(0.4), radius: 5)
                            .padding(.vertical, -7)
                        Text("Get Started")
                            .font(.title3).bold()
                            .foregroundColor(.white)
                    }
                }
                .fullScreenCover(isPresented: $showingRegistration) {
                    RegistrationView()
                }
                Button(action: {
                    showingLogin = true
                }) {
                    ZStack {
                        Rectangle()
                            .frame(width: 250, height: 50)
                            .foregroundColor(.white)
                            .cornerRadius(15)
                            .shadow(color: Color(.gray).opacity(0.4), radius: 5)
                        Text("Sign In")
                            .font(.title3).bold()
                            .foregroundColor(Color("SecondaryTheme"))
                    }
                    .padding(.vertical, 10)
                }
                .fullScreenCover(isPresented: $showingLogin) {
                    LoginView()
                }
                Spacer()
            }
        }
    }
}



struct WelcomeView_Previews: PreviewProvider {
    static var previews: some View {
        WelcomeView()
    }
}
