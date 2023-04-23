import SwiftUI

struct MainTabView: View {
    @State private var selectedTab = Tabs.ecoDex
    
    var body: some View {
        ZStack {
            Color("ThemeColor")
                .ignoresSafeArea()
            TabView(selection: $selectedTab) {
                EcoDexView()
                    .tag(Tabs.ecoDex)
                
                PlantMapView()
                    .tag(Tabs.map)
                
                CameraView()
                    .tag(Tabs.camera)
                
                ExploreView()
                    .tag(Tabs.explore)
                
                ProfileView()
                    .tag(Tabs.profile)
            }
            .overlay(
                CustomTabBar(selectedTab: $selectedTab)
                    .frame(height: 92)
                    .background(Color.white)
                    .shadow(color: Color.black.opacity(0.1), radius: 10, x: 0, y: -5)
                    .alignmentGuide(.bottom) { d in d[.bottom] }
                    , alignment: .bottom
            )
            .ignoresSafeArea(.keyboard)
            .offset(x: 0, y: UIScreen.main.bounds.height / 10 - 65)
        }
        .edgesIgnoringSafeArea(.top)
    }
}


struct MainTabView_Previews: PreviewProvider {
    static var previews: some View {
        MainTabView()
    }
}
