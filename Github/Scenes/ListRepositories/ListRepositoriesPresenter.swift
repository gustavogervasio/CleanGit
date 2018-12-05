import UIKit

protocol ListRepositoriesPresentationLogic {
    func presentFetchedRepositories(response: [RepositorieModel])
}

class ListRepositoriesPresenter: ListRepositoriesPresentationLogic {
    weak var viewController: ListRepositoriesDisplayLogic?

    // MARK: Public Methods (ListRepositoriesPresentationLogic)
    func presentFetchedRepositories(response: [RepositorieModel]) {

        let displayedRepositories = convertRepositories(repositories: response)
        let viewModel = ListRepositories.ViewModel.init(displayedRepositories: displayedRepositories)
        viewController?.displayFetchedRepositories(viewModel: viewModel)
    }

    // MARK: Private Methods
    private func convertRepositories(repositories: [RepositorieModel]) -> [ListRepositories.ViewModel.DisplayedRepositorie] {

        return repositories.map {ListRepositories.ViewModel.DisplayedRepositorie(name: $0.name)}
    }
}
