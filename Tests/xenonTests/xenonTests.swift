import XCTest
@testable import xenon

class xenonTests: XCTestCase {
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        XCTAssertEqual(xenon().text, "Hello, World!")
    }


    static var allTests : [(String, (xenonTests) -> () throws -> Void)] {
        return [
            ("testExample", testExample),
        ]
    }
}
