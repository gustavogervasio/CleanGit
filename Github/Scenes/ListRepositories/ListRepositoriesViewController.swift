import UIKit

protocol ListRepositoriesDisplayLogic: class {
    func displayFetchedRepositories(repositories: [RepositorieModel])
}

protocol ListRepositoriesViewControllerDelegate {
    func listRepositoriesViewController(controller: ListRepositoriesViewController, didTapRepositorie repositorie: RepositorieModel)
}

class ListRepositoriesViewController: TableViewController, ListRepositoriesDisplayLogic {

    var interactor: ListRepositoriesBusinessLogic?
    private var displayedRepositories: [RepositorieModel] = []
    private let delegate: ListRepositoriesViewControllerDelegate

    // MARK: Init
    init(title: String, delegate: ListRepositoriesViewControllerDelegate) {
        self.delegate = delegate
        super.init(title: title)
        setup()
        setupTableViewCells()
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
        let presenter = ListRepositoriesPresenter()
        let interactor = ListRepositoriesInteractor(presenter: presenter)
        viewController.interactor = interactor
        presenter.viewController = viewController
    }

    private func setupTableViewCells() {
        tableView.register(RepositorieCell.self, forCellReuseIdentifier: RepositorieCell.identifier)
    }

    private func fetchRepositories() {
        interactor?.fetchRepositories()
    }
    
    // MARK: Routing
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {}
    
    // MARK: Public Methods (ListRepositoriesDisplayLogic)
    func displayFetchedRepositories(repositories: [RepositorieModel]) {
        displayedRepositories = repositories
        tableView.reloadData()
    }

    // MARK: TableView
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return displayedRepositories.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let displayedRepositorie = displayedRepositories[indexPath.row]

        let cell = tableView.dequeueReusableCell(withIdentifier: RepositorieCell.identifier, for: indexPath) as! RepositorieCell
        cell.bindView(name: displayedRepositorie.name, description: displayedRepositorie.fullName)
        return cell
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        super.tableView(tableView, didSelectRowAt: indexPath)
        delegate.listRepositoriesViewController(controller: self, didTapRepositorie: displayedRepositories[indexPath.row])
    }
}
