import XCTest
@testable import Validator

final class EmailValidatorTests: XCTestCase {
    var sut: EmailValidator!

    override func setUp() {
        sut = EmailValidator()
    }

    func test_validate_valid_email() {
        let validResult1 = sut.validate("test@gmail.com")
        XCTAssertTrue(validResult1)

        let validResult2 = sut.validate("test@gsm.hs.kr")
        XCTAssertTrue(validResult2)
    }

    func test_validate_invalid_email() {
        let invalidResult1 = sut.validate("testgmailcoom")
        XCTAssertFalse(invalidResult1)

        let invalidResult2 = sut.validate("test@gmailcoom")
        XCTAssertFalse(invalidResult2)
    }
}
