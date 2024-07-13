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
        ScrollView {
            GSMAuthenticationFileDownloadView(files: state.files)

            FormBuilderAreaListView(areas: state.areas) { fieldInteraction in
                switch fieldInteraction {
                case let .fieldChanges(area, section, group, field, fieldChanges):
                    switch fieldChanges {
                    case let .text(text):
                        intent.updateTextField(
                            area: area,
                            sectionIndex: section,
                            groupIndex: group,
                            fieldIndex: field,
                            text: text
                        )
                    case let .number(number):
                        intent.updateNumberField(
                            area: area,
                            sectionIndex: section,
                            groupIndex: group,
                            fieldIndex: field,
                            number: number
                        )
                    case let .boolean(select):
                        intent.updateBoolField(
                            area: area,
                            sectionIndex: section,
                            groupIndex: group,
                            fieldIndex: field,
                            select: select
                        )
                    case let .file(file, fileName):
                        intent.updateFileField(
                            area: area,
                            sectionIndex: section,
                            groupIndex: group,
                            fieldIndex: field,
                            file: file,
                            fileName: fileName
                        )
                    case let .select(select):
                        intent.updateSelectField(
                            area: area,
                            sectionIndex: section,
                            groupIndex: group,
                            fieldIndex: field,
                            select: select
                        )
                    }
                case let .groupAdd(area, section, group):
                    intent.appendField(area: area, sectionIndex: section, groupIndex: group)
                case let .groupRemove(area, section, group):
                    intent.deleteField(area: area, sectionIndex: section, groupIndex: group)
                }
            }

            Spacer()
                .frame(height: 120)
        }
        .overlay(alignment: .bottom) {
            CTAButton(text: "저장") {
                intent.saveButtonDidTap()
            }
            .padding(.horizontal, 20)
            .padding(.bottom, safeAreaInsets.bottom + 16)
            .background {
                Color.sms(.system(.white))
            }
            .ignoresSafeArea()
        }
        .onAppear {
            intent.formOnAppear()
        }
        .onAppear {
            intent.viewOnAppear()
        }
        .hideKeyboardWhenTap()
        .navigationTitle("인증제")
        .smsBackButton(
            dismiss: dismiss
        )
        .smsBottomSheet(
            isShowing: Binding(
                get: { isPresented },
                set: { _ in optionPickerPresenter.cancleSelectedOption() }
            )
        ) {
            valueListView()
        }
        .navigationBarTitleDisplayMode(.inline)
        .edgesIgnoringSafeArea([.bottom])
        .ignoresSafeArea(.keyboard)
        .onAppear {
            subscribeToIsPresentedPublisher()
        }
        .smsLoading(isLoading: state.isLoading)
        .smsDialog(title: "정말로 인증제를 제출하시겠습니까?", isShowing: Binding(get: { state.isPresentedSubmitDialog }, set: { _ in
            intent.dialogDismissed()
        }), dialogActions: [
            .init(text: "취소", style: .outline, action: {
                intent.dialogDismissed()
            }),
            .init(text: "확인", style: .default, action: {
                intent.submitButtonDidTap(state: state)
                dismiss()
            })
        ])
        .animation(.easeIn, value: state.isPresentedSubmitDialog)
        .smsToast(
            text: "인증제 제출이 완료되었습니다",
            isShowing: Binding(
                get: { state.isSubmitting },
                set: { _ in intent.toastDismissed() })
        ) {
            SMSIcon(.greenCheck)
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

    @ViewBuilder
    func pendingView() -> some View {
        HStack {
            Spacer()
            SMSText("\(state.stateModel.name)님의 인증제는 현재 채점 중입니다", font: .title2)
                .foregroundStyle(Color.sms(.neutral(.n40)))
            Spacer()
        }
        .padding(.vertical, 32)
        .background(Color.sms(.system(.white)))
        .cornerRadius(16)
        .shadow(color: .sms(.system(.black)).opacity(0.08), radius: 16, y: 2)
        .padding(.horizontal, 20)
    }

    @ViewBuilder
    func underReview() -> some View {
        HStack {
            Spacer()
            SMSText("\(state.stateModel.name)님의 인증제는 현재 채점 전입니다", font: .title2)
                .foregroundStyle(Color.sms(.neutral(.n40)))
            Spacer()
        }
        .padding(.vertical, 32)
        .background(Color.sms(.system(.white)))
        .cornerRadius(16)
        .shadow(color: .sms(.system(.black)).opacity(0.08), radius: 16, y: 2)
        .padding(.horizontal, 20)
    }

    @ViewBuilder func completed() -> some View {
        HStack {
            Spacer()
            VStack(spacing: 8) {
                SMSText("\(state.stateModel.name)님의 인증제 점수는", font: .title2)
                    .foregroundStyle(Color.sms(.system(.black)))
                    .multilineTextAlignment(.center)

                SMSText("\(Int(state.stateModel.score.rounded()))점 입니다.", font: .headline3)
                    .foregroundStyle(Color.sms(.primary(.p2)))
                    .multilineTextAlignment(.center)

                SMSText("채점자 : \(state.stateModel.grader ?? "선생님")", font: .body2)
                    .foregroundStyle(Color.sms(.neutral(.n40)))
                    .multilineTextAlignment(.center)
            }
            Spacer()
        }
        .padding(.vertical, 32)
        .background(Color.sms(.system(.white)))
        .cornerRadius(16)
        .shadow(color: .sms(.system(.black)).opacity(0.08), radius: 16, y: 2)
        .padding(.horizontal, 20)
    }

    @ViewBuilder
    func authenticationView() -> some View {
        VStack {
            Spacer()
                .frame(height: 1)
            ScrollView {
                GSMAuthenticationFileDownloadView(files: state.files)

                FormBuilderAreaListView(areas: state.areas) { fieldInteraction in
                    switch fieldInteraction {
                    case let .fieldChanges(area, section, group, field, fieldChanges):
                        switch fieldChanges {
                        case let .text(text):
                            intent.updateTextField(
                                area: area,
                                sectionIndex: section,
                                groupIndex: group,
                                fieldIndex: field,
                                text: text
                            )
                        case let .number(number):
                            intent.updateNumberField(
                                area: area,
                                sectionIndex: section,
                                groupIndex: group,
                                fieldIndex: field,
                                number: number
                            )
                        case let .boolean(select):
                            intent.updateBoolField(
                                area: area,
                                sectionIndex: section,
                                groupIndex: group,
                                fieldIndex: field,
                                select: select
                            )
                        case let .file(file, fileName):
                            intent.updateFileField(
                                area: area,
                                sectionIndex: section,
                                groupIndex: group,
                                fieldIndex: field,
                                file: file,
                                fileName: fileName
                            )
                        case let .select(select):
                            intent.updateSelectField(
                                area: area,
                                sectionIndex: section,
                                groupIndex: group,
                                fieldIndex: field,
                                select: select
                            )
                        }
                    case let .groupAdd(area, section, group):
                        intent.appendField(area: area, sectionIndex: section, groupIndex: group)
                    case let .groupRemove(area, section, group):
                        intent.deleteField(area: area, sectionIndex: section, groupIndex: group)
                    }
                }
            }

            CTAButton(text: "저장") {
                intent.saveButtonDidTap()
            }
            .padding(.horizontal, 20)
            .padding(.bottom, safeAreaInsets.bottom + 16)
            .background {
                Color.sms(.system(.white))
            }
            .ignoresSafeArea()
        }
        .onAppear {
            intent.formOnAppear()
        }
    }
}
