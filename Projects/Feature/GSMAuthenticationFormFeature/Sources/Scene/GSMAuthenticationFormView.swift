import BaseFeature
import SwiftUI
import DesignSystem
import ViewUtil
import Combine

struct GSMAuthenticationFormView: View {
    @Environment(\.dismiss) var dismiss
    @Environment(\.safeAreaInsets) var safeAreaInsets
    @Environment(\.optionPickerPresenter) var optionPickerPresenter
    @StateObject var container: MVIContainer<GSMAuthenticationFormIntentProtocol, GSMAuthenticationFormStateProtocol>
    @State private var cancellables = Set<AnyCancellable>()
    var intent: any GSMAuthenticationFormIntentProtocol { container.intent }
    var state: any GSMAuthenticationFormStateProtocol { container.model }
    @State private var isPresented: Bool = false
    @State private var selectValues: [String] = []

    init(
        container: MVIContainer<GSMAuthenticationFormIntentProtocol, GSMAuthenticationFormStateProtocol>
    ) {
        self._container = StateObject(wrappedValue: container)
    }

    var body: some View {
        ZStack {
            GSMAuthenticationFormBuilderView(intent: intent, uiModel: state.uiModel) { field in
                switch field {
                case let .fieldChanges(area, section, group, field, fieldChanges):
                    switch fieldChanges {
                    case let .text(text):
                        intent.updateTextField(area: area, sectionIndex: section, groupIndex: group, fieldIndex: field, text: text)
                    case let .number(number):
                        intent.updateNumberField(area: area, sectionIndex: section, groupIndex: group, fieldIndex: field, number: number)
                    case let .boolean(select):
                        intent.updateBoolField(area: area, sectionIndex: section, groupIndex: group, fieldIndex: field, select: select)
                    case let .file(file):
                        intent.updateFileField(area: area, sectionIndex: section, groupIndex: group, fieldIndex: field, file: file)
                    case let .select(select):
                        intent.updateSelectField(area: area, sectionIndex: section, groupIndex: group, fieldIndex: field, select: select)
                    }
                case let .fieldAdd(area, section, field):
                    break
                }
            }
            .padding(.bottom, safeAreaInsets.bottom + 16)
            .onAppear {
                intent.onAppear()
            }
            .overlay(alignment: .bottom) {
                CTAButton(text: "저장") {
                    intent.saveButtonDidTap(state: state)
                }
                .frame(maxWidth: .infinity)
                .padding(.horizontal, 20)
            }
            .navigationTitle("인증제")
            .smsBackButton(
                dismiss: dismiss
            )
            .smsBottomSheet(
                isShowing: Binding(
                    get: { isPresented },
                    set: { _ in }
                )
            ) {
                valueListView()
            }
            .navigationBarTitleDisplayMode(.inline)
            .onAppear {
                subscribeToIsPresentedPublisher()
            }
        }
    }

    func subscribeToIsPresentedPublisher() {
        optionPickerPresenter.isPresentedPublisher
                .receive(on: DispatchQueue.main)
                .sink { newValue in
                    isPresented = newValue
                }
                .store(in: &cancellables)

        optionPickerPresenter.optionsPublisher
            .receive(on: DispatchQueue.main)
            .sink { newValue in
                selectValues = newValue
            }
            .store(in: &cancellables)
    }

    @ViewBuilder
    func valueListView() -> some View {
        ScrollView {
            LazyVStack(spacing: 8) {
                ForEach(selectValues, id: \.self) { value in
                    HStack {
                        Text(value)
                            .smsFont(.body1, color: .neutral(.n50))

                        Spacer()
                    }
                    .padding(.vertical, 13.5)
                    .padding(.horizontal, 20)
                    .buttonWrapper {
                        optionPickerPresenter.sendSelectedOption(option: value)
                    }
                }
            }
        }
    }
}
