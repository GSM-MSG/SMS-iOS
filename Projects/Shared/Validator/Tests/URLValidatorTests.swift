import Validator
import XCTest

final class URLValidatorTests: XCTestCase {
    var sut: URLValidator!

    override func setUp() {
        super.setUp()
        sut = URLValidator()
    }

    func test_validate_valid_url() {
        XCTAssertTrue(sut.validate("https://www.google.com"))
        XCTAssertTrue(sut.validate("http://www.google.com"))
        XCTAssertTrue(sut.validate("http://google.com"))
        XCTAssertTrue(sut.validate("https://google.com"))
        XCTAssertTrue(sut.validate("https://www.naver.com"))
        XCTAssertTrue(sut.validate("https://github.com"))
        XCTAssertTrue(sut.validate("http://github.com"))
        XCTAssertTrue(sut.validate("https://www.apple.com"))
    }

    func test_validate_invalid_url() {
        XCTAssertFalse(sut.validate("www.google"))
        XCTAssertFalse(sut.validate("www.naver.com"))
        XCTAssertFalse(sut.validate("github.com"))
    }
}
