
import SwiftUI

struct InfoView: View {
    let plant: Plant
    
    init(plant:Plant) {
        self.plant = plant
    }
    
    var body: some View {
        ZStack {
            Color("TertiaryTheme")
                .ignoresSafeArea()
            VStack {
                ScrollView(.vertical) {
                    ScrollView(.horizontal) {
                        Spacer()
                        VStack {
                            Text(plant.commonName)
                                .font(.title).bold()
                                .foregroundColor(.white)
                        }
                        HStack {
                            Image(systemName: "leaf.fill")
                                .resizable()
                                .frame(width: 30, height: 30)
                            Text(String(format: "#%03d", (plant.plantNumber)))
                                .font(.title)
                        }
                        .foregroundColor(.white)
                        .padding(.vertical, -10)
                        VStack (alignment: .leading, spacing: 15) {
                            HStack (alignment: .top) {
                                Text("Common Name: ")
                                    .bold()
                                Text(plant.commonName)
                            }
                            .foregroundColor(.white)
                            HStack (alignment: .top) {
                                Text("Scientific Name: ")
                                    .bold()
                                Text(plant.scientificName)
                                    .italic()
                            }
                            .foregroundColor(.white)
                            HStack (alignment: .top) {
                                Text("Type: ")
                                    .bold()
                                Text(plant.plantType)
                            }
                            .foregroundColor(.white)
                            HStack (alignment: .top) {
                                Text("Flower Color: ")
                                    .bold()
                                Text(plant.flowerColor)
                            }
                            .foregroundColor(.white)
                            HStack (alignment: .top) {
                                Text("Height: ")
                                    .bold()
                                Text(plant.height)
                            }
                            .foregroundColor(.white)
                        }
                        .font((.subheadline))
                        .frame(width: 350, height: 200)
                        .padding()
                        Spacer()
                    }
                }
                .fixedSize(horizontal: true, vertical: true)
            }
        }
    }
}

struct InfoView_Previews: PreviewProvider {
    static var previews: some View {
        InfoView(plant: mockPlant[0])
    }
}
