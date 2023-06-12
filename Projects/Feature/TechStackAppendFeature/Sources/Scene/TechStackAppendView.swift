import BaseFeature
import DesignSystem
import ViewUtil
import SwiftUI

struct TechStackAppendView: View {
    @Environment(\.dismiss) var dismiss
    @StateObject var container: MVIContainer<TechStackAppendIntentProtocol, TechStackAppendStateProtocol>
    @FocusState var isFocusedSearchTextField: Bool
    var intent: any TechStackAppendIntentProtocol { container.intent }
    var state: any TechStackAppendStateProtocol { container.model }

    var body: some View {
        ZStack(alignment: .bottom) {
            VStack(spacing: 8) {
                HStack(spacing: 16) {
                    SMSIcon(.leftArrow)
                        .buttonWrapper {
                            dismiss()
                        }

                    SMSIconTextField(
                        "찾고 싶은 세부 스택 입력\t\t\t\t\t\t\t",
                        text: Binding(
                            get: { state.searchText },
                            set: intent.updateSearchText(text:)
                        )
                    ) {
                        SMSIcon(.magnifyingglass)
                    }
                    .focused($isFocusedSearchTextField)
                }
                .padding(.horizontal, 20)

                ScrollView {
                    SMSSeparator()
                        .padding(.top, 12)

                    if isFocusedSearchTextField {
                        techStackListView()
                    } else {
                        recentAppendedTechStackListView()
                    }
                }
            }

            FillButton(text: "세부 스택 \(state.selectedTechStacks.count)개 추가") {
                dismiss()
                intent.appendButtonDidTap(techStacks: Array(state.selectedTechStacks))
            }
            .disabled(state.selectedTechStacks.isEmpty)
        }
        .hideKeyboardWhenTap()
    }

    @ViewBuilder
    func techStackListView() -> some View {
        if state.techStacks.isEmpty {
            VStack(spacing: 8) {
                SMSText("검색결과가 없습니다.", font: .body1)
                    .foregroundColor(.sms(.neutral(.n30)))
                    .padding(.top, 16)

                SMSChip("\"\(state.searchText)\" 직접 추가하기") {
                    intent.directAppendButtonDidTap(techStack: state.searchText)
                }
                .conditional(state.techStacks.last != state.searchText && !state.searchText.isEmpty)
            }
        } else {
            LazyVStack(spacing: 8) {
                ForEach(state.techStacks, id: \.self) { techStack in
                    techStackRowView(stack: techStack)
                }

                SMSChip("\"\(state.searchText)\" 직접 추가하기") {
                    intent.directAppendButtonDidTap(techStack: state.searchText)
                }
                .conditional(state.techStacks.last != state.searchText)
            }
        }
    }

    @ViewBuilder
    func recentAppendedTechStackListView() -> some View {
        VStack {
            HStack {
                SMSText("최근추가", font: .title2)

                Spacer()

                SMSText("전체삭제", font: .body1)
                    .foregroundColor(.sms(.neutral(.n30)))
                    .buttonWrapper {
                        intent.resetRecentTechStackButtonDidTap()
                    }
            }
            .padding(.top, 24)
            .padding(.horizontal, 20)

            Divider()
                .padding(.horizontal, 20)
                .foregroundColor(.sms(.neutral(.n10)))

            LazyVStack(spacing: 8) {
                ForEach(state.recentTechStacks, id: \.self) { techStack in
                    techStackRowView(stack: techStack)
                }
            }
        }
    }

    @ViewBuilder
    func techStackRowView(stack: String) -> some View {
        HStack {
            HighlightedText(
                stack,
                highlightText: state.searchText,
                defaultModifier: { textView in
                    textView
                        .font(.sms(.body1))
                        .foregroundColor(.sms(.neutral(.n50)))
                },
                highlightModifier: { textView in
                    textView
                        .font(.sms(.body1))
                        .foregroundColor(.sms(.primary(.p2)))
                }
            )
            .padding(.leading, 20)
            .padding(.vertical, 11.5)

            Spacer()

            SMSCheckbox(
                isSelected: Binding(
                    get: { state.selectedTechStacks.contains(stack) },
                    set: { $0 ? intent.selectTechStack(stack: stack) : intent.deselectTechStack(stack: stack) }
                )
            )
            .padding(.trailing, 20)
        }
    }
}
