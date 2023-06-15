import SwiftUI

struct BackportContentUnavailableLabelStyle: LabelStyle {
    @ScaledMetric
    var scale: CGFloat = 1
    
    func makeBody(configuration: Configuration) -> some View {
        VStack(spacing: 19, content: {
            configuration.icon
                .scaledToFit()
                .frame(width: 48 * scale)
                .fontWeight(.bold)
                .foregroundStyle(.secondary)
                .dynamicTypeSize(.xSmall ... .accessibility2)
            
            configuration.title
                .font(.system(size: UIFontMetrics.default.scaledValue(for: 22), weight: .bold))
                .foregroundStyle(.primary)
                .dynamicTypeSize(.xSmall ... .accessibility2)
        })
    }
}

