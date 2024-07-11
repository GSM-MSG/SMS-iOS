import BaseFeature
import DesignSystem
import NukeUI
import StudentDetailFeatureInterface
import SwiftUI
import UIKit
import UserDomainInterface
import ViewUtil
import FilterFeatureInterface
import MyPageFeatureInterface
import GSMAuthenticationFormFeatureInterface

enum MainStudentIDProperty {
    static let studentScrollToTopID = "STUDENT_SCROLL_TO_TOP"
}

struct MainView: View {
    @Namespace var profileImageNamespace
    @StateObject var container: MVIContainer<MainIntentProtocol, MainStateProtocol>
    var intent: any MainIntentProtocol { container.intent }
    var state: any MainStateProtocol { container.model }
    private let studentDetailBuildable: any StudentDetailBuildable
    private let filterBuildable: any FilterBuildable
    private let myPageBuildable: any MyPageBuildable
    private let gsmAuthenticatoinBuildable: any GSMAuthenticationBuildable

    init(
        container: MVIContainer<MainIntentProtocol, MainStateProtocol>,
        studentDetailBuildable: any StudentDetailBuildable,
        filterBuildable: any FilterBuildable,
        myPageBuildable: any MyPageBuildable,
        gsmAuthenticatoinBuildable: any GSMAuthenticationBuildable
    ) {
        self._container = StateObject(wrappedValue: container)
        self.studentDetailBuildable = studentDetailBuildable
        self.filterBuildable = filterBuildable
        self.myPageBuildable = myPageBuildable
        self.gsmAuthenticatoinBuildable = gsmAuthenticatoinBuildable
    }

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
                                    id: item.id,
                                    profileImageUrl: item.profileImageURL,
                                    name: item.name,
                                    major: item.major,
                                    techStacks: item.techStacks
                                )
                                .foregroundColor(.sms(.system(.black)))
                                .buttonWrapper {
                                    withAnimation {
                                        intent.studentDidSelect(userID: item.id)
                                    }
                                }

                                SMSSeparator(.neutral(.n10), height: 1)
                            }

                            Color.clear
                                .onAppear {
                                    guard !state.isRefresh else { return }
                                    intent.reachedBottom(
                                        page: state.page,
                                        isLast: state.isLast,
                                        filterOption: state.filterOption
                                    )
                                }
                        }
                    }
                    .refreshable {
                        intent.refresh(filterOption: state.filterOption)
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
            .fullScreenCover(
                isPresented: Binding(
                    get: { state.selectedUserID != nil },
                    set: { _ in intent.studentDetailDismissed() }
                )
            ) {
                UnwrapView(state.selectedUserID) { userID in
                    studentDetailBuildable.makeView(
                        userID: userID
                    )
                    .eraseToAnyView()
                }
            }
            .navigate(
                to: filterBuildable.makeView(delegate: intent).eraseToAnyView(),
                when: Binding(
                    get: { state.isPresentedFilterPage },
                    set: { _ in intent.filterDismissed() }
                )
            )
            .navigate(
                to: myPageBuildable.makeView(delegate: intent).eraseToAnyView(),
                when: Binding(
                    get: { state.isPresentedMyPage },
                    set: { _ in intent.myPageDismissed() }
                )
            )
            .navigate(
                to: gsmAuthenticatoinBuildable.makeView().eraseToAnyView(),
                when: Binding(
                    get: { state.isPresentedAuthentification },
                    set: { _ in intent.authentificationPageIsDismissed() }
                )
            )
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItemGroup(placement: .navigationBarTrailing) {
                    SMSIcon(.filter, width: 24, height: 24)
                        .padding(.trailing, 6)
                        .onTapGesture {
                            intent.filterIsRequired()
                        }

                    SMSIcon(.profile, width: 32, height: 32)
                        .clipShape(Circle())
                        .onTapGesture {
                            state.currentUserRole == .student ? intent.myInfoBottomSheetIsRequired() : intent.exitIsRequired()
                        }
                }
            }
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    SMSIcon(.smsLogo, width: 80, height: 29)
                }
            }
            .smsAlert(
                title: "로그아웃",
                description: "정말로 로그아웃하시겠습니까?",
                isShowing: Binding(
                    get: { state.isPresntedExit },
                    set: { _ in intent.exitIsDismissed() }
                ),
                alertActions: [
                    .init(text: "취소", style: .outline) {
                        intent.exitIsDismissed()
                    },
                    .init(text: "확인", style: .error) {
                        intent.exitIsDismissed()
                        intent.logout()
                    }
                ]
            )
            .smsBottomSheet(
                isShowing: Binding(
                    get: { state.isPresentedMyInfoBottomSheet },
                    set: { _ in intent.myInfoBottomSheetIsDismissed() }
                )
            ) {
                VStack(alignment: .leading, spacing: 32) {
                    Button {
                        intent.myInfoBottomSheetIsDismissed()
                        intent.myPageIsRequired()
                    } label: {
                        HStack(spacing: 12) {
                            SMSIcon(.person)

                            SMSText("마이페이지", font: .title2)
                                .foregroundStyle(Color.sms(.neutral(.n50)))

                            Spacer()
                        }
                    }

                    Button {
                        intent.myInfoBottomSheetIsDismissed()
                        intent.authentificationPageIsRequired()
                    } label: {
                        HStack(spacing: 12) {
                            SMSIcon(.briefcases)

                            SMSText("인증제", font: .title2)
                                .foregroundStyle(Color.sms(.neutral(.n50)))

                            Spacer()
                        }
                    }
                }
                .padding(.top, 12)
                .padding(.horizontal, 20)
            }
            .animation(.default, value: state.isPresentedMyInfoBottomSheet)
        }
        .navigationViewStyle(.stack)
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
        id: String,
        profileImageUrl: String,
        name: String,
        major: String,
        techStacks: [String]
    ) -> some View {
        HStack(spacing: 12) {
            Group {
                if profileImageUrl.isNotEmpty, let imageURL = URL(string: profileImageUrl) {
                    LazyImage(url: imageURL) { state in
                        if let image = state.image {
                            image
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                        } else {
                            SMSIcon(.profile, width: 101, height: 101)
                        }
                    }
                    .frame(width: 101, height: 101)
                } else {
                    SMSIcon(.profile, width: 101, height: 101)
                }
            }
            .cornerRadius(8)

            VStack(alignment: .leading, spacing: 4) {
                SMSText(name, font: .title2)

                SMSText(major, font: .body2)
                    .padding(.bottom, 16)

                techStackListView(techStack: techStacks)
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
