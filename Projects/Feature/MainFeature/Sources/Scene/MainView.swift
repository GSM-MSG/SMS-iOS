import SwiftUI
import UIKit
import BaseFeature
import ViewUtil
import DesignSystem

enum MainStudentIDProperty {
    static let studentScrollToTopID = "STUDENT_SCROLL_TO_TOP"
}

struct MainView: View {
    @StateObject var container: MVIContainer<MainIntentProtocol, MainStateProtocol>
    var intent: any MainIntentProtocol { container.intent }
    var state: any MainStateProtocol { container.model }
    @State var testString: [String] = ["asfds1234", "12313212w33", "43534545"]
    @State private var textSizes: [Int: CGSize] = [:]
    @State private var truncatedIndices: [Int] = []
    @State private var shouldTruncateLastText = false
    @State private var breakIndex = 0
    @State private var textEmpty = false

    var body: some View {
        NavigationView {
            VStack(alignment: .leading, spacing: 0) {
                ScrollViewReader { proxyReader in
                    ScrollView(showsIndicators: false) {
                        HStack(spacing: 4) {
                            Text("\(state.totalSize)")
                                .smsFont(.title1, color: .system(.black))

                            Text("명")
                                .smsFont(.title2, color: .neutral(.n30))

                            Spacer()
                        }
                        .id(MainStudentIDProperty.studentScrollToTopID)
                        .padding(.top, 24)

                        LazyVStack(alignment: .leading, spacing: 16) {
                            ForEach(state.content, id: \.id) { item in
                                studentListRow(
                                    profileImageUrl: item.profileImageURL,
                                    name: item.name,
                                    major: item.major,
                                    techStack: item.techStack
                                )

                                Divider()
                                    .background(Color.sms(.neutral(.n10)))
                            }

                            Color.clear
                                .onAppear {
                                    intent.reachedBottom(page: state.page, isLast: state.isLast)
                                }
                        }
                    }
                    .overlay(alignment: .bottomTrailing) {
                        floatingButton {
                            withAnimation(.default) {
                                proxyReader.scrollTo(MainStudentIDProperty.studentScrollToTopID, anchor: .top)
                            }
                        }
                        .padding(.bottom, 40)
                    }
                }
                .padding(.horizontal, 20)
            }
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    SMSIcon(.smsLogo, width: 80, height: 29)
                }
                ToolbarItem(placement: .topBarTrailing) {
                    SMSIcon(.profile)
                        .clipShape(Circle())
                }
            }
        }
    }

    @ViewBuilder
    func floatingButton(
        action: @escaping () -> Void
    ) -> some View {
        ZStack(alignment: .center) {
            Button {
                action()
            } label: {
                SMSIcon(.upArrow, width: 11, height: 18)
            }
        }
        .frame(width: 40, height: 40)
        .background(Color.sms(.system(.black)))
        .clipShape(Circle())
    }

    @ViewBuilder
    func studentListRow(
        profileImageUrl: String,
        name: String,
        major: String,
        techStack: [String]
    ) -> some View {
        HStack(spacing: 12) {
            AsyncImage(url: URL(string: profileImageUrl)) { image in
                image
                    .resizable()
            } placeholder: {
                SMSIcon(.profile, width: 101, height: 101)
            }
            .frame(width: 101, height: 101)
            .cornerRadius(8)

            VStack(alignment: .leading, spacing: 4) {
                Text(name)
                    .smsFont(.title2)

                Text(major)
                    .smsFont(.body2)
                    .padding(.bottom, 16)

                techStackRow(techStack: techStack)
            }
        }
    }

    @ViewBuilder
    func techStackRow(techStack: [String]) -> some View {
        ScrollView(.horizontal, showsIndicators: false) {
            LazyHStack {
                ForEach(techStack, id: \.self) { text in
                    Text(text)
                        .smsFont(.body1, color: .neutral(.n40))
                        .padding(.horizontal, 12)
                        .padding(.vertical, 5.5)
                        .background(
                            Color.sms(.neutral(.n10))
                        )
                        .cornerRadius(8)
                }

                Spacer()
            }
        }
    }
}
