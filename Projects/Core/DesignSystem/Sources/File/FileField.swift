import SwiftUI
import ViewUtil
import UniformTypeIdentifiers

public struct FileField: View {
    @State var fileText: String
    @State var isShow: Bool
    @State var isError: Bool
    let errorText: String
    let allowedContentTypes: [UTType]
    let action: (URL) -> Void

    public init(
        fileText: String,
        isShow: Bool,
        isError: Bool = false,
        errorText: String = "",
        allowedContentTypes: [UTType] = [.content],
        action: @escaping (URL) -> Void
    ) {
        self.fileText = fileText
        self.isShow = isShow
        self.isError = isError
        self.errorText = errorText
        self.allowedContentTypes = allowedContentTypes
        self.action = action
    }

    public var body: some View {
        SMSTextField(
            "",
            text: Binding(
                get: { fileText },
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
            switch result {
            case .success(let url):
                fileText = url.lastPathComponent
                action(url)

            case .failure:
                self.isError = true
            }
        }
    }
}
