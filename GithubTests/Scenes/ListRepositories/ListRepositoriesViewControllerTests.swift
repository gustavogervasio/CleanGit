@testable import Github
import XCTest
import UIKit

class ListRepositoriesViewControllerTests: XCTestCase {

    private var window: UIWindow!
    private var sut: ListRepositoriesViewController!
    private var delegate: ListRepositoriesViewControllerDelegateSpy!

    override func setUp() {
        window = UIWindow()
        setupListRepositoriesViewController()
        super.setUp()
    }
    override func tearDown() {
        window = nil
        super.tearDown()
    }

    // MARK: Private Methods
    private func setupListRepositoriesViewController() {
        delegate = ListRepositoriesViewControllerDelegateSpy()
        sut = ListRepositoriesViewController(title: "Title", delegate: delegate)
    }
    private func loadView() {
        window.addSubview(sut.view)
        RunLoop.current.run(until: Date())
    }

    // # MARK: Tests
    func testShouldHaveATitle() {
        XCTAssertEqual(sut.title, "Title")
    }

    func testTableViewShouldBeGrouped() {
        XCTAssertEqual(sut.tableView.style, .grouped)
    }

    func testViewShouldHaveACustomColor() {
        XCTAssertEqual(sut.view.backgroundColor, R.color.c_45_45_45)
    }

    func testTableViewConfromsToTableViewDelegateProtocol() {
        XCTAssertTrue(sut.conforms(to: UITableViewDelegate.self))
        XCTAssertTrue(sut.responds(to: #selector(sut.tableView(_:didSelectRowAt:))))
    }
    func testTableViewHasDataSource() {
        XCTAssertNotNil(sut.tableView.dataSource)
    }

    func testShouldFetchRepositoriesWhenViewDidAppear() {
        let repositoriesBusinessLogicSpy = ListRepositoriesBusinessLogicSpy()
        sut.interactor = repositoriesBusinessLogicSpy

        //When
        loadView()

        //Then
        XCTAssertTrue(repositoriesBusinessLogicSpy.fetchRepositoriesCalled)
    }

    func testDisplayFetchedRepositoriesShouldReloadTableView() {
        let tableViewSpy = TableViewSpy()
        sut.tableView = tableViewSpy
        loadView()

        let repositories: [RepositorieModel] =  []

        //When
        sut.displayFetchedRepositories(repositories: repositories)

        //Then
        XCTAssertTrue(tableViewSpy.reloadDataCalled)
    }

    func testTableViewTappedShouldCallDelegate() {
        let repositoriesBusinessLogicSpy = ListRepositoriesBusinessLogicSpy()
        sut.interactor = repositoriesBusinessLogicSpy

        sut.displayFetchedRepositories(repositories: [RepositorieModel(id: 1, name: "Test")])
        loadView()

        //When
        sut.tableView(sut.tableView, didSelectRowAt: IndexPath(row: 0, section: 0))

        //Then
        XCTAssertTrue(delegate.delegateCalled)
    }

    // # MARK: Spy
    class TableViewSpy: UITableView {
        var reloadDataCalled = false

        override func reloadData() {
            reloadDataCalled = true
        }
    }

    class ListRepositoriesBusinessLogicSpy: ListRepositoriesBusinessLogic {

        var fetchRepositoriesCalled = false

        func fetchRepositories() {
            fetchRepositoriesCalled = true
        }
    }

    class ListRepositoriesViewControllerDelegateSpy: ListRepositoriesViewControllerDelegate {

        var delegateCalled = false

        func listRepositoriesViewController(controller: ListRepositoriesViewController, didTapRepositorie repositorie: RepositorieModel) {

            delegateCalled = true
        }
    }
}
