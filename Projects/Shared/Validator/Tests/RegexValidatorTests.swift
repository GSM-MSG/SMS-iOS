import Validator
import XCTest

final class RegexValidatorTests: XCTestCase {
    func test_only_string_or_number_validate() {
        let validator = RegexValidator(pattern: "^[a-zA-Z0-9]+$")
        XCTAssertTrue(validator.validate("abc"))
        XCTAssertFalse(validator.validate("abc!"))
    }

    func test_only_special_characters_validate() {
        let validator = RegexValidator(pattern: "^[^a-zA-Z0-9]+$")
        XCTAssertTrue(validator.validate("!@#$%^&*()"))
        XCTAssertFalse(validator.validate("abc"))
    }

    func test_email_validate() {
        let validator = RegexValidator(pattern: "^[a-zA-Z0-9+-_.]+@[a-zA-Z0-9-]+\\.[a-zA-Z0-9-.]+$")
        XCTAssertTrue(validator.validate("test@gmail.com"))
        XCTAssertTrue(validator.validate("test@gsm.hs.kr"))
        XCTAssertFalse(validator.validate("testgmail.com"))
        XCTAssertFalse(validator.validate("test@gmailcom"))
    }
}
