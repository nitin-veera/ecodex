

import SwiftUI

struct OtherProfileView: View {
    
    @ObservedObject var viewModel: OtherProfileViewModel
    
    init (user:User) {
        viewModel = OtherProfileViewModel(user:user)
    }
    
    var body: some View {
        
            ScrollView {
                VStack {
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

struct OtherProfileView_Previews: PreviewProvider {
    static var previews: some View {
        OtherProfileView(user:User(username: "nitbro", email: "nit@gmail", profileImage: nil))
    }
}

extension OtherProfileView {
    
    var profileHeaderView: some View {
        Group {
            if let image = viewModel.userImage {
                Image(uiImage: image)
            } else {
                Image(systemName: "person.crop.circle")
                    .resizable()
                    .foregroundColor(Color.themeColor)
                    .modifier(OtherProfileImageModifier())
            }
                
            ZStack {
                Rectangle()
                    .frame(width: 150, height: 40)
                    .cornerRadius(17)
                    .foregroundColor(.white)
                    .shadow(color: Color(.gray).opacity(0.4), radius: 5)
                    .padding()
                
                Text("@\(viewModel.user.username)")
                    .font(.headline)
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
//                Text("69")
//                    .foregroundColor(.white)
//                    .font(.subheadline).bold()
//                    .offset(x: 0, y: 9)
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
                if (viewModel.recentEntries.count > 0) {
                    ScrollView(.horizontal) {
                        HStack {
                            ForEach(viewModel.recentEntries) { entry in
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
    
    
    private struct OtherProfileImageModifier: ViewModifier {
        func body(content: Content) -> some View {
            content
                .scaledToFill()
                .frame(width: 180, height: 180)
                .overlay(
                    RoundedRectangle(cornerRadius: 90)
                        .stroke(Color.themeColor, lineWidth: 10)
                )
                .clipShape(Circle())
                .padding(.bottom, 10)
                .padding(.top, 30)
        }
    }
}
