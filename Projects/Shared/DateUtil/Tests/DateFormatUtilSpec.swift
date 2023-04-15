import DateUtil
import Foundation
import Nimble
import Quick

final class DateFormatUtilSpec: QuickSpec {
    // swiftlint: disable function_body_length
    override func spec() {
        var mockDate: Date!

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

        describe("DateFormatUtil에서") {
            context("Date에 toISOString을 기본 options로 실행하면") {
                it("기본 yyyy-MM-dd'T'HH:mm:ss format 으로 Date가 String으로 변환된다.") {
                    let formattedDateString = mockDate.toISOString()
                    expect { formattedDateString }.to(equal("2023-01-01T01:10:10"))
                }
            }

            context("Date에 toISOString을 [.withFullDate] options로 실행하면") {
                it("yyyy-MM-dd format 으로 Date가 String으로 변환된다") {
                    let formattedDateString = mockDate.toISOString(options: .withFullDate)
                    expect { formattedDateString }.to(equal("2023-01-01"))
                }
            }

            context("Date에 toStringCustomFormat을 'yyyy-MM-ddTHH:mm:ss로 실행하면'") {
                it("yyyy-MM-ddTHH:mm:ss format 으로 Date가 String으로 변환된다") {
                    let formattedDateString = mockDate.toStringCustomFormat(format: "yyyy-MM-dd'T'HH:mm:ss")
                    expect { formattedDateString }.to(equal("2023-01-01T10:10:10"))
                }
            }

            context("String에 toISODate를 기본 options로 실행하면") {
                it("알맞은 format이라면 String을 Date로 변환시킨다") {
                    let formattedDate = "2023-01-01T10:10:10".toISODate(
                        timeZone: .init(identifier: "KST") ?? .current
                    )
                    expect { formattedDate.year }.to(equal(2023))
                    expect { formattedDate.month }.to(equal(1))
                    expect { formattedDate.day }.to(equal(1))
                    expect { formattedDate.hour }.to(equal(10))
                    expect { formattedDate.minute }.to(equal(10))
                    expect { formattedDate.second }.to(equal(10))
                }
            }

            context("String에 toISODate를 [.withFullDate] options로 실행하면") {
                it("알맞은 format이라면 String을 Date로 변환시킨다") {
                    let formattedDate = "2023-01-01T10:10:10".toISODate(
                        options: .withFullDate,
                        timeZone: .init(identifier: "KST") ?? .current
                    )
                    expect { formattedDate.year }.to(equal(2023))
                    expect { formattedDate.month }.to(equal(1))
                    expect { formattedDate.day }.to(equal(1))
                    expect { formattedDate.hour }.toNot(equal(10))
                    expect { formattedDate.minute }.toNot(equal(10))
                    expect { formattedDate.second }.toNot(equal(10))
                }
            }

            context("String에 toDateCustomFormat을 'yyyy-MM-ddTHH:mm:ss'로 실행하면") {
                it("yyyy-MM-ddTHH:mm:ss format 으로 String이 Date로 변환된다") {
                    let formattedDate = "2023-01-01T10:10:10".toDateCustomFormat(format: "yyyy-MM-dd'T'10:10:10")
                    expect { formattedDate.year }.to(equal(2023))
                    expect { formattedDate.month }.to(equal(1))
                    expect { formattedDate.day }.to(equal(1))
                    expect { formattedDate.hour }.toNot(equal(10))
                    expect { formattedDate.minute }.toNot(equal(10))
                    expect { formattedDate.second }.toNot(equal(10))
                }
            }
        }
    }
}
