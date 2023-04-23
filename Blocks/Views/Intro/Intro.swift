import SwiftUI

struct Intro: View {
    @State var Welcome = true
    @State var AddingBlocks = false
    @State var AlreadyBlocked = false
    @State var AddCalendar = false
    @State var OneMoreThing = false
    @Binding var showIntro: Bool
    @Binding var firstIntro: Bool
    
    var body: some View {
        VStack {
            ZStack {
                WelcomeView(Welcome: $Welcome, AddingBlocks: $AddingBlocks)
                    .opacity(Welcome ? 1 : 0)
                    .animation(Welcome ? .default.delay(0.3) : .default, value: Welcome)
                
                AddingBlocksView(Welcome: $Welcome, AddingBlocks: $AddingBlocks, AlreadyBlocked: $AlreadyBlocked)
                    .opacity(AddingBlocks ? 1 : 0)
                    .animation(AddingBlocks ? .default.delay(0.3) : .default, value: AddingBlocks)
                
                AlreadyBlockedView(AddingBlocks: $AddingBlocks, AlreadyBlocked: $AlreadyBlocked, AddCalendar: $AddCalendar)
                    .opacity(AlreadyBlocked ? 1 : 0)
                    .animation(AlreadyBlocked ? .default.delay(0.3) : .default, value: AlreadyBlocked)
                
                AddCalendarView(AlreadyBlocked: $AlreadyBlocked, AddCalendar: $AddCalendar, OneMoreThing: $OneMoreThing)
                    .opacity(AddCalendar ? 1 : 0)
                    .animation(AddCalendar ? .default.delay(0.3) : .default, value: AddCalendar)
                
                OneMoreThingView(Welcome: $Welcome ,AddCalendar: $AddCalendar, OneMoreThing: $OneMoreThing, showIntro: $showIntro, firstIntro: $firstIntro)
                    .opacity(OneMoreThing ? 1 : 0)
                    .animation(OneMoreThing ? .default.delay(0.3) : .default, value: OneMoreThing)
            }            
        }
        .frame(width: 335, height: 500)
        .background(RoundedRectangle(cornerRadius: 25)
            .foregroundColor(.black)
            .opacity(0.4)
            .frame(width: 335, height: 500)
            .background(.thinMaterial, in:RoundedRectangle(cornerRadius: 25))
            .shadow(color: .black, radius: 15)
        )
        .offset(y: -30)
    }
}
