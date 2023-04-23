
import Foundation
import Firebase
import FirebaseStorage

class RecentEntryViewModel:ObservableObject {
    
    @Published var entry: Entry
    @Published var entryImage: UIImage?
    @Published var plant: Plant?
    
    private let plantService = PlantService()
    private let entryService = EntryService()
    
    init(entry: Entry) {
        self.entry = entry
        self.fetchEntryImage()
        self.fetchPlant()
    }
    
    func fetchEntryImage() {
        guard self.entryImage == nil else {
            return
        }
        entryService.fetchEntryImage(entry: self.entry) { image in
            self.entryImage = image
        }
    }
    
    func fetchPlant() {
        plantService.fetchPlant(withPlantID: self.entry.plantID){ plant in
            self.plant = plant
        }
    }
    
}
