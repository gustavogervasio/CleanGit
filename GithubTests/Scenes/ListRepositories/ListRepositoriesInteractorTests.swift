@testable import Github
import XCTest

class ListRepositoriesInteractorTests: XCTestCase {

    // MARK: Test
    func testFetchRepositoriesShouldAskWorkerToFetchRepositories() {
        let sut = ListRepositoriesInteractor()
        let worker = ListRepositoriesWorkerSpy()
        sut.worker = worker
        
        //When
        sut.fetchRepositories()
        
        //Then
        XCTAssertTrue(worker.fetchRepositoriesCalled)
    }

    func testFetchRepositoriesShouldAskPresenterToFormatRepositories() {
        let sut = ListRepositoriesInteractor()
        
        let presenter = ListRepositoriesPresentationLogicSpy()
        sut.presenter = presenter
        
        let worker = ListRepositoriesWorkerSpy()
        sut.worker = worker
        
        //When
        sut.fetchRepositories()
        
        //Then
        XCTAssertTrue(presenter.presentFetchedRepositoriesCalled)
    }
    
    // MARK: Spy
    class ListRepositoriesWorkerSpy: ListRepositoriesWorkerProtocol {
        
        var fetchRepositoriesCalled = false
        var repositories: [RepositorieModel]  = []
        
        func fetch(completionHandler: @escaping ([RepositorieModel]) -> Void) {
          
            fetchRepositoriesCalled = true
            completionHandler (
                repositories
            )
        }
    }
    
    class ListRepositoriesPresentationLogicSpy: ListRepositoriesPresentationLogic {
        
        var presentFetchedRepositoriesCalled = false

        func presentFetchedRepositories(response: [RepositorieModel]) {
            presentFetchedRepositoriesCalled = true
        }
    }
}
