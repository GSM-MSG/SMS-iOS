import DateUtil
import SwiftUI
import ViewUtil

public extension View {
    func datePicker(
        isShowing: Binding<Bool>,
        completion: @escaping (Date) -> Void
    ) -> some View {
        self.smsBottomSheet(isShowing: isShowing) {
            BottomSheetYearMonthDatePickerView(isShowing: isShowing, completion: completion)
        }
    }
}

public struct BottomSheetYearMonthDatePickerView: View {
    @Binding var isShowing: Bool
    @Environment(\.dismiss) var dismiss
    @State var selectedYear = 0
    @State var selectedMonth = 0
    var completion: (Date) -> Void
    var currentYear: Int {
        Date().year
    }

    public init(
        isShowing: Binding<Bool>,
        completion: @escaping (Date) -> Void
    ) {
        self._isShowing = isShowing
        self.completion = completion
    }

    public var body: some View {
        VStack(spacing: 16) {
            HStack {
                SMSText("날짜선택", font: .title2)

                Spacer()

                SMSText("완료", font: .body2)
                    .foregroundColor(.sms(.primary(.p2)))
                    .buttonWrapper {
                        let year = selectedYear + currentYear - 10
                        let month = selectedMonth + 1
                        guard let date = DateComponents(calendar: .current, year: year, month: month).date else { return }
                        self.isShowing = false
                        self.completion(date)
                    }
            }

            HStack(spacing: 0) {
                Picker(selection: $selectedYear) {
                    ForEach(currentYear - 10 ..< currentYear + 1) { year in
                        SMSText("\(year)", font: .title1)
                    }
                } label: {
                    EmptyView()
                }

                Picker(selection: $selectedMonth) {
                    ForEach(1..<13) { month in
                        SMSText("\(month)", font: .title1)
                    }
                } label: {
                    EmptyView()
                }
            }
            .pickerStyle(.wheel)
        }
        .padding(.horizontal, 20)
    }
}
