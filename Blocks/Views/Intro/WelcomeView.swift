import SwiftUI

struct WelcomeView: View {
    @Binding var Welcome: Bool
    @Binding var AddingBlocks: Bool
    var body: some View {
        VStack {
            Text("Welcome to Blocks!")
                .font(.largeTitle)
                .padding(.top, 50)
            Spacer()
            Text("Blocks lets you see all \n your events at a glance.\n \n You can add new events \n and you will be notified if \n the selected period is\nalready blocked.")
                .font(.title2)
                .multilineTextAlignment(.center)
            Spacer()
            Button(action: {
                Welcome.toggle()
                AddingBlocks.toggle()
            }) {
                Image(systemName: "chevron.right.circle.fill")
                    .foregroundColor(.white)
                    .font(.largeTitle)
            }
            Spacer()
            Text("This Playground was created for \n the Swift Student Challange.")
                .multilineTextAlignment(.center)
                .padding(.bottom, 30)
                .font(.caption)
        }
    }
}
