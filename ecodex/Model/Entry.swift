
import Foundation

import FirebaseFirestoreSwift
import Firebase
import CoreLocation

struct Entry: Identifiable, Codable {
    @DocumentID var id: String?
    let plantID: String
    let userID: String
    let location: Coordinate
    let entryImage: String
    let timestamp: Timestamp
}

struct Coordinate: Codable {
    let latitude: Double
    let longitude: Double

    func locationCoordinate() -> CLLocationCoordinate2D {
        return CLLocationCoordinate2D(latitude: self.latitude,
                                      longitude: self.longitude)
    }
}
