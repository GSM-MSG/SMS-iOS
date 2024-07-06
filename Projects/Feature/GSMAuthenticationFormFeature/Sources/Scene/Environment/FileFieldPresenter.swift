import Combine
import SwiftUI

internal final class FileFieldPresenter {
    private let isPresentedSubject = PassthroughSubject<Bool, Never>()
    private let fileSelectSubject = PassthroughSubject<URL, Never>()
    private var onFileSelect: ((URL) -> Void)?
    private var subscription = Set<AnyCancellable>()
    private var isPresentedPublisher: AnyPublisher<Bool, Never> {
        isPresentedSubject.eraseToAnyPublisher()
    }
    private var fileSelectPublisher: AnyPublisher<URL, Never> {
        fileSelectSubject.eraseToAnyPublisher()
    }

    fileprivate static let shared = FileFieldPresenter()

    private init() {
        fileSelectSubject.sink { [weak self] url in
            self?.onFileSelect?(url)
        }
        .store(in: &subscription)
    }

    deinit {
        subscription.removeAll()
    }

    func presentFileImporter(onFileSelect: @escaping (URL) -> Void) {
        self.onFileSelect = onFileSelect
        isPresentedSubject.send(true)
    }

    func sendSelectedFile(url: URL) {
        fileSelectSubject.send(url)
        isPresentedSubject.send(false)
    }
}

internal extension EnvironmentValues {
    var fileFieldPresenter: FileFieldPresenter {
        FileFieldPresenter.shared
    }
}
