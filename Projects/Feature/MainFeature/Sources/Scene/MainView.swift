import SwiftUI
import UIKit
import BaseFeature
import ViewUtil
import DesignSystem
import NukeUI

enum MainStudentIDProperty {
    static let studentScrollToTopID = "STUDENT_SCROLL_TO_TOP"
}

struct MainView: View {
    @StateObject var container: MVIContainer<MainIntentProtocol, MainStateProtocol>
    var intent: any MainIntentProtocol { container.intent }
    var state: any MainStateProtocol { container.model }

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

                                SMSSeparator(.neutral(.n10), height: 1)
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
            .navigationViewStyle(.stack)
            .navigationBarTitleDisplayMode(.inline)
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
            LazyImage(url: URL(string: profileImageUrl)) { state in
                if let image = state.image {
                    image
                        .resizable()
                } else {
                    SMSIcon(.profile, width: 101, height: 101)
                }
            }
            .frame(width: 101, height: 101)
            .cornerRadius(8)

            VStack(alignment: .leading, spacing: 4) {
                SMSText(name, font: .title2)

                SMSText(major, font: .body2)
                    .padding(.bottom, 16)

                techStackListView(techStack: techStack)
            }
        }
    }

    @ViewBuilder
    func techStackListView(techStack: [String]) -> some View {
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
