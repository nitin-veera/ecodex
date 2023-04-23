
import SwiftUI
import Foundation
import Firebase

class ProfileViewModel: ObservableObject {
    
    @Published var recentEntries = [Entry]()
    let entryService = EntryService()

    init() {
        fetchRecentUserEntries()
        print("YOOOOOOO")
    }
    
    func fetchRecentUserEntries() {
        guard let uid = Auth.auth().currentUser?.uid else { return }
        entryService.fetchRecentUserEntries(forUid: uid) { entries in
            self.recentEntries = entries
            print("we did it")
        }
    }

}
