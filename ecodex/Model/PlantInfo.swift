
import Foundation

struct PlantInfo: Decodable, Identifiable {
    let id: Int
    let commonName: String
    let scientificName: String
    let plantType: String
    let flowerColor: String
    let height: String
}

let mockPlantInfo: [PlantInfo] = [
    .init(id: 0, commonName: "Bay Laurel", scientificName: "Verbena californica", plantType: "Evergreen tree", flowerColor: "Small, yellowish-green flowers", height: "30-40 feet"),
    .init(id: 1, commonName: "Bay Laurel", scientificName: "Verbena californica", plantType: "Evergreen tree", flowerColor: "Small, yellowish-green flowers", height: "30-40 feet"),
    .init(id: 2, commonName: "Bay Laurel", scientificName: "Verbena californica", plantType: "Evergreen tree", flowerColor: "Small, yellowish-green flowers", height: "30-40 feet"),
    .init(id: 3, commonName: "Bay Laurel", scientificName: "Verbena californica", plantType: "Evergreen tree", flowerColor: "Small, yellowish-green flowers", height: "30-40 feet"),
    .init(id: 4, commonName: "Bay Laurel", scientificName: "Verbena californica", plantType: "Evergreen tree", flowerColor: "Small, yellowish-green flowers", height: "30-40 feet")
]
