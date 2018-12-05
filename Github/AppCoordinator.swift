import UIKit

protocol Coordinator {
    func start()
}

class AppCoordinator: NSObject {

    let window: UIWindow?
    let rootViewController: NavigationViewController

    init(window: UIWindow?) {
        self.window = window
        self.rootViewController = NavigationViewController()
        super.init()
    }

    // MARK: Public Methods
    func start() {
        guard let window = self.window else { return }

        let listRepositoriesViewController = ListRepositoriesViewController(title: "Test")
        rootViewController.pushViewController(listRepositoriesViewController, animated: true)
        window.rootViewController = rootViewController
        window.makeKeyAndVisible()
    }
}
