import UIKit

protocol ListRepositoriesDisplayLogic: class {
    func displayFetchedRepositories(viewModel: ListRepositories.ViewModel)
}

class ListRepositoriesViewController: TableViewController, ListRepositoriesDisplayLogic {

    private var interactor: ListRepositoriesBusinessLogic?
    private var router: (NSObjectProtocol & ListRepositoriesRoutingLogic & ListRepositoriesDataPassing)?
    
    // MARK: Init
    override init(title: String) {
        super.init(title: title)
        setup()
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: View lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        fetchRepositories()
    }

    // MARK: Private Methods
        private func setup() {
        let viewController = self
        let interactor = ListRepositoriesInteractor()
        let presenter = ListRepositoriesPresenter()
        let router = ListRepositoriesRouter()
        viewController.interactor = interactor
        viewController.router = router
        interactor.presenter = presenter
        presenter.viewController = viewController
        router.viewController = viewController
        router.dataStore = interactor
    }

    private func fetchRepositories() {
        interactor?.fetchRepositories()
    }
    
    // MARK: Routing
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {}
    
    // MARK: Public Methods (ListRepositoriesDisplayLogic)
    func displayFetchedRepositories(viewModel: ListRepositories.ViewModel) {

        print(viewModel)
    }
}
