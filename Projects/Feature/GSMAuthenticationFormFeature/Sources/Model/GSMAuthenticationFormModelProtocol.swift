import AuthenticationDomainInterface
import Foundation

protocol GSMAuthenticationFormStateProtocol {
    var uiModel: GSMAuthenticationFormUIModel { get }
    var authenticationEntity: AuthenticationFormEntity? { get }
    var authenticationStateEntity: AuthenticationStateEntity? { get }
    var stateModel: GSMAuthenticationStateModel { get }
    var isLoading: Bool { get }
    var isSubmitting: Bool { get }
    var isPresentedSubmitDialog: Bool { get }
}

protocol GSMAuthenticationFormActionProtocol: AnyObject {
    func updateGSMAuthenticationFormUIModel(uiModel: GSMAuthenticationFormUIModel)
    func updateAuthenticationEntity(authenticationEntity: AuthenticationFormEntity)

    func updateAuthenticationStateEntity(
        authenticationStateEntity: AuthenticationStateEntity
    )

    func updateAuthenticationStateModel(stateModel: GSMAuthenticationStateModel)

    func appendField(
        area: Int,
        sectionIndex: Int,
        groupIndex: Int
    )

    func updateTextField(
        area: Int,
        sectionIndex: Int,
        groupIndex: Int,
        fieldIndex: Int,
        text: String
    )
    func updateNumberField(
        area: Int,
        sectionIndex: Int,
        groupIndex: Int,
        fieldIndex: Int,
        number: Int
    )
    func updateBoolField(
        area: Int,
        sectionIndex: Int,
        groupIndex: Int,
        fieldIndex: Int,
        select: String
    )
    func updateFileField(
        area: Int,
        sectionIndex: Int,
        groupIndex: Int,
        fieldIndex: Int,
        file: String
    )
    func updateSelectField(
        area: Int,
        sectionIndex: Int,
        groupIndex: Int,
        fieldIndex: Int,
        select: String
    )

    func deleteField(
        area: Int,
        sectionIndex: Int,
        groupIndex: Int
    )

    func updateIsLoading(isLoading: Bool)

    func updateIsSubmitting(isSubmitting: Bool)

    func updateIsPresentedSubmitDialog(isPresentedSubmitDialog: Bool)
}
