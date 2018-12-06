import UIKit

protocol ShowRepositorieBusinessLogic {
    func doSomething()
}

protocol ShowRepositorieDataStore {}

class ShowRepositorieInteractor: ShowRepositorieBusinessLogic, ShowRepositorieDataStore {

    var presenter: ShowRepositoriePresentationLogic?
    var worker: ShowRepositorieWorker?

    // MARK: Do something

    func doSomething() {
        worker = ShowRepositorieWorker()
        worker?.doSomeWork()

        //let response = ShowRepositorie.Something.Response()
        //presenter?.presentSomething(response: response)
    }
}
