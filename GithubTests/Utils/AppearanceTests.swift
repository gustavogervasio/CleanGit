@testable import Github
import XCTest

class AppearanceTests: XCTestCase {

    func testWindowAppearance() {
        XCTAssertEqual(UIWindow.appearance().tintColor, R.color.c_45_45_45)
    }

    func testNavigationBarAppearance() {
        XCTAssertEqual(UINavigationBar.appearance().prefersLargeTitles, true)
        XCTAssertEqual(UINavigationBar.appearance().barTintColor, R.color.c_45_45_45)
        XCTAssertEqual(UINavigationBar.appearance().isTranslucent, false)
        XCTAssertEqual(UINavigationBar.appearance().tintColor, .white)
    }
}
