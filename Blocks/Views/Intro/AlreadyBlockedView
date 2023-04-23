import SwiftUI

struct AlreadyBlockedView: View {
    @Binding var AddingBlocks: Bool
    @Binding var AlreadyBlocked: Bool
    @Binding var AddCalendar: Bool
    
    var body: some View {
        VStack {
            Text("Already Blocked?")
                .font(.largeTitle)
                .padding(.top, 20)
            Spacer()
            if AlreadyBlocked {
                Image("AlreadyBlocked")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 270)
                    .clipShape(RoundedRectangle(cornerRadius: 25))
            }
            Spacer()
            Text("If the selected period\nis already blocked, you will\nbe notified of this.")
                .font(.title3)
                .multilineTextAlignment(.center)
            Spacer()
            HStack {
                Button(action: {
                    AddingBlocks.toggle()
                    AlreadyBlocked.toggle()
                }) {
                    Image(systemName: "chevron.left.circle.fill")
                        .foregroundColor(.white)
                        .opacity(0.3)
                        .font(.largeTitle)
                }
                .padding(.bottom, 20)
                Button(action: {
                    AlreadyBlocked.toggle()
                    AddCalendar.toggle()
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
