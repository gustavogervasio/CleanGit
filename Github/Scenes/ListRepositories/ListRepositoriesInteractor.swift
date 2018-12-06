import UIKit

protocol ListRepositoriesBusinessLogic {
    func fetchRepositories()
}

protocol ListRepositoriesDataStore {
    var repositories: [RepositorieModel]? { get }
}

class ListRepositoriesInteractor: ListRepositoriesBusinessLogic, ListRepositoriesDataStore {

    private var presenter: ListRepositoriesPresentationLogic
    var worker: ListRepositoriesWorkerProtocol = ListRepositoriesWorker()
    var repositories: [RepositorieModel]?

    // MARK: Init
    init(presenter: ListRepositoriesPresentationLogic) {
        self.presenter = presenter
    }

    // MARK: Public Methods (ListRepositoriesBusinessLogic)
    func fetchRepositories() {
        worker.fetch(completionHandler: { [weak self] (repositories) in
            self?.repositories = repositories
            self?.presenter.presentFetchedRepositories(response: repositories)
        })
    }
}
