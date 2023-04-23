
import SwiftUI
import UIKit

struct EcoDexView: View {
    private let gridItems = [GridItem(.flexible()), GridItem(.flexible())]
    @ObservedObject var viewModel = EcoDexViewModel()
    
    
    var body: some View {
        
        NavigationView {
            ScrollView {
                VStack(alignment: .center, spacing: 0) {
                    Spacer()
                    
                    ScrollView {
                        LazyVGrid(columns: gridItems, spacing: 16) {
                            ForEach(viewModel.plants) { plant in
                                if (viewModel.isFound(plant: plant)) {
                                    PlantView(plant: plant) }
                                else {
                                    UndiscoveredPlantView(plant: plant) }
                            }
                        }
                    }
                    .padding([.leading, .trailing])
                    
                    //filterTab
                }
                .navigationTitle("EcoDex")
                .navigationBarTitleDisplayMode(.inline)
                .safeAreaInset(edge: .bottom, alignment: .center, spacing: 10) {
                    Color.themeColor
                        .frame(height: 40)
                        .background(Material.bar)
                }
            }
            .background(.white)
        }
    }
}

struct EcoDexView_Previews: PreviewProvider {
    static var previews: some View {
        EcoDexView()
    }
}

//extension EcoDexView {
//
//    var filterTab: some View {
//
//    }
//}

