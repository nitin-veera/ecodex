
import MapKit
import SwiftUI

struct PlantMapView: View {
    @StateObject var viewModel = MapViewModel()
    @State private var showingCaptureInfo = false
    @State private var settingsDetent = PresentationDetent.height(300)
    
    var body: some View {
        Map(coordinateRegion: $viewModel.region, showsUserLocation: true, annotationItems: viewModel.entries) { place in
            MapAnnotation(coordinate: CLLocationCoordinate2D(latitude: place.location.latitude, longitude: place.location.longitude) ) {
                HStack {
                    Image(systemName: "tree")
                        .foregroundColor(Color(.white))
                        .scaleEffect(1.2)
                }
                .shadow(color: .gray, radius: 3)
                .padding(6)
                .background(Color("TertiaryTheme"))
                .cornerRadius(100)
                .frame(width: 10, height: 10)
                .onTapGesture {
                    showingCaptureInfo = true
                }
                .sheet(isPresented: $showingCaptureInfo) {
                    CaptureInfoView(entry:place)
                        .presentationDetents(
                            [.height(300)],
                            selection: $settingsDetent
                        )
                }
            }
        }
            .ignoresSafeArea()
            .accentColor(Color(.systemMint))
            .onAppear {
                viewModel.checkIfLocationServicesIsEnabled()
            }

    }
}

struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        PlantMapView()
    }
}
