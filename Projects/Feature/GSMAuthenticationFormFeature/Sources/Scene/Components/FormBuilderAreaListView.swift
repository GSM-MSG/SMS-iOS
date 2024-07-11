import DesignSystem
import SwiftUI
import ViewUtil

struct FormBuilderAreaListView: View {
    private typealias Area = GSMAuthenticationFormUIModel.Area
    private typealias Section = Area.Section
    private typealias Group = Section.Group
    private typealias Field = Group.Field

    @Environment(\.fileFieldPresenter) var fileFieldPresenter
    @Environment(\.optionPickerPresenter) var optionPickerPresenter
    @State private var collapseList: [Bool] = []
    let areas: [GSMAuthenticationFormUIModel.Area]
    let onFieldInteraction: (FieldInteraction) -> Void

    init(areas: [GSMAuthenticationFormUIModel.Area], onFieldInteraction: @escaping (FieldInteraction) -> Void) {
        self.areas = areas
        self.onFieldInteraction = onFieldInteraction
    }

    var body: some View {
        areaList(areas: areas)
            .onAppear {
                collapseList = Array(repeating: false, count: areas.count)
            }
    }

    @ViewBuilder
    private func areaList(areas: [Area]) -> some View {
        LazyVStack(spacing: 16) {
            ForEach(areas.indices, id: \.self) { index in
                SMSSeparator()
                    .padding(.bottom, 4)

                FormBuilderAreaView(index: index, area: areas[index], onFieldInteraction: onFieldInteraction)
            }
        }

    }
}
