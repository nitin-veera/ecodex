
import SwiftUI

struct PlantView: View {
    @ObservedObject var viewModel: PlantViewModel
    
    init(plant: Plant) {
        self.viewModel = PlantViewModel(plant: plant)
    }
    
    var body: some View {
        VStack (alignment: .leading) {
            if let image = viewModel.plantImage {
                Image(uiImage: image)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 170, height: 130, alignment: .center)
                    .clipped()
            }
            else {
                Image("Verbena")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(height: 130, alignment: .center)
                    .clipped()
            }
            
            VStack (alignment: .leading) {
                Text(String(format: "#%03d", viewModel.plant.plantNumber))
                    .font(.headline)
                    .foregroundColor(Color(.systemGray3))
                
                Text(viewModel.plant.commonName.capitalized)
                    .bold()
                    .lineLimit(1)
                    .truncationMode(.tail)
                    .foregroundColor(.white)
                Text(viewModel.plant.scientificName.capitalized)
                    .font(.caption)
                    .italic()
                    .lineLimit(1)
                    .truncationMode(.tail)
                    .foregroundColor(.white)
            }
            .padding([.leading,.bottom, .trailing])
        }
        .background(Color("TertiaryTheme"))
        .cornerRadius(12)
        .shadow(color: Color.black.opacity(0.3), radius: 2, x: 0, y:1)

    }
}

struct PlantView_Previews: PreviewProvider {
    static var previews: some View {
        PlantView(plant: mockPlant[0])
    }
}
