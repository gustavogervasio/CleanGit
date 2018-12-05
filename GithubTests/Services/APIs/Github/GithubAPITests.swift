@testable import Github
@testable import Moya
import XCTest

class GithubAPITests: XCTestCase {

    func testRepostioriesAPI() {
        let sut = GithubAPI.repositories
        XCTAssertEqual(sut.baseURL, R.url.mobile)
        XCTAssertEqual(sut.path, "/search/repositories")
        XCTAssertEqual(sut.method, Moya.Method.get)
        XCTAssertEqual(sut.validationType, .none)
        XCTAssertEqual(sut.headers, nil)
    }
}
