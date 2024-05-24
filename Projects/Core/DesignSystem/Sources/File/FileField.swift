import SwiftUI
import ViewUtil

public struct FileField: View {
    @State var fileText: String
    @State var isShow: Bool
    @State var isError: Bool
    let action: () -> Void

    public init(
        fileText: String,
        isShow: Bool,
        isError: Bool = false,
        action: @escaping () -> Void
    ) {
        self.fileText = fileText
        self.isShow = isShow
        self.isError = isError
        self.action = action
    }

    public var body: some View {
        SMSTextField(
            "",
            text: Binding(
                get: { fileText },
                set: { _ in }
            ),
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
                    action()
                }
        )
        .fileImporter(
            isPresented:
                Binding(
                    get: {isShow},
                    set: {active in isShow = active
                    }
                ),
            allowedContentTypes: [.content]
        ) { result in
            switch result {
            case .success(let url):
                fileText = url.lastPathComponent
            case .failure(let error):
                self.isError = true
            }
        }
    }
}
