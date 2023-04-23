
import Firebase
import FirebaseStorage

struct UserService {
    
    func fetchUser(withUid uid: String, completion: @escaping(User) -> Void) {
        Firestore.firestore().collection("users")
            .document(uid)
            .getDocument { snapshot, _ in
                guard let snapshot = snapshot else { return }
                
                guard let user = try? snapshot.data(as: User.self) else { return }
               completion(user)
            }
    }
    
    func fetchAllUsers(completion: @escaping([User]) -> Void) {
        guard let uid = Auth.auth().currentUser?.uid else { return }
        print(uid)
        Firestore.firestore().collection("users")
            .getDocuments { snapshot, _ in
                guard let documents = snapshot?.documents else { return }
                let users = documents.compactMap({ try? $0.data(as: User.self)})
                completion(users)
            }
    }
    
    func fetchUserImage(user: User, completion: @escaping(UIImage) -> Void) {
        let storage = Storage.storage()
        let storageRef = storage.reference()
        let userRef = storageRef.child("/ProfileImages/\(user.username).jpeg")
        
        userRef.getData(maxSize: 1 * 1024 * 1024) { data, error in
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
