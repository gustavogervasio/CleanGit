@testable import Github
import Moya
import XCTest

class APICosumerTests: XCTestCase {

    func testAPIConsumerShouldResponseParse() {

        let stubbingProvider = MoyaProvider<GithubAPI>(stubClosure: MoyaProvider.immediatelyStub)
        let expectation = self.expectation(description: "testAPIConsumerShouldResponseParse")

        let success: ((ListRepositoriesModel) -> Void) = { (response) -> Void in
            XCTAssertGreaterThan(response.items.count, 0)
            expectation.fulfill()
        }
        let error: ((Error) -> Void) = { (error) -> Void in
            XCTAssertTrue(false, "This operation should response")
            expectation.fulfill()
        }
        let _ = APIConsumer(stubbingProvider).consume(target: .repositories, success: success, failure: error)
        self.waitForExpectations(timeout: 30, handler: nil)
    }

    func testAPIConsumerFailure() {

        let stubbingProvider = MoyaProvider<GithubAPI>(stubClosure: MoyaProvider.immediatelyStub)
        let expectation = self.expectation(description: "testAPIConsumerFailure")

        let success: ((RepositorieModel) -> Void) = { (response) -> Void in
            XCTAssertTrue(false, "This operation should fail")
            expectation.fulfill()
        }
        let error: ((Error) -> Void) = { (error) -> Void in
            XCTAssertNotNil(error)
            expectation.fulfill()
        }
        let _ = APIConsumer(stubbingProvider).consume(target: .repositories, success: success, failure: error)
        self.waitForExpectations(timeout: 30, handler: nil)
    }
}

