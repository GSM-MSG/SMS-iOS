import BaseFeature
import DesignSystem
import NukeUI
import SwiftUI
import UserDomainInterface
import StudentDomainInterface
import ViewUtil

struct StudentDetailView: View {
    @Environment(\.safeAreaInsets) var safeAreaInsets
    @Environment(\.dismiss) var dismiss
    @StateObject var container: MVIContainer<StudentDetailIntentProtocol, StudentDetailStateProtocol>
    var intent: any StudentDetailIntentProtocol { container.intent }
    var state: any StudentDetailStateProtocol { container.model }
    let profileImageNamespace: Namespace.ID
    var studentDetail: StudentDetailEntity? {
        state.studentDetailEntity
    }

    var body: some View {
        ZStack(alignment: .topTrailing) {
            VStack {
                Group {
                    if let studentDetail, !studentDetail.profileImageURL.isEmpty {
                        LazyImage(url: URL(string: studentDetail.profileImageURL)) { state in
                            if let image = state.image {
                                image.resizable()
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
                .matchedGeometryEffect(
                    id: ViewNamespaceIDProperty.studentDetailNamespaceID,
                    in: profileImageNamespace
                )

                Spacer()
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .ignoresSafeArea(edges: .top)

            GeometryReader { geometry in
                ScrollView(showsIndicators: false) {
                    Color.clear
                        .frame(maxWidth: .infinity, maxHeight: .infinity)
                        .aspectRatio(1.0, contentMode: .fill)
                        .fixedSize(horizontal: false, vertical: true)
                        .ignoresSafeArea(edges: .top)

                    studentInfoView(geometry: geometry)
                }
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .ignoresSafeArea(edges: .top)

            SMSIcon(.xmark)
                .padding(.top, 8)
                .padding(.trailing, 20)
                .buttonWrapper {
                    dismiss()
                }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .onAppear {
            intent.onAppear()
        }
        .navigationBarHidden(true)
    }

    @ViewBuilder
    func studentInfoView(geometry: GeometryProxy) -> some View {
        VStack(alignment: .leading, spacing: 0) {
            Spacer().frame(height: 16)

            if let detailInfoByTeacher = studentDetail?.detailInfoByTeacher {
                HStack {
                    SMSText(studentDetail?.major ?? "전공", font: .body1)
                        .foregroundColor(.sms(.sub(.s2)))

                    Spacer()

                    SMSIcon(.book)
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

                SMSText(studentDetail?.introduce ?? "자기소개", font: .body2)
                    .lineLimit(nil)

                Spacer().frame(height: 32)

                UnwrapView(studentDetail?.detailInfoByTeacher) { detailInfoByTeacher in
                    studentInfoForTeacher(geometry: geometry, detailInfo: detailInfoByTeacher)
                }
            }

            Color.sms(.system(.white))
                .frame(height: 300)
        }
        .padding(.horizontal, 20)
        .background {
            Color.sms(.system(.white))
                .cornerRadius(24, corners: [.topLeft, .topRight])
        }
    }

    @ViewBuilder
    func studentInfoForTeacher(
        geometry: GeometryProxy,
        detailInfo: StudentDetailEntity.DetailInfoByTeacher
    ) -> some View {
        VStack(spacing: 16) {
            Group {
                studentInfoRowView(name: "이메일", value: "baegteun@gmail.com", geometry: geometry)

                studentInfoRowView(name: "인증제점수", value: "800", geometry: geometry)

                SMSSeparator(.neutral(.n20), height: 1)
            }

            Group {
                studentInfoRowView(name: "병특 희망 여부", value: "병특 희망", geometry: geometry)

                SMSSeparator(.neutral(.n20), height: 1)
            }

            Group {
                studentInfoRowView(name: "희망 고용 형태", value: "정규직", geometry: geometry)

                studentInfoRowView(name: "희망 연봉", value: "9999만원", geometry: geometry)

                studentInfoRowView(name: "근무 희망 지역", value: "서울, 부산", geometry: geometry)

                SMSSeparator(.neutral(.n20), height: 1)
            }

            Group {
                ForEach(0...2, id: \.self) { _ in
                    studentInfoRowView(name: "한국어", value: "원어민", geometry: geometry)
                }

                SMSSeparator(.neutral(.n20), height: 1)
            }

            studentInfoRowView(name: "자격증", value: "정보처리산업기사", geometry: geometry)

            Spacer().frame(height: 40)

            CTAButton(text: "포트폴리오")
        }
    }

    @ViewBuilder
    func studentInfoRowView(name: String, value: String, geometry: GeometryProxy) -> some View {
        HStack(alignment: .center) {
            SMSText(name, font: .body1)
                .foregroundColor(.sms(.system(.black)))

            Spacer()

            SMSText(value, font: .body2)
                .lineLimit(0)
                .foregroundColor(.sms(.neutral(.n40)))
                .frame(width: geometry.size.width * 0.6, alignment: .leading)
        }
    }
}
