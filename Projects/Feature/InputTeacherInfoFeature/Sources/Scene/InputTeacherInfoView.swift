import BaseFeature
import DesignSystem
import InputInformationBaseFeature
import SwiftUI

struct InputTeacherInfoView: View {
    @StateObject var container: MVIContainer<InputTeacherInfoIntentProtocol, InputTeacherInfoStateProtocol>
    var intent: any InputTeacherInfoIntentProtocol { container.intent }
    var state: any InputTeacherInfoStateProtocol { container.model }

    var body: some View {
        SMSNavigationTitleView(title: "정보입력") {
            VStack(spacing: 0) {
                HStack(spacing: 4) {
                    Text("프로필")
                        .foregroundColor(.sms(.system(.black)))

                    Text("*")
                        .foregroundColor(.sms(.sub(.s2)))

                    Spacer()
                }
                .smsFont(.title1)
                .padding(.top, 36)

                VStack(spacing: 24) {
                    inputTeacherInfoTextField(
                        title: "직함",
                        placeholder: "직함 선택",
                        text: .constant("")
                    )
                    .onTapGesture {
                        intent.jobTitleSheetIsRequired()
                    }

                    inputTeacherInfoTextField(
                        title: "학년",
                        placeholder: "학년 선택",
                        text: .constant("")
                    )
                    .onTapGesture {
                        intent.gradeSheetIsRequired()
                    }
                }
                .padding(.top, 32)

                CTAButton(text: "완료")
                    .padding(.top, 32)

                Spacer()
            }
            .padding(.horizontal, 20)
        }
        .smsBottomSheet(
            isShowing: Binding(
                get: { state.isPresentedJobTitleSheet },
                set: { _ in intent.jobTitleSheetDismissed() }
            )
        ) {
            jobTitleListView()
        }
        .smsBottomSheet(
            isShowing: Binding(
                get: { state.isPresentedGradeSheet },
                set: { _ in intent.gradeSheetDismissed() }
            )
        ) {
            gradeListView()
        }
    }

    @ViewBuilder
    func inputTeacherInfoTextField(
        title: String,
        placeholder: String,
        text: Binding<String>
    ) -> some View {
        SMSTextField(
            placeholder,
            text: text
        )
        .disabled(true)
        .overlay(alignment: .trailing) {
            SMSIcon(.downChevron)
                .padding(.trailing, 12)
        }
        .titleWrapper(title)
    }

    @ViewBuilder
    func jobTitleListView() -> some View {
        VStack(spacing: 16) {
            ForEach(0..<5, id: \.self) { index in
                HStack {
                    Text("\(index)")
                        .smsFont(.body1, color: .neutral(.n50))

                    Spacer()

                    Circle()
                        .fill(Color.sms(.primary(.p2)))
                        .frame(width: 24, height: 24)
                }
                .padding(.horizontal, 20)
            }
        }
    }

    @ViewBuilder
    func gradeListView() -> some View {
        VStack(spacing: 16) {
            ForEach(1..<4, id: \.self) { index in
                HStack {
                    Text("\(index)학년")
                        .smsFont(.body1, color: .neutral(.n50))

                    Spacer()

                    Circle()
                        .fill(Color.sms(.primary(.p2)))
                        .frame(width: 24, height: 24)
                }
                .padding(.horizontal, 20)
            }
        }
    }
}
