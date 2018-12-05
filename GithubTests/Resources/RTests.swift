@testable import Github
import XCTest

class RTests: XCTestCase {
    
    // MARK: string
    func testStrings() {}

    
    // MARK: color
    func testColors() {
        XCTAssertEqual(R.color.c_45_45_45, UIColor(r: 45, g: 45, b: 45))
        XCTAssertEqual(R.color.c_70_70_70, UIColor(r: 70, g: 70, b: 70))
        XCTAssertEqual(R.color.c_223_230_233, UIColor(r: 223, g: 230, b: 233))
    }
    
    // MARK: font
    func testFonts() {
        XCTAssertEqual(R.font.n12, UIFont.systemFont(ofSize: 12))
        XCTAssertEqual(R.font.b12, UIFont.boldSystemFont(ofSize: 12))
        XCTAssertEqual(R.font.b14, UIFont.boldSystemFont(ofSize: 14))
    }
    
    // MARK: image
    
    // MARK: url
    func testURLs() {
        XCTAssertEqual(R.url.mobile, URL(string: "https://api.github.com"))
    }
}
