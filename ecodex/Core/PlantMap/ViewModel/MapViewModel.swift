
import Foundation
import CoreLocation
import MapKit

final class MapViewModel: NSObject, ObservableObject, CLLocationManagerDelegate {
    @Published var region = MKCoordinateRegion()
    @Published var entries = [Entry]()
    
    let entryService = EntryService()
    
    func fetchEntries() {
        entryService.fetchAllEntries { entries in
            self.entries = entries
        }
    }
    
    var locationManager: CLLocationManager?
    
    override init() {
            self.region = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 34.070211, longitude: -118.446775), span: MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01))
            super.init()
            checkIfLocationServicesIsEnabled()
            fetchEntries()
        }
    
    func checkIfLocationServicesIsEnabled() {
        if CLLocationManager.locationServicesEnabled() {
            locationManager = CLLocationManager()
            locationManager!.delegate = self
            locationManager!.requestWhenInUseAuthorization()
        } else {
            print("Location services off...")
        }
    }
    
    private func checkLocationAuthorization() {
        guard let locationManager = locationManager else { return }
        
        switch locationManager.authorizationStatus {
        case .notDetermined:
            locationManager.requestWhenInUseAuthorization()
        case .restricted:
            print("Your location is restricted most likely due to parental controls.")
        case .denied:
            print("You have denied this app location permission. Change this in settings")
        case .authorizedAlways, .authorizedWhenInUse:
            region = MKCoordinateRegion(center: locationManager.location!.coordinate, span: MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01))
        @unknown default:
            break
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        checkLocationAuthorization()
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let location = locations.last else { return }
        region = MKCoordinateRegion(center: location.coordinate, span: MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01))
    }
}
