@testable import Github
import XCTest

class ServiceConfigurationTests: XCTestCase {

    let configuration = ServiceConfiguration.sharedInstance

    func testMobileURL() {
        XCTAssertEqual(configuration.environment.mobileURL, R.url.mobile)
    }
}
