

import Firebase
import FirebaseStorage

struct PlantService {
    
    // returns plant document given a plantID
    func fetchPlant(withPlantID plantID: String, completion: @escaping(Plant) -> Void) {
        Firestore.firestore().collection("plants")
                    .document(plantID)
                    .getDocument { snapshot, _ in
                        guard let snapshot = snapshot else { return }
                        
                        guard let plant = try? snapshot.data(as: Plant.self) else { return }
                       completion(plant)
                    }
    }
    
    func fetchPlantIDByName(withScientificName plantName: String, completion: @escaping(String) -> Void) {
        Firestore.firestore().collection("plants").whereField("scientificName", isEqualTo: plantName)
            .getDocuments() { snapshot, _ in
                guard let documents = snapshot?.documents else { return }
                for document in documents {
                    print(document.documentID)
                    completion(document.documentID)
                }
            }
        }
    
    // returns collection of all plants, sorted by ascending dex number
    func fetchAllPlants(completion: @escaping([Plant]) -> Void) {
        Firestore.firestore().collection("plants")
            .order(by: "plantNumber", descending: false)
            .getDocuments { snapshot, _ in
                guard let documents = snapshot?.documents else { return }
                let plants = documents.compactMap({ try? $0.data(as: Plant.self)})
                completion(plants)
            }
    }
    
    func fetchPlantImage(plant: Plant, completion: @escaping(UIImage) -> Void) {
        let storage = Storage.storage()
        let storageRef = storage.reference()
        let plantRef = storageRef.child("/PlantDbImages/\(plant.scientificName).jpeg")
        
        plantRef.getData(maxSize: 1 * 1024 * 1024) { data, error in
            if let error = error {
                print("Error downloading image: \(error)")
 
            } else {
                if let imageData = data, let image = UIImage(data: imageData) {
                    completion(image)
                } else {

                }
            }
        }
    }
    
}
