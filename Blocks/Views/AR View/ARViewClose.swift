import SwiftUI

struct ARViewClose: View {
    @State var showInstructions = true
    @Binding var ARViewOn: Bool
    
    var body: some View {
        ZStack {
            ARViewWrapper()
            VStack {
                Spacer()
                Spacer()
                Button(action: {
                    ARViewOn.toggle()
                }) {
                    Text("Close")
                        .background(
                            RoundedRectangle(cornerRadius: 15)
                                .foregroundColor(.clear)
                                .frame(width: 70, height: 45)
                                .background(.ultraThinMaterial, in: RoundedRectangle(cornerRadius: 15))
                                .shadow(color: .black, radius: 8)
                        )
                        .frame(width: 60, height: 30)
                        .padding()
                }
                .padding()
                
            }
            
            if ARViewOn {
                if showInstructions {
                    Text("Move iPad to start")
                        .background(
                            RoundedRectangle(cornerRadius: 15)
                                .foregroundColor(.clear)
                                .frame(width: 160, height: 45)
                                .background(.ultraThinMaterial, in: RoundedRectangle(cornerRadius: 15))
                                .shadow(color: .black, radius: 8)
                        )
                        .animation(.default, value: showInstructions)
                        .onAppear {
                            Timer.scheduledTimer(withTimeInterval: 3, repeats: false) { timer in
                                withAnimation(.easeInOut(duration: 2)) {
                                    self.showInstructions.toggle()
                                }
                            }
                        }
                }
            }
        }
    }
}
