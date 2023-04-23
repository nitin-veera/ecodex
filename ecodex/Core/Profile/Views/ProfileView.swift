
import SwiftUI

struct ProfileView: View {
    @EnvironmentObject var authViewModel: AuthViewModel
    @ObservedObject var profileViewModel = ProfileViewModel()
    @State private var showImagePicker = false
    @State private var selectedImage: UIImage?
    @State private var profileImage: Image?
    @State var shouldHide = true
    
    var body: some View {
        
            ScrollView {
                VStack {
                    logoutButton
                    profileHeaderView
//                    profileStatsView
                    profileRecentEntries
                    Spacer()
                }
            }
            .safeAreaInset(edge: .bottom, alignment: .center, spacing: 10) {
                            Color.white
                                .frame(height: 26)
                                .background(Material.bar)
                        }

        }

    
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
            .environmentObject(AuthViewModel())
    }
}

extension ProfileView {
    
    var logoutButton: some View {
        Button(action: { authViewModel.logout() }) {
            Text("Logout")
                .frame(maxWidth: .infinity, alignment: .trailing)
                .padding(.trailing, 40)
                .padding(.top, 20)
                .foregroundColor(Color("TertiaryTheme"))
                .font(.title3)
                .bold()
        }
    }
    
    var profileHeaderView: some View {
        Group {
            Button {
                print("Pick image here..")
                showImagePicker.toggle()
            } label: {
                if let profileImage = profileImage {
                    profileImage
                        .resizable()
                } else {
                    Image(systemName: "person.crop.circle")
                        .resizable()
                        .foregroundColor(Color.themeColor)

                    
                }
            }.sheet(isPresented: $showImagePicker, onDismiss: loadImage) {
                ImagePicker(selectedImage: $selectedImage)
            }
            .modifier(ProfileImageModifier())
            
            ZStack {
                Rectangle()
                    .frame(width: 150, height: 40)
                    .cornerRadius(17)
                    .foregroundColor(.white)
                    .shadow(color: Color(.gray).opacity(0.4), radius: 5)
                    .padding()
                
                if let user = authViewModel.currentUser {
                    Text("@\(user.username)")
                        .font(.headline)
                }
            }
        }
    }
    
//    var profileStatsView: some View {
//        VStack {
//            Text("EcoDex Entries")
//                .font(.title2).bold()
//                .foregroundColor(Color("TertiaryTheme"))
//                .offset(x: 0, y: 0)
//            ZStack {
//                Image("DS")
//                    .resizable()
//                    .clipShape(Circle())
//                    .frame(width: 70, height: 70)
//                    .shadow(color: Color(.gray).opacity(0.4), radius: 5)
//                if let user = authViewModel.currentUser {
//                    Text("69")
//                        .foregroundColor(.white)
//                        .font(.subheadline).bold()
//                        .offset(x: 0, y: 9)
//                }
//            }
//        }
//        .padding(.top)
//    }
    
    var profileRecentEntries: some View {
            Group {
                Text("Recent Entries")
                    .padding(.top, 30)
                    .font(.title2).bold()
                    .foregroundColor(Color("TertiaryTheme"))
                if (profileViewModel.recentEntries.count > 0) {
                    ScrollView(.horizontal) {
                        HStack {
                            ForEach(profileViewModel.recentEntries) { entry in
                                RecentEntryView(entry:entry)
                            }
                            .padding(1)
                        }
                    }
                } else {
                    NothingToSeeHereView()
                }
                
            }
        }
    
    func loadImage() {
        guard let selectedImage = selectedImage else { return }
        profileImage = Image(uiImage: selectedImage)
        if let profileImage = profileImage {
            authViewModel.uploadProfileImage(selectedImage)
        }
    }
}

private struct ProfileImageModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .scaledToFill()
            .frame(width: 180, height: 180)
            .overlay(
                RoundedRectangle(cornerRadius: 90)
                    .stroke(Color("TertiaryTheme"), lineWidth: 10)
            )
            .clipShape(Circle())
            .padding(.bottom, 10)
    }
}
