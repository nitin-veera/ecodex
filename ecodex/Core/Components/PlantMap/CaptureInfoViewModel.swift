import Foundation
import Firebase

class CaptureInfoViewModel:ObservableObject {
    
    @Published var entry: Entry
    @Published var entryImage: UIImage?
    @Published var userImage: UIImage? = nil
    @Published var plant: Plant?
    @Published var user: User?
    
    private let plantService = PlantService()
    private let entryService = EntryService()
    private let userService = UserService()
    
    init(entry: Entry) {
        self.entry = entry
        self.fetchUser()
        self.fetchPlant()
        self.fetchEntryImage()
        //self.fetchUserImage()
        
    }
    
    func fetchEntryImage() {
        guard self.entryImage == nil else {
            return
        }
        entryService.fetchEntryImage(entry: self.entry) { image in
            self.entryImage = image
        }
    }
    
    func fetchUser() {
        userService.fetchUser(withUid: self.entry.userID) { user in
            self.user = user
        }
    }
    
    func fetchUserImage() {
        guard self.userImage == nil else {
            return
        }
        
//        userService.fetchUserImage(user: self.user!) { image in
//            self.userImage = image
//        }
    }
    
    
    func fetchPlant() {
        plantService.fetchPlant(withPlantID: self.entry.plantID){ plant in
            self.plant = plant
        }
    }
    
    
    
}
