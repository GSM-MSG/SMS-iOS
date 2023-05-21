import Validator
import XCTest

final class StringSizeValidatorTests: XCTestCase {
    func test_validate_valid_string() {
        let validator = StringSizeValidator(min: 1, max: 10)
        XCTAssertTrue(validator.validate("a"))
        XCTAssertTrue(validator.validate("abc"))
        XCTAssertTrue(validator.validate("abcde"))
        XCTAssertTrue(validator.validate("abcdefghij"))
    }

    func test_validate_invalid_string() {
        let validator = StringSizeValidator(min: 1, max: 10)
        XCTAssertFalse(validator.validate(""))
        XCTAssertFalse(validator.validate("abcdeABCDEa"))
    }
}
