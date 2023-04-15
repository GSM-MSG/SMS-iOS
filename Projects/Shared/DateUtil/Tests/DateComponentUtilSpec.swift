import Foundation
import Nimble
import Quick

final class DateComponentUtilSpec: QuickSpec {
    override func spec() {
        var mockDate: Date!

        describe("DateComponentUtil에서") {
            beforeEach {
                let dateComponent = DateComponents(
                    year: 2023,
                    month: 1,
                    day: 1,
                    hour: 10,
                    minute: 10,
                    second: 10
                )
                mockDate = Calendar.current.date(from: dateComponent)
            }

            context("mockDate를 2023년 1월 1일 10시 10분 10초로 설정해놓으면") {
                it("mockDate.year는 2023이다") {
                    expect { mockDate.year }.to(equal(2023))
                }

                it("mockDate.month는 1이다") {
                    expect { mockDate.month }.to(equal(1))
                }

                it("mockDate.day는 1이다") {
                    expect { mockDate.day }.to(equal(1))
                }
                it("mockDate.hour는 1이다") {
                    expect { mockDate.hour }.to(equal(10))
                }
                it("mockDate.minute는 1이다") {
                    expect { mockDate.minute }.to(equal(10))
                }
                it("mockDate.second는 1이다") {
                    expect { mockDate.second }.to(equal(10))
                }
            }
        }
    }
}
