import UIKit

protocol Coordinator {
    func start()
}

class AppCoordinator: NSObject {

    let window: UIWindow?

    init(window: UIWindow?) {
        self.window = window
        super.init()
    }

    // MARK: Public Methods
    func start() {
        guard let window = self.window else { return }

        let listRepositoriesViewController = ListRepositoriesViewController(title: R.string.listRepositoriesTitle, delegate: self)
        let navigationController = UINavigationController(rootViewController: listRepositoriesViewController)
        window.rootViewController = navigationController
        window.makeKeyAndVisible()
    }

    internal func display(fromController controller: UIViewController) {

        let showRepositorieViewController = ShowRepositorieViewController(title: R.string.showRepositorieTitle)
        controller.navigationController?.pushViewController(showRepositorieViewController, animated: true)
    }
}


extension AppCoordinator: ListRepositoriesViewControllerDelegate {

    func listRepositoriesViewController(controller: ListRepositoriesViewController, didTapRepositorie repositorie: RepositorieModel) {

        display(fromController: controller)
    }
}
