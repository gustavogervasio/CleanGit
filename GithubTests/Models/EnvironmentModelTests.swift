@testable import Github
import XCTest

class EnvironmentModelTests: XCTestCase {
    
    let env = EnvironmentModel(mobileURL: URL(string: "https://www.test.com.br")!)
    
    func testMobileURL() {
        XCTAssertEqual(env.mobileURL, URL(string: "https://www.test.com.br"))
    }
}
