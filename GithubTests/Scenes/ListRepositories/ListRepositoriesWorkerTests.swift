@testable import Github
import XCTest
import Moya

class ListRepositoriesWorkerTests: XCTestCase {

    func testFetchShouldAskGithubAPIConsumerToFetchRepositories() {

        let consumer = GithubAPIConsumerSpy(provider: MoyaProvider<GithubAPI>())
        let sut = ListRepositoriesWorker()
        sut.consumer = consumer

        // When
        sut.fetch(completionHandler: { (repositories) in })

        // Then
        XCTAssertTrue(consumer.fetchWithCompletionHandlerCalled)
    }

    // MARK: Spy
    class GithubAPIConsumerSpy: GithubAPIConsumerProtocol {

        var fetchWithCompletionHandlerCalled = false
        var provider: MoyaProvider<GithubAPI>

        required init(provider: MoyaProvider<GithubAPI>) {
            self.provider = provider
        }

        func fetch(completionHandler: @escaping ([RepositorieModel]) -> Void) {

            fetchWithCompletionHandlerCalled = true
            DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(1)) {
                completionHandler([])
            }
        }
    }
}
