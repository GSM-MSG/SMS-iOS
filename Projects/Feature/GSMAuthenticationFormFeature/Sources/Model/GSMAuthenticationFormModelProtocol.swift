protocol GSMAuthenticationFormStateProtocol {
    var uiModel: GSMAuthenticationFormUIModel { get }
    var fieldContents: [GSMAuthenticationFormFieldModel] { get }
}

protocol GSMAuthenticationFormActionProtocol: AnyObject {
    func updateGSMAuthenticationFormUIModel(uiModel: GSMAuthenticationFormUIModel)
    func updateFieldContents(fields: [GSMAuthenticationFormFieldModel])
}
