@testable import Github
@testable import Moya
import XCTest

class GithubAPIConsumerTests: XCTestCase {

    func testGithubAPIConsumerShouldResponseRepositories() {

        let expectation = self.expectation(description: "testGithubAPIConsumerShouldResponseRepositories")

        let provider = MoyaProvider<GithubAPI>(stubClosure: MoyaProvider.immediatelyStub)
        let sut = GithubAPIConsumer(provider: provider)

        sut.fetch { (repositories) in
            XCTAssertTrue(repositories.count == 1)
            expectation.fulfill()
        }
        waitForExpectations(timeout: 1, handler: nil)
    }
}
