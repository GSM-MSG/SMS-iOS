import DesignSystem
import Foundation
import SwiftUI
import BaseFeature
import ViewUtil

enum FieldChanges {
    case text(String)
    case number(Int)
    case boolean(String)
    case file(String)
    case select(String)
}

enum FieldInteraction {
    case fieldChanges(area: Int, sectionIndex: Int, groupIndex: Int, fieldIndex: Int, fieldChanges: FieldChanges)
    case groupAdd(area: Int, section: Int, group: Int)
    case groupRemove(area: Int, section: Int, group: Int)
}

struct GSMAuthenticationFormBuilderView: View {
    @Environment(\.fileFieldPresenter) var fileFieldPresenter
    @Environment(\.optionPickerPresenter) var optionPickerPresenter
    private let uiModel: GSMAuthenticationFormUIModel
    private let onFieldInteraction: (FieldInteraction) -> Void
    private typealias Area = GSMAuthenticationFormUIModel.Area
    private typealias Section = Area.Section
    private typealias Group = Section.Group
    private typealias Field = Group.Field
    let intent: GSMAuthenticationFormIntentProtocol

    init(
        intent: GSMAuthenticationFormIntentProtocol,
        uiModel: GSMAuthenticationFormUIModel,
        onFieldInteraction: @escaping (FieldInteraction) -> Void
    ) {
        self.intent = intent
        self.uiModel = uiModel
        self.onFieldInteraction = onFieldInteraction
    }

    var body: some View {
        ScrollView {
            GSMAuthenticationFileDownloadView(uiModel: uiModel.files)

            FormBuilderAreaListView(areas: uiModel.areas) { fieldInteraction in
                onFieldInteraction(fieldInteraction)
            }
        }
    }
}
