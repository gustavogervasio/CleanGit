import UIKit

protocol ShowRepositoriePresentationLogic {
    func presentSomething()
}

class ShowRepositoriePresenter: ShowRepositoriePresentationLogic {

    weak var viewController: ShowRepositorieDisplayLogic?

    // MARK: Do something

    func presentSomething() {
//        let viewModel = ShowRepositorie.Something.ViewModel()
//        viewController?.displaySomething(viewModel: viewModel)
    }
}
