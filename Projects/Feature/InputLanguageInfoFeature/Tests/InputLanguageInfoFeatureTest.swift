import BaseFeature
import XCTest
import InputLanguageInfoFeatureInterface
@testable import InputLanguageInfoFeature

final class MockInputLanguageDelegate: InputLanguageDelegate {
    var languagePrevButtonDidTapCallCount = 0
    func languagePrevButtonDidTap() {
        languagePrevButtonDidTapCallCount += 1
    }

    var completeToInputLanguageCallCount = 0
    func completeToInputLanguage(languages: [(name: String, score: String)]) {
        completeToInputLanguageCallCount += 1
    }
}

final class InputLanguageInfoFeatureTests: XCTestCase {
    var sut: MVIContainer<InputLanguageInfoIntentProtocol, InputLanguageInfoStateProtocol>!
    var languageDelegate: MockInputLanguageDelegate!

    override func setUp() {
        let model = InputLanguageInfoModel()
        languageDelegate = MockInputLanguageDelegate()
        let intent = InputLanguageInfoIntent(
            model: model,
            languageDelegate: languageDelegate
        )
        sut = MVIContainer(
            intent: intent as InputLanguageInfoIntentProtocol,
            model: model as InputLanguageInfoStateProtocol,
            modelChangePublisher: model.objectWillChange
        )
    }

    func test_update_language_name() {
        sut.intent.updateLanguageName(name: "ASDF", at: 0)
        XCTAssertEqual(sut.model.languageList[0].languageName, "ASDF")

        sut.intent.updateLanguageName(name: "VCXZ", at: 0)
        XCTAssertEqual(sut.model.languageList[0].languageName, "VCXZ")
    }

    func test_update_language_score() {
        sut.intent.updateLanguageScore(score: "929", at: 0)
        XCTAssertEqual(sut.model.languageList[0].languageScore, "929")

        sut.intent.updateLanguageScore(score: "zxcv", at: 0)
        XCTAssertEqual(sut.model.languageList[0].languageScore, "zxcv")
    }

    func test_append_language() {
        sut.intent.languageAppendButtonDidTap()
        XCTAssertEqual(sut.model.languageList.count, 2)

        sut.intent.languageAppendButtonDidTap()
        XCTAssertEqual(sut.model.languageList.count, 3)
    }

    func test_delete_language() {
        sut.intent.deleteLanguage(at: 0)
        XCTAssertEqual(sut.model.languageList.count, 0)
    }

    func test_prev_button_did_tap() {
        sut.intent.prevButtonDidTap()
        XCTAssertEqual(languageDelegate.languagePrevButtonDidTapCallCount, 1)

        sut.intent.prevButtonDidTap()
        XCTAssertEqual(languageDelegate.languagePrevButtonDidTapCallCount, 2)
    }

    func test_complete_button_did_Tap() {
        sut.intent.completeButtonDidTap(languages: [])
        XCTAssertEqual(languageDelegate.completeToInputLanguageCallCount, 1)

        sut.intent.completeButtonDidTap(languages: [])
        XCTAssertEqual(languageDelegate.completeToInputLanguageCallCount, 2)
    }
}
