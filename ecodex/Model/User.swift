
import Foundation


import FirebaseFirestoreSwift
import Firebase

struct User: Identifiable, Codable {
    @DocumentID var id: String?
    let username: String
    let email: String
    let profileImage: String?
}
