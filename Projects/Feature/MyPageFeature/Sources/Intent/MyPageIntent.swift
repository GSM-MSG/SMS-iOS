import Foundation
import DesignSystem
import UserDomainInterface
import AuthDomainInterface
import FileDomainInterface
import MyPageFeatureInterface
import StudentDomainInterface
import MajorDomainInterface
import ConcurrencyUtil
import DateUtil

final class MyPageIntent: MyPageIntentProtocol {
    weak var model: (any MyPageActionProtocol)?
    private weak var myPageDelegate: (any MyPageDelegate)?
    private let fetchMyProfileUseCase: any FetchMyProfileUseCase
    private let logoutUseCase: any LogoutUseCase
    private let withdrawalUseCase: any WithdrawalUseCase
    private let imageUploadUseCase: any ImageUploadUseCase
    private let modifyInformationUseCase: any ModifyInformationUseCase
    private let fetchMajorListUseCase: any FetchMajorListUseCase

    init(
        model: any MyPageActionProtocol,
        myPageDelegate: any MyPageDelegate,
        fetchMyProfileUseCase: any FetchMyProfileUseCase,
        logoutUseCase: any LogoutUseCase,
        withdrawalUseCase: any WithdrawalUseCase,
        imageUploadUseCase: any ImageUploadUseCase,
        modifyInformationUseCase: any ModifyInformationUseCase,
        fetchMajorListUseCase: any FetchMajorListUseCase
    ) {
        self.model = model
        self.myPageDelegate = myPageDelegate
        self.fetchMyProfileUseCase = fetchMyProfileUseCase
        self.logoutUseCase = logoutUseCase
        self.withdrawalUseCase = withdrawalUseCase
        self.imageUploadUseCase = imageUploadUseCase
        self.modifyInformationUseCase = modifyInformationUseCase
        self.fetchMajorListUseCase = fetchMajorListUseCase
    }

    func onAppear() {
        Task {
            do {
                let majorList = try await fetchMajorListUseCase.execute()
                model?.updateMajorList(majorList: majorList)
                let profile = try await fetchMyProfileUseCase.execute()
                model?.updateProfileURL(url: profile.profileImageURL)
                model?.updateIntroduce(introduce: profile.introduce)
                model?.updatePortfolioURL(portfolioURL: profile.portfolioURL)
                model?.updateMajor(major: profile.major)
                model?.updateEmail(email: profile.contactEmail)
                model?.updateGSMScore(gsmScore: "\(profile.gsmAuthenticationScore)")
                model?.updateFormOfEmployment(form: profile.formOfEmployment)
                model?.updateWorkRegions(regions: profile.regions)
                model?.updateMilitaryServiceType(type: profile.militaryService)
                model?.updateSalary(salary: "\(profile.salary)")
                model?.updateLanguageScores(
                    languages: profile.languageCertificates.map {
                        $0.toModel()
                    }
                )
                model?.updateCertificates(certificates: profile.certificates)
                model?.updateTechStacks(techStacks: profile.techStacks)
                model?.updateProjectList(
                    projectList: profile.proejcts.map {
                        $0.toModel()
                    }
                )
                model?.updatePrizeList(
                    prizeList: profile.prizes.map {
                        $0.toModel()
                    }
                )
            } catch {
                model?.updateIsError(isError: true)
            }
        }
    }

    func exitActionSheetIsRequired() {
        model?.updateIsPresentedExitBottomSheet(isPresented: true)
    }

    func exitActionSheetDismissed() {
        model?.updateIsPresentedExitBottomSheet(isPresented: false)
    }

    func logoutDialogIsRequired() {
        model?.updateIsPresentedLogoutDialog(isPresented: true)
    }

    func logoutDialogDismissed() {
        model?.updateIsPresentedLogoutDialog(isPresented: false)
    }

    func logoutDialogIsComplete() {
        Task {
            do {
                try await logoutUseCase.execute()
                myPageDelegate?.logout()
            } catch {
                model?.updateIsError(isError: true)
            }
        }
        model?.updateIsPresentedLogoutDialog(isPresented: false)
    }

    func withdrawalDialogIsRequired() {
        model?.updateIsPresentedWithdrawalDialog(isPresented: true)
    }

    func withdrawalDialogDismissed() {
        model?.updateIsPresentedWithdrawalDialog(isPresented: false)
    }

    func withdrawalDialogIsComplete() {
        Task {
            do {
                try await withdrawalUseCase.execute()
                myPageDelegate?.logout()
            } catch {
                model?.updateIsError(isError: true)
            }
        }
        model?.updateIsPresentedWithdrawalDialog(isPresented: false)
    }

