@testable import Github
import XCTest

class ListRepositoriesPresenterTests: XCTestCase {

    // MARK: Test
    func testPresentFetchedRepositoriesShouldAskViewControllerToDisplayRepositories() {

        let sut = ListRepositoriesPresenter()
        let listRepositoriesDisplayLogic = ListRepositoriesDisplayLogicSpy()
        sut.viewController = listRepositoriesDisplayLogic

        //When
        sut.presentFetchedRepositories(response: [])

        //Then
        XCTAssertTrue(listRepositoriesDisplayLogic.displayFetchedRepositoriesCalled )
    }

    // MARK: Spy
    class ListRepositoriesDisplayLogicSpy: ListRepositoriesDisplayLogic {

        var displayFetchedRepositoriesCalled = false

        func displayFetchedRepositories(repositories: [RepositorieModel]) {
            displayFetchedRepositoriesCalled = true
        }
    }
}
