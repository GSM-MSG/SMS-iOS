import SwiftUI
import DesignSystem

struct EffectiveDateRadioGroupView<T, ID, Content>: View where ID: Hashable, Content: View {
    let columns = [GridItem(.flexible()), GridItem(.flexible())]
    let data: [T]
    let id: KeyPath<T, ID>
    let isSelected: (T) -> Bool
    let selectAction: (T) -> Void
    let content: (T) -> Content

    init(
        data: [T],
        id: KeyPath<T, ID>,
        isSelected: @escaping (T) -> Bool,
        selectAction: @escaping (T) -> Void,
        @ViewBuilder content: @escaping (T) -> Content
    ) {
        self.data = data
        self.id = id
        self.isSelected = isSelected
        self.selectAction = selectAction
        self.content = content
    }

    var body: some View {
        VStack(alignment: .leading) {
            LazyVGrid(columns: columns) {
                ForEach(data, id: id) { index in
                    HStack(spacing: 8) {
                        SMSRadioButton(
                            isSelected: Binding(
                                get: { isSelected(index) },
                                set: { _ in selectAction(index) }
                            )
                        )

                        content(index)

                        Spacer()
                    }
                }
            }
        }
    }
}
