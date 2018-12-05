import UIKit

enum ListRepositories {
    // MARK: Use cases
    
    struct ViewModel {
        struct DisplayedRepositorie {
            let name: String
        }
        var displayedRepositories: [DisplayedRepositorie]
    }
}
