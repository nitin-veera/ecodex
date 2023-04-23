

import SwiftUI

struct UserRowView: View {
    @ObservedObject var viewModel: OtherProfileViewModel
    
    var user: User
    
    init(user:User) {
        self.user = user
        viewModel = OtherProfileViewModel(user:user)
    }
    
    var body: some View {
        HStack {
            if let image = viewModel.userImage {
                Image(uiImage: image)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 48, height: 48)
            }
            else {
                Circle()
                    .frame(width: 48, height: 48)
                    .foregroundColor(Color("TertiaryTheme"))
            }
            VStack(alignment: .leading) {
                Text("@\(user.username)")
                    .font(.subheadline).bold()
                    .foregroundColor(.black)
            }
            Spacer()
        }
        .padding(.horizontal)
        .padding(.vertical, 4)
    }
}

struct UserRowView_Previews: PreviewProvider {
    static var previews: some View {
        UserRowView(user:User(username: "nitbro", email: "nit@gmail", profileImage: nil))
    }
}
