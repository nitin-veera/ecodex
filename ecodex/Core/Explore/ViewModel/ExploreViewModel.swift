
import SwiftUI
import Foundation
import Firebase

class ExploreViewModel:ObservableObject {
    
    @Published var users = [User]()
    
    @Published var searchText = ""
    
    var searchableUsers: [User] {
        if searchText.isEmpty {
            return users
        } else {
            let lowercasedQuery = searchText.lowercased()
                return users.filter({
                    $0.username.contains(lowercasedQuery)
                })
        }
    }
    
    let userService = UserService()
    
    init() {
        fetchUsers()
    }
    
    func fetchUsers() {
        userService.fetchAllUsers { users in
            self.users = users
        }
    }
    
    
    
    
    // fetchFoundPlants
    
    // fetchUndiscoveredPlants
    
}

