

import Foundation
import Firebase
import FirebaseStorage

struct EntryService {
    
    // uploads a new entry given the plantID, longitude, and latitude
    func uploadEntry(plantID: String, location: Coordinate, entryImage: String, completion: @escaping(Bool) -> Void) {
        guard let uid = Auth.auth().currentUser?.uid else { return }
        
        let newEntry = Entry(plantID: plantID, userID: uid, location: location, entryImage: entryImage, timestamp: Timestamp(date: Date()))
            
        do {
            try Firestore.firestore().collection("entries")
                .document()
                .setData(from: newEntry)
            print("sent to firestore")
            completion(true)
                
        } catch let error {
            print("Error writing entry to Firestore: \(error)")
            completion(false)
        }
        
    }
    
    // returns all entries for a specified user
    func fetchUserEntries(forUid uid: String, completion: @escaping([Entry]) -> Void) {
        
        Firestore.firestore().collection("entries")
            .whereField("userID", isEqualTo: uid)
            .addSnapshotListener { snapshot, _ in
                guard let documents = snapshot?.documents else { return }
                
                let entries = documents.compactMap({ try? $0.data(as: Entry.self)}) as! [Entry]
                completion(entries)
            }
    }
    
    func fetchRecentUserEntries(forUid uid: String, completion: @escaping([Entry]) -> Void) {
        
        Firestore.firestore().collection("entries")
            .whereField("userID", isEqualTo: uid)
            .order(by: "timestamp", descending: true)
            .limit(to: 10)
            .addSnapshotListener { snapshot, _ in
                guard let documents = snapshot?.documents else { return }
                
                let entries = documents.compactMap({ try? $0.data(as: Entry.self)}) as! [Entry]
                completion(entries)
            }
    }
    
    func fetchAllEntries(completion: @escaping([Entry]) -> Void) {
        Firestore.firestore().collection("entries")
            .getDocuments { snapshot, _ in
                guard let documents = snapshot?.documents else { return }
                let entries = documents.compactMap({ try? $0.data(as: Entry.self)})
                completion(entries)
            }
    }
    
    func fetchEntryImage(entry: Entry, completion: @escaping(UIImage) -> Void) {
        let storage = Storage.storage()
        let storageRef = storage.reference()
        let entryRef = storageRef.child(entry.entryImage)
        
        entryRef.getData(maxSize: 1 * 1024 * 1024) { data, error in
            if let error = error {
                print("Error downloading image: \(error)")
 
            } else {
                if let imageData = data, let image = UIImage(data: imageData) {
                    completion(image)
                } else {
                    print("did not return anything")
                }
            }
        }
    }
}
