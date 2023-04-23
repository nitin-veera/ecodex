
import Foundation

import FirebaseFirestoreSwift
import Firebase

struct Plant: Identifiable, Codable {
    @DocumentID var id: String?
    let scientificName: String
    let commonName: String
    let plantNumber: Int
    // description items
    let flowerColor: String
    let habitat: String
    let height: String
    let plantType: String
    let wildlifeBenefit: String
}

let mockPlant: [Plant] = [
    .init(scientificName: "Verbena californica", commonName: "Verbena", plantNumber: 1, flowerColor: "", habitat: "", height: "", plantType: "", wildlifeBenefit: "")
]
