import UIKit

protocol ListRepositoriesPresentationLogic {
    func presentFetchedRepositories(response: [RepositorieModel])
}

class ListRepositoriesPresenter: ListRepositoriesPresentationLogic {
    weak var viewController: ListRepositoriesDisplayLogic?

    // MARK: Public Methods (ListRepositoriesPresentationLogic)
    func presentFetchedRepositories(response: [RepositorieModel]) {

        viewController?.displayFetchedRepositories(repositories: response)
    }
}
