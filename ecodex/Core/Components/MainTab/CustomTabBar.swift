
import SwiftUI

enum Tabs: Int {
    case ecoDex = 0
    case map = 1
    case camera = 2
    case explore = 3
    case profile = 4
}

struct CustomTabBar: View {
    @Binding var selectedTab: Tabs
    @Namespace var animation
    
    var body: some View {
        HStack(alignment: .center) {
            
            Button {
                selectedTab = .ecoDex
            } label: {
                
                GeometryReader { geo in
                    
//                    if selectedTab == .ecoDex {
//                        Rectangle()
//                            .foregroundColor(Color(.systemMint))
//                            .frame(width: geo.size.width/2, height: 4)
//                            .padding(.leading, geo.size.width/4)
//                            .matchedGeometryEffect(id: "switch", in: animation)
//                    }
                    
                    VStack(alignment: .center, spacing: 4) {
                        Image(systemName: "leaf\(selectedTab == .ecoDex ? ".fill" : "")")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 24, height: 24)
                            .foregroundColor(Color("TertiaryTheme"))
                        
                        Text("EcoDex")
                            .font(Font.custom("LexendDeca-Regular", size: 12))
                            .foregroundColor(Color("TertiaryTheme"))
                    }
                    
                    .frame(width: geo.size.width, height: geo.size.height)
                }
            }
            
            Button {
                selectedTab = .explore
            } label: {
                GeometryReader { geo in
                    
//                    if selectedTab == .explore {
//                        Rectangle()
//                            .foregroundColor(Color(.systemMint))
//                            .frame(width: geo.size.width/2, height: 4)
//                            .padding(.leading, geo.size.width/4)
//                            .matchedGeometryEffect(id: "switch", in: animation)
//                    }
                    
                    VStack(alignment: .center, spacing: 4) {
                        Image(systemName: "magnifyingglass.circle\(selectedTab == .explore ? ".fill" : "")")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 24, height: 24)
                            .foregroundColor(Color("TertiaryTheme"))
                        Text("Explore")
                            .font(Font.custom("LexendDeca-Regular", size: 12))
                            .foregroundColor(Color("TertiaryTheme"))
                    }
                    .frame(width: geo.size.width, height: geo.size.height)
                }
            }
            
            Button {
                selectedTab = .camera
            } label: {
                GeometryReader { geo in
                    VStack(alignment: .center, spacing: 4) {
                        Image(systemName: "camera.circle.fill\(selectedTab == .camera ? ".banana" : "")")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 75, height: 75)
                            .foregroundColor(Color("TertiaryTheme"))
                    }
                    .frame(width: geo.size.width, height: geo.size.height)
                }
            }
            
            Button {
                selectedTab = .map
            } label: {
                GeometryReader { geo in
                    
//                    if selectedTab == .map {
//                        Rectangle()
//                            .foregroundColor(Color(.systemMint))
//                            .frame(width: geo.size.width/2, height: 4)
//                            .padding(.leading, geo.size.width/4)
//                            .matchedGeometryEffect(id: "switch", in: animation)
//                    }
                    
                    VStack(alignment: .center, spacing: 4) {
                        Image(systemName: "map\(selectedTab == .map ? ".fill" : "")")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 24, height: 24)
                            .foregroundColor(Color("TertiaryTheme"))
                        Text("Map")
                            .font(Font.custom("LexendDeca-Regular", size: 12))
                            .foregroundColor(Color("TertiaryTheme"))
                    }
                    .frame(width: geo.size.width, height: geo.size.height)
                }
            }
            
            Button {
                selectedTab = .profile
            } label: {
                GeometryReader { geo in
                    
//                    if selectedTab == .profile {
//                        Rectangle()
//                            .foregroundColor(Color(.systemMint))
//                            .frame(width: geo.size.width/2, height: 4)
//                            .padding(.leading, geo.size.width/4)
//                            .matchedGeometryEffect(id: "switch", in: animation)
//                    }
                    
                    VStack(alignment: .center, spacing: 4) {
                        Image(systemName: "person.circle\(selectedTab == .profile ? ".fill" : "")")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 24, height: 24)
                            .foregroundColor(Color("TertiaryTheme"))
                        Text("Profile")
                            .font(Font.custom("LexendDeca-Regular", size: 12))
                            .foregroundColor(Color("TertiaryTheme"))
                    }
                    .frame(width: geo.size.width, height: geo.size.height)
                }
            }
        }
        .frame(height: 92)
        .background(Color(.white))
    }
}

struct CustomTabBar_Previews: PreviewProvider {
    static var previews: some View {
        CustomTabBar(selectedTab: .constant(.ecoDex))
    }
}