    func modifyToInputAllInfo(state: any MyPageStateProtocol) {
        model?.updateIsLoading(isLoading: true)

        if self.validateProfile(
            profileImageURL: state.profileURL,
            introduce: state.introduce,
            email: state.email,
            major: state.major,
            portfolioURL: state.profileURL
        )
            && self.validateProject(projects: state.projectList)
            && self.validatePrize(prizes: state.prizeList) {
            model?.updateIsError(isError: true)
            model?.updateIsLoading(isLoading: false)
            return
        }

        Task {
            do {
                let modifyInformationRequest = ModifyStudentInformationRequestDTO(
                    certificates: state.certificates,
                    contactEmail: state.email,
                    formOfEmployment: FormOfEmployment(rawValue: state.formOfEmployment.rawValue) ?? .fullTime,
                    gsmAuthenticationScore: Int(state.gsmScore) ?? 0,
                    introduce: state.introduce,
                    languageCertificates: state.languageList.map { $0.toDTO() },
                    major: state.major,
                    militaryService: state.selectedMilitaryServiceType,
                    portfolioURL: state.portfolioURL,
                    profileImgURL: state.profileURL,
                    regions: state.workRegionList,
                    salary: Int(state.salary) ?? 0,
                    techStacks: state.techStacks,
                    projects: state.projectList.map {
                        let startAtString = $0.startAt.toStringCustomFormat(format: "yyyy.MM")
                        let endAtString = $0.endAt?.toStringCustomFormat(format: "yyyy.MM") ?? "개발중"

                        return $0.toDTO(
                            iconURL: $0.iconImage,
                            previewImageURLS: $0.previewImages,
                            startAt: startAtString,
                            endAt: endAtString
                        )
                    },
                    prizes: state.prizeList.map { $0.toDTO() }
                )

                try await modifyInformationUseCase.execute(req: modifyInformationRequest)
                model?.updateIsLoading(isLoading: false)
            } catch {
                model?.updateIsError(isError: true)
                model?.updateIsLoading(isLoading: false)
            }
        }
    }

    func imageUpload(imageResult: PickedImageResult) async throws -> String {
        try await Task {
            try await imageUploadUseCase.execute(
                image: imageResult.uiImage.jpegData(compressionQuality: 0.2) ?? .init(),
                fileName: imageResult.fileName
            )
        }
        .value
    }
}

extension LanguageModel {
    func toDTO() -> ModifyStudentInformationRequestDTO.LanguageCertificate {
        ModifyStudentInformationRequestDTO.LanguageCertificate(
            languageCertificateName: name,
            score: score
        )
    }
}

extension ProjectModel {
    func toDTO(
        iconURL: String,
        previewImageURLS: [String],
        startAt: String,
        endAt: String
    ) -> ModifyStudentInformationRequestDTO.Project {
        ModifyStudentInformationRequestDTO.Project(
            name: name,
            iconImageURL: iconURL,
            previewImageURLs: previewImageURLS,
            description: content,
            links: relatedLinks.map { $0.toDTO() },
            techStacks: Array(techStacks),
            myActivity: mainTask,
            inProgress: .init(
                start: startAt,
                end: endAt
            )
        )
    }
}

extension ProjectModel.RelatedLink {
    func toDTO() -> ModifyStudentInformationRequestDTO.Project.Link {
        ModifyStudentInformationRequestDTO.Project.Link(
            name: name,
            url: url
        )
    }
}

extension PrizeModel {
    func toDTO() -> ModifyStudentInformationRequestDTO.Prize {
        ModifyStudentInformationRequestDTO.Prize(
            name: name,
            type: prize,
            date: prizeAtString
        )
    }
}

extension ProjectEntity {
    func toModel() -> ProjectModel {
        ProjectModel.init(
            name: name,
            iconImage: iconImageURL,
            previewImages: previewImageURLs,
            content: description,
            techStacks: Set(techStacks),
            mainTask: myActivity,
            startAt: inProgress.start.toDateCustomFormat(format: "yyyy.MM"),
            endAt: inProgress.end?.toDateCustomFormat(format: "yyyy.MM"),
            isInProgress: inProgress.end == nil,
            relatedLinks: links.map { $0.toModel() }
        )
    }
}

extension ProjectEntity.LinkEntity {
    func toModel() -> ProjectModel.RelatedLink {
        ProjectModel.RelatedLink.init(
            name: name,
            url: url
        )
    }
}

extension PrizeEntity {
    func toModel() -> PrizeModel {
        PrizeModel.init(
            name: name,
            prize: type,
            prizeAt: date.toDateCustomFormat(format: "yyyy.MM")
        )
    }
}

extension LanguageCertificateEntity {
    func toModel() -> LanguageModel {
        LanguageModel.init(
            name: name,
            score: score
        )
    }
}
