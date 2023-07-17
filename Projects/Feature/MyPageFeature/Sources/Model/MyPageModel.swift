import Foundation

final class MyPageModel: ObservableObject, MyPageStateProtocol {}

extension MyPageModel: MyPageActionProtocol {}
