import BaseFeature
import DesignSystem
import NukeUI
import SwiftUI
import UserDomainInterface
import UniformTypeIdentifiers
import StudentDomainInterface
import ViewUtil

struct StudentDetailView: View {
    @Environment(\.safeAreaInsets) var safeAreaInsets
    @Environment(\.dismiss) var dismiss
    @Environment(\.openURL) var openURL
    @StateObject var container: MVIContainer<StudentDetailIntentProtocol, StudentDetailStateProtocol>
    var intent: any StudentDetailIntentProtocol { container.intent }
    var state: any StudentDetailStateProtocol { container.model }
    var studentDetail: StudentDetailEntity? {
        state.studentDetailEntity
    }

    var body: some View {
        ZStack(alignment: .topTrailing) {
            VStack {
                Group {
                    if let studentDetail, studentDetail.profileImageURL.isNotEmpty {
                        LazyImage(url: URL(string: studentDetail.profileImageURL)) { state in
                            if let image = state.image {
                                image.resizable()
                                    .aspectRatio(1, contentMode: .fit)
                            } else {
                                SMSIcon(.profile, width: nil, height: nil)
                            }
                        }
                    } else {
                        SMSIcon(.profile, width: nil, height: nil)
                    }
                }
                .aspectRatio(1.0, contentMode: .fill)
                .fixedSize(horizontal: false, vertical: true)
                .cornerRadius(24, corners: [.bottomLeft, .bottomRight])

                Spacer()
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .ignoresSafeArea(edges: .top)

            GeometryReader { geometry in
                ZStack(alignment: .bottom) {
                    ScrollView(showsIndicators: false) {
                        Color.clear
                            .frame(maxWidth: .infinity, maxHeight: .infinity)
                            .aspectRatio(1.0, contentMode: .fill)
                            .fixedSize(horizontal: false, vertical: true)
                            .ignoresSafeArea(edges: .top)

                        if state.isLoading {
                            ProgressView()
                                .progressViewStyle(.circular)
                        } else {
                            studentInfoView(geometry: geometry)
                        }
                    }

                    if let detailInfoByTeacher = studentDetail?.detailInfoByTeacher {
                        HStack(spacing: 8) {
                            CTAButton(text: "포트폴리오") {
                                guard
                                    let portfolioURLString = studentDetail?.detailInfoByTeacher?.portfolioURL,
                                    let portfolioURL = URL(string: portfolioURLString)
                                else { return }
                                openURL(portfolioURL)
                            }

                            CTAButton(text: "공유", style: .outline) {
                                intent.effectiveDateDialogIsRequired()
                            }
                        }
                        .padding(.horizontal, 20)
                        .padding(.bottom, safeAreaInsets.bottom + 16)
                        .background {
                            Color.sms(.system(.white))
                        }
                        .ignoresSafeArea()
                    }
                }
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .ignoresSafeArea()

            SMSIcon(.xmark)
                .padding(.top, 8)
                .padding(.trailing, 20)
                .buttonWrapper {
                    dismiss()
                }
        }
        .smsDialog(
            title: "만료기간 선택",
            isShowing: Binding(
                get: { state.isPresentedEffectiveDateDialog },
                set: { _ in intent.effectiveDateDialogDismissed() }
            ),
            dialogActions: [
                .init(
                    text: "취소",
                    style: .outline,
                    action: { intent.effectiveDateDialogDismissed() }
                ),
                .init(
                    text: "링크생성",
                    style: .default,
                    action: {
                        #warning("링크 생성 이벤트 추가")
                        intent.pasteLinkDialogIsRequired()
                        intent.effectiveDateDialogDismissed()
                    }
                )
            ]
        ) {
            effectiveDateView()
        }
        .smsDialog(
            title: "만료기간 선택",
            isShowing: Binding(
                get: { state.isPresentedPasteLinkDialog },
                set: { _ in intent.pasteLinkDialogDismissed() }
            ),
            dialogActions: [
                .init(
                    text: "확인",
                    style: .default,
                    action: { intent.pasteLinkDialogDismissed() }
                )
            ]
        ) {
            copyLinkView()
        }
        .statusBarHidden(true)
        .animation(.easeIn, value: state.studentDetailEntity)
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .onAppear {
            intent.onAppear()
        }
        .navigationBarHidden(true)
    }

    // swiftlint: disable function_body_length
    @ViewBuilder
    func studentInfoView(geometry: GeometryProxy) -> some View {
        VStack(alignment: .leading, spacing: 0) {
            Spacer().frame(height: 16)

            if studentDetail?.detailInfoByTeacher != nil {
                HStack {
                    SMSText(studentDetail?.major ?? "전공", font: .body1)
                        .foregroundColor(.sms(.sub(.s2)))

                    Spacer()

                }
            } else {
                SMSText(studentDetail?.major ?? "전공", font: .body1)
                    .foregroundColor(.sms(.sub(.s2)))
            }

            Spacer().frame(height: 4)

            SMSText(studentDetail?.name ?? "김**", font: .headline3)
                .foregroundColor(.sms(.system(.black)))

            ConditionView(state.userRole != .guest) {
                Spacer().frame(height: 8)

                UnwrapView(studentDetail?.detailInfoByStudent) { detailInfo in
                    let grade = detailInfo.grade
                    let `class` = detailInfo.class
                    let number = detailInfo.number
                    let department = detailInfo.department
                    SMSText(
                        "\(grade)학년 \(`class`)반 \(number)번 • \(department.display)",
                        font: .body2
                    )
                    .foregroundColor(.sms(.neutral(.n40)))
                }

                UnwrapView(studentDetail?.detailInfoByTeacher) { detailInfo in
                    let grade = detailInfo.grade
                    let `class` = detailInfo.class
                    let number = detailInfo.number
                    let department = detailInfo.department
                    SMSText(
                        "\(grade)학년 \(`class`)반 \(number)번 • \(department.display)",
                        font: .body2
                    )
                    .foregroundColor(.sms(.neutral(.n40)))
                }
            }

            Spacer().frame(height: 16)

            ScrollView(.horizontal, showsIndicators: false) {
                LazyHStack(spacing: 4) {
                    ForEach(studentDetail?.techStacks ?? [], id: \.self) { techStack in
                        SMSText(techStack, font: .caption2)
                            .padding(.horizontal, 12)
                            .padding(.vertical, 6.5)
                            .background {
                                RoundedRectangle(cornerRadius: 8)
                                    .fill(Color.sms(.neutral(.n10)))
                            }
                    }
                }
            }

            Group {
                Spacer().frame(height: 16)

                ZStack(alignment: .topLeading) {
                    Color.sms(.neutral(.n10))
                        .cornerRadius(8)

                    VStack(alignment: .leading, spacing: 4) {
                        SMSText("자기소개", font: .caption2)
                            .foregroundColor(.sms(.neutral(.n40)))

                        SMSText(studentDetail?.introduce ?? "자기소개", font: .body2)
                            .foregroundColor(.sms(.system(.black)))
                            .lineLimit(nil)
                    }
                    .padding(16)
                }

                Spacer().frame(height: 32)

                UnwrapView(studentDetail?.detailInfoByTeacher) { detailInfoByTeacher in
                    studentInfoForTeacher(geometry: geometry, detailInfo: detailInfoByTeacher)
                }

                ConditionView(state.userRole == .teacher) {
                    Spacer().frame(height: 40)
                }

                ConditionView(studentDetail?.prizes.isNotEmpty ?? false) {
                    VStack(spacing: 8) {
                        ForEach(studentDetail?.prizes ?? [], id: \.self) { prize in
                            PrizeRowView(prize: prize)
                        }
                    }
                    .studentDetailTitleWrapper(title: "수상")

                    Spacer().frame(height: 40)
                }

                ConditionView(studentDetail?.projects.isNotEmpty ?? false) {
                    VStack(spacing: 32) {
                        ForEach(studentDetail?.projects ?? [], id: \.self) { project in
                            ProjectRowView(project: project)
                        }
                    }
                    .studentDetailTitleWrapper(title: "프로젝트")
                }

                Spacer().frame(height: 120)
            }
        }
        .padding(.horizontal, 20)
        .background {
            Color.sms(.system(.white))
                .cornerRadius(24, corners: [.topLeft, .topRight])
        }
    }
    // swiftlint: enable function_body_length

    @ViewBuilder
    func studentInfoForTeacher(
        geometry: GeometryProxy,
        detailInfo: StudentDetailEntity.DetailInfoByTeacher
    ) -> some View {
        VStack(spacing: 16) {
            Group {
                studentInfoRowView(name: "이메일", value: detailInfo.contactEmail, geometry: geometry)

                studentInfoRowView(
                    name: "인증제점수",
                    value: "\(detailInfo.gsmAuthenticationScore)",
                    geometry: geometry
                )

                SMSSeparator(.neutral(.n20), height: 1)
            }

            Group {
                studentInfoRowView(
                    name: "병특 희망 여부",
                    value: detailInfo.militaryService.display(),
                    geometry: geometry
                )

                SMSSeparator(.neutral(.n20), height: 1)
            }

            Group {
                studentInfoRowView(
                    name: "희망 고용 형태",
                    value: detailInfo.formOfEmployment.display(),
                    geometry: geometry
                )

                let salaryString = detailInfo.salary == 0 ? "상관없음" : "\(detailInfo.salary)만원"
                studentInfoRowView(name: "희망 연봉", value: salaryString, geometry: geometry)

                studentInfoRowView(
                    name: "근무 희망 지역",
                    value: detailInfo.regions.joined(separator: ", "),
                    geometry: geometry
                )
                .conditional(detailInfo.regions.isNotEmpty)

                SMSSeparator(.neutral(.n20), height: 1)
                    .conditional(detailInfo.languageCertificate.isNotEmpty)
            }

            Group {
                ForEach(detailInfo.languageCertificate, id: \.name) { language in
                    studentInfoRowView(name: language.name, value: language.score, geometry: geometry)
                }

                SMSSeparator(.neutral(.n20), height: 1)
                    .conditional(detailInfo.certificate.isNotEmpty)
            }

            studentInfoRowView(
                name: "자격증",
                value: detailInfo.certificate.joined(separator: "\n"),
                geometry: geometry
            )
            .conditional(detailInfo.certificate.isNotEmpty)
        }
        .studentDetailTitleWrapper(title: "세부정보")
    }

    @ViewBuilder
    func studentInfoRowView(name: String, value: String, geometry: GeometryProxy) -> some View {
        HStack(alignment: .top) {
            SMSText(name, font: .body1)
                .lineLimit(nil)
                .foregroundColor(.sms(.system(.black)))
                .frame(width: 120, alignment: .leading)

            Spacer()

            SMSText(value, font: .body2)
                .lineLimit(1)
                .foregroundColor(.sms(.neutral(.n40)))
                .frame(maxWidth: .infinity, alignment: .leading)
        }
    }

    @ViewBuilder
    func effectiveDateView() -> some View {
        SelectedEffectiveDateView(
            data: EffectiveDateType.allCases,
            id: \.self,
            isSelected: {
                state.effectiveDateType == $0
            },
            selectAction: {
                intent.effectiveDateSelect(effectiveDate: $0)
            }
        ) { effectiveDate in
            SMSText("\(effectiveDate.rawValue)일", font: .body1)
        }
    }

    @ViewBuilder
    func copyLinkView() -> some View {
        HStack(spacing: 8) {
            SMSText(state.portfolioLink, font: .body1)

            Spacer()

            Button {
                intent.pastePortfolioLink(portfolioLink: state.portfolioLink)
            } label: {
                Text("복사")
                    .padding(.horizontal, 20)
                    .padding(.vertical, 5)
                    .smsFont(.body1, color: .primary(.p2))
                    .overlay {
                        RoundedRectangle(cornerRadius: 56)
                            .strokeBorder(Color.sms(.primary(.p2)), lineWidth: 1)
                    }
            }
        }
    }
}
