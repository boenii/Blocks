import SwiftUI
import AVKit

struct AddCalendarView: View {
    @Binding var AlreadyBlocked: Bool
    @Binding var AddCalendar: Bool
    @Binding var OneMoreThing: Bool
    
    let player = AVPlayer(url: Bundle.main.url(forResource: "AddCalendar", withExtension: "mov")!)
    var body: some View {
        VStack {
            Text("Adding to Calendar")
                .font(.largeTitle)
                .padding(.top, 20)
            if AddCalendar {
                VideoPlayer(player: player)
                    .frame(width: 250, height: 112.5)
                    .clipShape(RoundedRectangle(cornerRadius: 20))
                    .onAppear() {
                        player.play()
                    }
            }
            Spacer()
            Text("Add Blocks to the Calendar\nwith just one click.")
                .font(.title3)
                .multilineTextAlignment(.center)
            Spacer()
            Image("Calendar")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 250)
                .clipShape(RoundedRectangle(cornerRadius: 20))
            Spacer()
            HStack {
                Button(action: {
                    AlreadyBlocked.toggle()
                    AddCalendar.toggle()
                }) {
                    Image(systemName: "chevron.left.circle.fill")
                        .foregroundColor(.white)
                        .opacity(0.3)
                        .font(.largeTitle)
                }
                .padding(.bottom, 20)
                Button(action: {
                    AddCalendar.toggle()
                    OneMoreThing.toggle()
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

