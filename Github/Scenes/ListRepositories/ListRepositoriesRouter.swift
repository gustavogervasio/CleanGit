import UIKit

@objc protocol ListRepositoriesRoutingLogic {
    //func routeToSomewhere(segue: UIStoryboardSegue?)
}

protocol ListRepositoriesDataPassing {
    var dataStore: ListRepositoriesDataStore? { get }
}

class ListRepositoriesRouter: NSObject, ListRepositoriesRoutingLogic, ListRepositoriesDataPassing {
    weak var viewController: ListRepositoriesViewController?
    var dataStore: ListRepositoriesDataStore?
    
    // MARK: Routing
    
    //func routeToSomewhere(segue: UIStoryboardSegue?)
    //{
    //  if let segue = segue {
    //    let destinationVC = segue.destination as! SomewhereViewController
    //    var destinationDS = destinationVC.router!.dataStore!
    //    passDataToSomewhere(source: dataStore!, destination: &destinationDS)
    //  } else {
    //    let storyboard = UIStoryboard(name: "Main", bundle: nil)
    //    let destinationVC = storyboard.instantiateViewController(withIdentifier: "SomewhereViewController") as! SomewhereViewController
    //    var destinationDS = destinationVC.router!.dataStore!
    //    passDataToSomewhere(source: dataStore!, destination: &destinationDS)
    //    navigateToSomewhere(source: viewController!, destination: destinationVC)
    //  }
    //}
    
    // MARK: Navigation
    
    //func navigateToSomewhere(source: ListRepositoriesViewController, destination: SomewhereViewController)
    //{
    //  source.show(destination, sender: nil)
    //}
    
    // MARK: Passing data
    
    //func passDataToSomewhere(source: ListRepositoriesDataStore, destination: inout SomewhereDataStore)
    //{
    //  destination.name = source.name
    //}
}
