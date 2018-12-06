import UIKit

protocol ShowRepositorieDisplayLogic: class {
    func displaySomething()
}

class ShowRepositorieViewController: TableViewController, ShowRepositorieDisplayLogic {

    var interactor: ShowRepositorieBusinessLogic?

    // MARK: Init
    override init(title: String) {
        super.init(title: title)
        setup()
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: Setup
    private func setup() {
        let viewController = self
        let interactor = ShowRepositorieInteractor()
        let presenter = ShowRepositoriePresenter()
        viewController.interactor = interactor
        interactor.presenter = presenter
        presenter.viewController = viewController
    }

    // MARK: View lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        doSomething()
    }

    // MARK: Do something

    //@IBOutlet weak var nameTextField: UITextField!

    func doSomething() {
        //let request = ShowRepositorie.Something.Request()
        //interactor?.doSomething(request: request)
    }

    func displaySomething() {
        //nameTextField.text = viewModel.name
    }
}
