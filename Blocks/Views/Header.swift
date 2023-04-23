import SwiftUI
struct Header: View {
    @Binding var addBlock: Bool
    @Binding var ARViewOn: Bool
    @Binding var showIntro: Bool
    var body: some View {
        HStack {
            Button(action: {
                ARViewOn.toggle()
            }) {
                Text("Blocks")
                    .foregroundColor(.white)
                    .background(
                        RoundedRectangle(cornerRadius: 15)
                            .foregroundColor(.yellow.opacity(0.7))
                            .frame(width: 70, height: 35)
                    )
                    .frame(width: 70, height: 35)
            }
            Spacer()
            Button(action: {
                showIntro.toggle()
            }) {
                Text(showIntro ? "Close" : "Intro")
                    .foregroundColor(.white)
                    .background(
                        RoundedRectangle(cornerRadius: 15)
                            .foregroundColor(showIntro ? .red : .blue.opacity(0.8))
                            .frame(width: 70, height: 35)
                    )
                    .frame(width: 70, height: 35)
                    .animation(.default, value: showIntro)
            }
        }
        .padding(.top, 25)
        .padding(.bottom, 10)
        .padding(.horizontal, 25)
        .background(.ultraThinMaterial)
    }
}
