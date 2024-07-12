import Combine
import SwiftUI

internal final class OptionPickerPresenter {
    private let isPresentedSubject = PassthroughSubject<Bool, Never>()
    private let optionsSubject = PassthroughSubject<[String], Never>()
    private let optionSelectSubject = PassthroughSubject<String, Never>()
    private var onOptionSelect: ((String) -> Void)?
    private var subscription = Set<AnyCancellable>()
    var isPresentedPublisher: AnyPublisher<Bool, Never> {
        isPresentedSubject.eraseToAnyPublisher()
    }
    var optionsPublisher: AnyPublisher<[String], Never> {
        optionsSubject.eraseToAnyPublisher()
    }
    var optionSelectPublisher: AnyPublisher<String, Never> {
        optionSelectSubject.eraseToAnyPublisher()
    }

    fileprivate static let shared = OptionPickerPresenter()

    private init() {
        optionSelectSubject.sink { [weak self] option in
            self?.onOptionSelect?(option)
        }
        .store(in: &subscription)
    }

    deinit {
        subscription.removeAll()
    }

    func presentOptionPicker(
        options: [String],
        onOptionSelect: @escaping (String) -> Void
    ) {
        self.onOptionSelect = onOptionSelect
        optionsSubject.send(options)
        isPresentedSubject.send(true)
    }

    func sendSelectedOption(option: String) {
        optionSelectSubject.send(option)
        isPresentedSubject.send(false)
    }

    func cancleSelectedOption() {
        isPresentedSubject.send(false)
    }
}

internal extension EnvironmentValues {
    var optionPickerPresenter: OptionPickerPresenter {
        OptionPickerPresenter.shared
    }
}
