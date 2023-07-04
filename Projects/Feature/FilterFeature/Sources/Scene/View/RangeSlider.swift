import Foundation
import SwiftUI
import DesignSystem

public struct RangedSliderView: View {
    @Binding var minValue: Int
    @Binding var maxValue: Int
    let sliderBounds: ClosedRange<Int>
    let betweenValue: Int

    public init(
        minValue: Binding<Int>,
        maxValue: Binding<Int>,
        bounds: ClosedRange<Int>,
        betweenValue: Int
    ) {
        self._minValue = minValue
        self._maxValue = maxValue
        self.sliderBounds = bounds
        self.betweenValue = betweenValue
    }

    public var body: some View {
        GeometryReader { geometry in
            sliderView(sliderSize: geometry.size)
        }
    }

    @ViewBuilder
    private func sliderView(sliderSize: CGSize) -> some View {
        let sliderViewYCenter = sliderSize.height / 2
        ZStack {
            RoundedRectangle(cornerRadius: 2)
                .fill(Color.sms(.neutral(.n10)))
                .frame(height: 4)

            ZStack {
                let sliderBoundDifference = sliderBounds.count
                let stepWidthInPixel = CGFloat(sliderSize.width) / CGFloat(sliderBoundDifference)

                let leftThumbLocation: CGFloat = CGFloat(
                    Float(minValue) - Float(sliderBounds.lowerBound)
                ) * stepWidthInPixel

                let rightThumbLocation = CGFloat(Float(maxValue) - Float(sliderBounds.lowerBound)) * stepWidthInPixel

                lineBetweenThumbs(
                    left: .init(x: leftThumbLocation, y: sliderViewYCenter),
                    right: .init(x: rightThumbLocation, y: sliderViewYCenter)
                )

                let leftThumbPoint = CGPoint(x: leftThumbLocation, y: sliderViewYCenter)
                thumbView(position: leftThumbPoint, value: Float(minValue))
                    .highPriorityGesture(DragGesture().onChanged { dragValue in
                        let dragLocation = dragValue.location
                        let xThumbOffset = min(max(0, dragLocation.x), sliderSize.width)

                        let newValue = sliderBounds.lowerBound + Int(xThumbOffset / stepWidthInPixel)

                        if newValue < maxValue {
                            minValue = newValue + betweenValue < maxValue ? newValue : maxValue - betweenValue
                        }
                    })

                thumbView(position: CGPoint(x: rightThumbLocation, y: sliderViewYCenter), value: Float(maxValue))
                    .highPriorityGesture(DragGesture().onChanged { dragValue in
                        let dragLocation = dragValue.location
                        let xThumbOffset = min(max(CGFloat(leftThumbLocation), dragLocation.x), sliderSize.width)

                        var newValue = Int(xThumbOffset / stepWidthInPixel)
                        newValue = min(newValue, sliderBounds.upperBound)
                        print(newValue)

                        if newValue > minValue {
                            maxValue = newValue - betweenValue > minValue ? newValue : minValue + betweenValue
                        }
                    })
            }
        }
    }

    @ViewBuilder func lineBetweenThumbs(left: CGPoint, right: CGPoint) -> some View {
        Path { path in
            path.move(to: left)
            path.addLine(to: right)
        }
        .stroke(Color.sms(.primary(.p2)), lineWidth: 2)
    }

    @ViewBuilder func thumbView(position: CGPoint, value: Float) -> some View {
        ZStack {
            Circle()
                .strokeBorder(Color.sms(.primary(.p2)), lineWidth: 2)
                .frame(width: 24, height: 24)
                .background(Circle().foregroundColor(Color.sms(.system(.white))))
        }
        .position(x: position.x, y: position.y)
    }
}
