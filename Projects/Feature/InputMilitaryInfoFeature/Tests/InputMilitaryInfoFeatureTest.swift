import BaseFeature
import XCTest
import InputMilitaryInfoFeatureInterface
@testable import InputMilitaryInfoFeature

final class MockMilitaryDelegate: InputMilitaryDelegate {
    var militaryPrevButtonDidTapCallCount = 0
    func militaryPrevButtonDidTap() {
        militaryPrevButtonDidTapCallCount += 1
    }

    var completeToInputMilitaryCallCount = 0
    func completeToInputMilitary() {
        completeToInputMilitaryCallCount += 1
    }
}

final class InputMilitaryInfoFeatureTests: XCTestCase {
    var sut: MVIContainer<InputMilitaryInfoIntentProtocol, InputMilitaryInfoStateProtocol>!
    var mockDelegate = MockMilitaryDelegate()

    override func setUp() {
        let model = InputMilitaryInfoModel()
        let intent = InputMilitaryInfoIntent(model: model, militaryDelegate: mockDelegate)
        sut = MVIContainer(
            intent: intent as InputMilitaryInfoIntentProtocol,
            model: model as InputMilitaryInfoStateProtocol,
            modelChangePublisher: model.objectWillChange
        )
    }

    func test_military_info_list_sheet() {
        sut.intent.militarySheetIsRequired()
        XCTAssertTrue(sut.model.isPresentedMilitarySheet)

        sut.intent.militarySheetDismissed()
        XCTAssertFalse(sut.model.isPresentedMilitarySheet)
    }

    func test_delegate_call() {
        sut.intent.prevButtonDidTap()
        XCTAssertEqual(mockDelegate.militaryPrevButtonDidTapCallCount, 1)

        sut.intent.prevButtonDidTap()
        XCTAssertEqual(mockDelegate.militaryPrevButtonDidTapCallCount, 2)

        sut.intent.nextButtonDidTap()
        XCTAssertEqual(mockDelegate.completeToInputMilitaryCallCount, 1)

        sut.intent.nextButtonDidTap()
        XCTAssertEqual(mockDelegate.completeToInputMilitaryCallCount, 2)
    }
}
