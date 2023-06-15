import SwiftUI

public struct BackportContentUnavailableView<Label: View, Description: View, Actions: View>: View {
    
    let label: () -> Label
    let description: () -> Description
    let actions: () -> Actions
    
    public init(
        @ViewBuilder label: @escaping () -> Label,
        @ViewBuilder description: @escaping () -> Description,
        @ViewBuilder actions: @escaping () -> Actions
    ) {
        self.label = label
        self.description = description
        self.actions = actions
    }

    public var body: some View {
        VStack(spacing: 20) {
            Spacer()
            VStack(spacing: 3) {
                label()
                    .labelStyle(BackportContentUnavailableLabelStyle())
                
                description()
                    .font(.system(size: UIFontMetrics.default.scaledValue(for: 15)))
                    .multilineTextAlignment(.center)
                    .foregroundStyle(.secondary)
                    .dynamicTypeSize(.xSmall ... .accessibility2)
            }
            actions()
                .buttonStyle(BackportContentUnavailableButtonStyle())
            Spacer()
        }.offset(y: -2)
    }
}

extension BackportContentUnavailableView where Label == SwiftUI.Label<Text, Image>, Description == Text?, Actions == EmptyView {
    
    public init(_ title: LocalizedStringKey, image name: String, description: Text? = nil) {
        self.init {
            SwiftUI.Label {
                Text(title)
            } icon: {
                Image(name).resizable()
            }
        } description: {
            description
        } actions: {
            EmptyView()
        }
    }
    
    public init(_ title: LocalizedStringKey, systemImage name: String, description: Text? = nil) {
        self.init {
            SwiftUI.Label {
                Text(title)
            } icon: {
                Image(systemName: name).resizable()
            }
        } description: {
            description
        } actions: {
            EmptyView()
        }
    }
    
    public init<S>(_ title: S, image name: String, description: Text? = nil) where S : StringProtocol {
        self.init {
            SwiftUI.Label {
                Text(title)
            } icon: {
                Image(systemName: name).resizable()
            }
        } description: {
            description
        } actions: {
            EmptyView()
        }
    }
    
    public init<S>(_ title: S, systemImage name: String, description: Text? = nil) where S : StringProtocol {
        self.init {
            SwiftUI.Label {
                Text(title)
            } icon: {
                Image(systemName: name).resizable()
            }
        } description: {
            description
        } actions: {
            EmptyView()
        }
    }
}

