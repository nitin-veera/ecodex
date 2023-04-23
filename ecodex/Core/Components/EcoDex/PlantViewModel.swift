
import Foundation

import SwiftUI
import Firebase
import FirebaseStorage

class PlantViewModel:ObservableObject {
    
    @Published var plantImage: UIImage?
    private let plantService = PlantService()
    
    let plant: Plant
    
    
    init(plant:Plant) {
        self.plant = plant
        self.fetchPlantImage()
    }
    
    func fetchPlantImage() {
        guard self.plantImage == nil else {
            return
        }
        
        plantService.fetchPlantImage(plant: self.plant) { image in
            self.plantImage = image
        }
    }
}
