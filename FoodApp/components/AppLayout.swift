
import SwiftUI

struct AppLayout<Header: View, Content: View>: View {

    let content: Content
    let header: Header

    var body: some View {

        GeometryReader { geometry in

            VStack(spacing: 0) {

                // Header
                header
                    .frame(maxWidth: .infinity)
                    .frame(height: 129)
                    .padding(.horizontal, 36)
                    .background(.yellowBase)

                // Main Content
                content
                    .frame(maxWidth: .infinity)
                    .frame(height: geometry.size.height - 129)
                    .background {
                        Color.whiteBase
                            .clipShape(
                                UnevenRoundedRectangle(
                                    topLeadingRadius: 30,
                                    topTrailingRadius: 30
                                )
                            )
                    }
            }
        }
        .frame(maxWidth: .infinity)
        .frame(maxHeight: .infinity)
        .background(.yellowBase)

        // Extend layout to the bottom of the screen,
        // including behind the keyboard.
        .ignoresSafeArea(
            [.container, .keyboard],
            edges: .bottom
        )
    }
}

#Preview {
    AppLayout(
        content: VStack {
            Text("Headers")
            Spacer()
        },
        header: Text("Header")
    )
}
