import SwiftUI
import UIKit

struct BackportContentUnavailableButtonStyle: PrimitiveButtonStyle {
    @State var isPressed: Bool = false
    
    func makeBody(configuration: Configuration) -> some View {
        configuration
            .label
            .foregroundStyle(.tint)
            .font(.system(size: UIFontMetrics.default.scaledValue(for: 15)))
            .opacity(isPressed ? 0.5 : 1)
            ._onButtonGesture { isPressed in
                self.isPressed = isPressed
            } perform: {
                configuration.trigger()
            }
    }
}
