@ViewBuilder
private func areaList(areas: [Area]) -> some View {
    LazyVStack(spacing: 16) {
        ForEach(uiModel.areas, id: \.title) { area in
            HStack(spacing: 16) {
                SMSText(area.title, font: .title1)

                Spacer()

                SMSIcon(.downChevron)
                    .rotationEffect(false ? .degrees(90) : .degrees(0))
                    .buttonWrapper {
                    }

                SMSIcon(.xmarkOutline)
                    .buttonWrapper {
                    }
            }

            sectionList(sections: area.sections)
        }
    }
    .padding(20)
}
