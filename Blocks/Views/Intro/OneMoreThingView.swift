import SwiftUI

struct OneMoreThingView: View {
    @Binding var Welcome: Bool
    @Binding var AddCalendar: Bool
    @Binding var OneMoreThing: Bool
    @Binding var showIntro: Bool
    @Binding var firstIntro: Bool
    
    var body: some View {
        VStack {
            Text("One More Thing...")
                .font(.largeTitle)
                .padding(.top, 50)
            Spacer()
            Text("Press the 'Blocks' Button\non the top left to see\nsome Blocks in AR.")
                .font(.title2)
                .multilineTextAlignment(.center)
            
            Spacer()
            HStack {
                Button(action: {
                    AddCalendar.toggle()
                    OneMoreThing.toggle()
                }) {
                    Image(systemName: "chevron.left.circle.fill")
                        .foregroundColor(.white)
                        .opacity(0.3)
                        .font(.largeTitle)
                }
                .padding(.bottom, 20)
                Button(action: {
                    Welcome.toggle()
                    OneMoreThing.toggle()
                    if showIntro {
                        showIntro.toggle()
                    }
                    else
                    {
                        firstIntro = false
                        UserDefaults.standard.set(true, forKey: "hasAppBeenOpenedBefore")
                    }
                }) {
                    Image(systemName: "checkmark.circle.fill")
                        .foregroundColor(.white)
                        .font(.largeTitle)
                }
                .padding(.bottom, 20)
            }
        }
    }
}

