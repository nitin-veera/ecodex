
import SwiftUI
import Firebase

class AuthViewModel:ObservableObject {
    
    @Published var userSession: FirebaseAuth.User?
    @Published var didAuthenticateUser = false
    @Published var currentUser: User?
    
    private let service = UserService()
    
    init() {
        self.userSession = Auth.auth().currentUser
        self.fetchCurrentUser()
    }
    
    func login(withEmail email: String, password: String) {
        Auth.auth().signIn(withEmail: email, password: password) { (result, error) in
            if error != nil {
                print(error?.localizedDescription ?? "")
                return
            } else {
                guard let user = result?.user else { return }
                self.userSession = user
                self.fetchCurrentUser()
            }
        }
    }
    
    func register(withEmail email: String, password: String, username: String) {
        Auth.auth().createUser(withEmail: email, password: password) { result, error in
            if error != nil {
                print(error?.localizedDescription ?? "")
                return
            }
            
            guard let user = result?.user else { return }

            self.userSession = user
            
            let newUser = User(username: username, email: email, profileImage: nil)
            
            do {
                try Firestore.firestore().collection("users")
                        .document(user.uid)
                        .setData(from: newUser)
                self.didAuthenticateUser = true

            } catch let error {
                print("Error writing user to Firestore: \(error)")
            }
        }
    }
    
    func logout() {
        didAuthenticateUser = false
        userSession = nil
        try? Auth.auth().signOut()
    }
    
    func fetchCurrentUser() {
        guard let uid = self.userSession?.uid else { return }
        
        service.fetchUser(withUid: uid) { user in
            self.currentUser = user
        }
    }
    
    func uploadProfileImage(_ image: UIImage) {
        guard let uid = self.userSession?.uid else { return }
            
            ImageUploader.uploadImage(image: image) { profileImageUrl in
                Firestore.firestore().collection("users")
                    .document(uid)
                    .updateData(["profileImageUrl": profileImageUrl]) { _ in
                    }
            }
        }
}


