import Foundation
import FoundationUtil

final class GSMAuthenticationFormModel: ObservableObject, GSMAuthenticationFormStateProtocol {
    @Published var uiModel: GSMAuthenticationFormUIModel = .init(areas: [], files: [])
    @Published var fieldContents: [GSMAuthenticationFormFieldModel] = []
}

extension GSMAuthenticationFormModel: GSMAuthenticationFormActionProtocol {
    func updateGSMAuthenticationFormUIModel(uiModel: GSMAuthenticationFormUIModel) {
        self.uiModel = uiModel
    }

    func updateFieldContents(fields: [GSMAuthenticationFormFieldModel]) {
        self.fieldContents = fields
    }
}
