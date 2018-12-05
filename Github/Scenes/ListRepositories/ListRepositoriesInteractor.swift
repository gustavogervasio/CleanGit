import UIKit

protocol ListRepositoriesBusinessLogic {
    func fetchRepositories()
}

protocol ListRepositoriesDataStore {
    var repositories: [RepositorieModel]? { get }
}

class ListRepositoriesInteractor: ListRepositoriesBusinessLogic, ListRepositoriesDataStore {

    var presenter: ListRepositoriesPresentationLogic?
    var worker: ListRepositoriesWorkerProtocol = ListRepositoriesWorker()
    var repositories: [RepositorieModel]?

    // MARK: Public Methods (ListRepositoriesBusinessLogic)
    func fetchRepositories() {
        worker.fetch(completionHandler: { [weak self] (repositories) in
            self?.repositories = repositories
            self?.presenter?.presentFetchedRepositories(response: repositories)
        })
    }
}
