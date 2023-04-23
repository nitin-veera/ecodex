
import SwiftUI
import Firebase
import FirebaseStorage
import FirebaseAuth

class EcoDexViewModel:ObservableObject {
    
    @Published var plants = [Plant]()
    @Published var entries = [Entry]()
    
    let plantService = PlantService()
    let entryService = EntryService()
    
    init() {
        fetchPlants()
        fetchEntries()
    }
    
    func fetchPlants() {
        plantService.fetchAllPlants { plants in
            self.plants = plants
        }
    }
    
    func fetchEntries() {
        guard let uid = Auth.auth().currentUser?.uid else { return }
        entryService.fetchUserEntries(forUid: uid) { entries in
            self.entries = entries
        }
    }
    
    
    func isFound(plant: Plant) -> Bool {
        let foundPlants = self.entries.map({$0.plantID})
        if foundPlants.contains(plant.id!) {
            return true
        } else {
            return false
        }
    }
    
    // fetchFoundPlants
    
    // fetchUndiscoveredPlants
    
    
}
