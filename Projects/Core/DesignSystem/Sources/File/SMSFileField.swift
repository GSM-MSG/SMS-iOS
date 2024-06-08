import SwiftUI
import ViewUtil
import UniformTypeIdentifiers

public struct SMSFileField: View {
    private let placeholder: String?
    private let fileText: String?
    @State private var isShow: Bool = false
    private let isError: Bool
    private let errorText: String
    private let allowedContentTypes: [UTType]
    private let action: (Result<URL, Error>) -> Void

    public init(
        _ placeholder: String? = nil,
        fileText: String?,
        isError: Bool = false,
        errorText: String = "",
        allowedContentTypes: [UTType] = [.content],
        action: @escaping (Result<URL, Error>) -> Void
    ) {
        self.placeholder = placeholder
        self.fileText = fileText
        self.isError = isError
        self.errorText = errorText
        self.allowedContentTypes = allowedContentTypes
        self.action = action
    }

    public var body: some View {
        SMSTextField(
            placeholder ?? "",
            text: Binding(
                get: { fileText ?? "" },
                set: { _ in }
            ),
            errorText: errorText,
            isError: isError,
            isOnClear: false
        )
        .disabled(true)
        .overlay(alignment: .trailing) {
            SMSIcon(.file)
                .padding(.trailing, 12)
        }
        .simultaneousGesture(
            TapGesture()
                .onEnded {
                    self.isShow = true
                }
        )
        .fileImporter(
            isPresented: Binding(
                get: { isShow },
                set: { active in
                    isShow = active
                }
            ),
            allowedContentTypes: allowedContentTypes
        ) { result in
            action(result)
        }
    }
}
