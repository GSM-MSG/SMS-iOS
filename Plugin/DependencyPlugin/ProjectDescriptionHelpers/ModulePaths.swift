import Foundation

// swiftlint: disable all
public enum ModulePaths {
    case feature(Feature)
    case domain(Domain)
    case core(Core)
    case shared(Shared)
}

public extension ModulePaths {
    enum Feature: String {
        case MainFeature
        case TechStackAppendFeature
        case StudentDetailFeature
        case InputInformationBaseFeature
        case RootFeature
        case InputLanguageInfoFeature
        case InputCertificateInfoFeature
        case InputMilitaryInfoFeature
        case InputWorkInfoFeature
        case InputSchoolLifeInfoFeature
        case InputProfileInfoFeature
        case InputInformationFeature
        case SigninFeature
        case BaseFeature

        func targetName(type: MicroTargetType) -> String {
            "\(self.rawValue)\(type.rawValue)"
        }
    }
}

public extension ModulePaths {
    enum Domain: String {
        case UserDomain
        case TechStackDomain
        case FileDomain
        case MajorDomain
        case StudentDomain
        case AuthDomain
        case BaseDomain

        func targetName(type: MicroTargetType) -> String {
            "\(self.rawValue)\(type.rawValue)"
        }
    }
}

public extension ModulePaths {
    enum Core: String {
        case EventLimiter
        case JwtStore
        case DesignSystem

        func targetName(type: MicroTargetType) -> String {
            "\(self.rawValue)\(type.rawValue)"
        }
    }
}

public extension ModulePaths {
    enum Shared: String {
        case Validator
        case FoundationUtil
        case ViewUtil
        case DateUtil
        case KeychainModule
        case UtilityModule
        case GlobalThirdPartyLibrary

        func targetName(type: MicroTargetType) -> String {
            "\(self.rawValue)\(type.rawValue)"
        }
    }
}

public enum MicroTargetType: String {
    case interface = "Interface"
    case sources = ""
    case testing = "Testing"
}
