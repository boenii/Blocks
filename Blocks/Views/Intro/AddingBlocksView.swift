import SwiftUI
import AVKit

struct AddingBlocksView: View {
    @Binding var Welcome: Bool
    @Binding var AddingBlocks: Bool
    @Binding var AlreadyBlocked: Bool
    
    let player = AVPlayer(url: Bundle.main.url(forResource: "AddBlocks", withExtension: "mov")!)
    var body: some View {
        VStack {
            Text("Add Blocks!")
                .font(.largeTitle)
                .padding(.top, 20)
            if AddingBlocks {
                VideoPlayer(player: player)
                    .frame(width: 250, height: 250)
                    .clipShape(RoundedRectangle(cornerRadius: 20))
                    .onAppear() {
                        player.play()
                    }
            }
            Spacer()
            Text("Add new Blocks by tapping the\nAdd button below, then edit\nthe title, start and end date.")
                .font(.title3)
                .multilineTextAlignment(.center)
            Spacer()
            HStack {
                Button(action: {
                    Welcome.toggle()
                    AddingBlocks.toggle()
                }) {
                    Image(systemName: "chevron.left.circle.fill")
                        .foregroundColor(.white)
                        .opacity(0.3)
                        .font(.largeTitle)
                }
                .padding(.bottom, 20)
                Button(action: {
                    AddingBlocks.toggle()
                    AlreadyBlocked.toggle()
                }) {
                    Image(systemName: "chevron.right.circle.fill")
                        .foregroundColor(.white)
                        .font(.largeTitle)
                }
                .padding(.bottom, 20)
            }
        }
    }
}
