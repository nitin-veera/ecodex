

import SwiftUI

struct ExploreView: View {
    @ObservedObject var viewModel = ExploreViewModel()
    @ObservedObject var authViewModel = AuthViewModel()
        
    var body: some View {
        NavigationView {
            ZStack {
                Color(.white)
                    .ignoresSafeArea()
                VStack {
                    SearchBar(text: $viewModel.searchText)
                        .padding()
                    ScrollView {
                        LazyVStack {
                            ForEach(viewModel.searchableUsers) { user in
                                if (authViewModel.currentUser?.id != user.id) {
                                    NavigationLink {
                                        OtherProfileView(user:user)
                                    } label: {
                                        UserRowView(user:user)
                                    }
                                    Divider()
                                }
                            }
                        }
                    }
                }
                .navigationTitle("Explore")
                .navigationBarTitleDisplayMode(.inline)
                .safeAreaInset(edge: .bottom, alignment: .center, spacing: 10) {
                    Color("TertiaryColor")
                        .frame(height: 20)
                        .background(Material.bar)
                }
            }
        }
    }
}

struct ExploreView_Previews: PreviewProvider {
    static var previews: some View {
        ExploreView()
    }
}
