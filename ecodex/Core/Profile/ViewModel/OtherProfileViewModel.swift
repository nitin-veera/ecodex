
import SwiftUI
import Foundation
import Firebase

class OtherProfileViewModel: ObservableObject {
    
    @Published var recentEntries = [Entry]()
    @Published var user: User
    @Published var userImage: UIImage?
    
    let entryService = EntryService()
    let userService = UserService()

    init(user:User) {
        self.user = user
        fetchRecentUserEntries()
        fetchUserImage()
    }
    
    func fetchRecentUserEntries() {
        guard let uid = self.user.id else { return }
        entryService.fetchRecentUserEntries(forUid: uid) { entries in
            self.recentEntries = entries
        }
    }
    
    func fetchUserImage() {
        guard self.userImage == nil else {
            return
        }
        
        userService.fetchUserImage(user: self.user) { image in
            self.userImage = image
        }
    }
}
