import BaseFeature
import DesignSystem
import SwiftUI
import UserDomainInterface
import ViewUtil

struct StudentDetailView: View {
    @Environment(\.safeAreaInsets) var safeAreaInsets
    @Environment(\.dismiss) var dismiss
    @StateObject var container: MVIContainer<StudentDetailIntentProtocol, StudentDetailStateProtocol>
    var intent: any StudentDetailIntentProtocol { container.intent }
    var state: any StudentDetailStateProtocol { container.model }

    var body: some View {
        ZStack(alignment: .topTrailing) {
            VStack {
                Group {
                    if state.userRole == .guest {
                        SMSIcon(.profile, width: nil, height: nil)
                    } else {
                        Image(systemName: "")
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
            SMSText("Design", font: .body1)
                .foregroundColor(.sms(.sub(.s2)))
                .padding(.top, 16)

            SMSText("변찬우", font: .headline3)
                .foregroundColor(.sms(.system(.black)))
                .padding(.top, 4)

            ConditionView(state.userRole != .guest) {
                SMSText("3학년 2반 12번 • 소프트웨어 개발과", font: .body2)
                    .foregroundColor(.sms(.neutral(.n40)))
            }

            ScrollView(.horizontal, showsIndicators: false) {
                LazyHStack(spacing: 4) {
                    ForEach(1...10, id: \.self) { count in
                        SMSText("Figma \(count)", font: .caption2)
                            .padding(.horizontal, 12)
                            .padding(.vertical, 6.5)
                            .background {
                                RoundedRectangle(cornerRadius: 8)
                                    .fill(Color.sms(.neutral(.n10)))
                            }
                    }
                }
            }
            .padding(.top, 16)

            SMSText("더 나은\n사용자사용자사용자사용자사용자사용자사용자사용자사용자사용자사용자", font: .body2)
                .lineLimit(nil)
                .padding(.top, 16)

            ConditionView(state.userRole != .teacher) {
                studentInfoForTeacher(geometry: geometry)
                    .padding(.top, 32)
            }
        }
        .padding(.horizontal, 20)
        .background {
            Color.sms(.system(.white))
                .cornerRadius(24, corners: [.topLeft, .topRight])
        }
    }

    @ViewBuilder
    func studentInfoForTeacher(geometry: GeometryProxy) -> some View {
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
