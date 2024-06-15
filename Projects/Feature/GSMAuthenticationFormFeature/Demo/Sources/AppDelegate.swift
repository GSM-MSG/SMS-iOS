import SwiftUI
@testable import GSMAuthenticationFormFeature

@main
struct GSMAuthenticationFormDemoApp: App {
    var body: some Scene {
        WindowGroup {
            let uiModel = GSMAuthenticationFormUIModel(
                areas: [
                    .init(
                        title: "전공 영역",
                        sections: [
                            .init(
                                title: "TOPCIT",
                                sectionId: "3ef0c164-430b-4afa-9785-8f5ca7b1decf",
                                currentFieldCount: 1,
                                fields: [
                                    .init(
                                        fieldId: "e1b05d28-7caa-416a-9c6e-d6ad1b2bb887",
                                        type: .text(value: nil),
                                        scoreDescription: "취득 점수 * 3.3",
                                        placeholder: "200점"
                                    )
                                ]
                            ),
                            .init(
                                title: "교내 대회 및 교육 참가",
                                sectionId: "7d9bffc8-caa0-4b65-9465-7f79da375e48",
                                currentFieldCount: 3,
                                fields: [
                                    .init(
                                        fieldId: "3a73757b-35cb-45de-875b-78da8b41970c",
                                        type: .file(fileName: nil),
                                        scoreDescription: "GSM Festival, 교내해커톤 대회, 전공동아리 발표 대회",
                                        placeholder: "1회당 50점"
                                    ),
                                    .init(
                                        fieldId: "89990ad2-0ed1-4f0f-8e6d-fa33bb4e4b5b",
                                        type: .file(fileName: nil),
                                        scoreDescription: "전공특강(방과후)",
                                        placeholder: "1회당 5점 최대 4회"
                                    ),
                                    .init(
                                        fieldId: "d18a109a-377f-4392-ad32-4d3823c8974c",
                                        type: .file(fileName: nil),
                                        scoreDescription: "전공 관련 방과 후 학교 이수",
                                        placeholder: "1회당 15점 최대 2회"
                                    )
                                ]
                            )
                        ]
                    )
                ],
                files: [
                    .init(name: "독후감 파일", url: "https://sms-bucket-104.s3.ap-northeast-2.amazonaws.com/sms-main-server/1.hwp"),
                    .init(name: "토익 점수표", url: "https://sms-bucket-104.s3.ap-northeast-2.amazonaws.com/sms-main-server/1A00E31F-7B57-4F79-86D3-E7EFAB7F408A_1_102_o.jpeg")
                ]
            )


            GSMAuthenticationFormBuilderView(uiModel: uiModel) { _ in

            }
        }
    }
}
