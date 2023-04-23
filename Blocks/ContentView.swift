import SwiftUI

struct ContentView: View {
    @StateObject var blockList = BlockList()
    @State var addBlock = false
    @State var ARViewOn = false
    @State var showIntro = false
    @State private var firstIntro = !UserDefaults.standard.bool(forKey: "hasAppBeenOpenedBefore")
    @State private var keyboardHeight: CGFloat = 0
    var body: some View {
        ZStack {
            VStack {
                Header(addBlock: $addBlock, ARViewOn: $ARViewOn, showIntro: $showIntro)
                ZStack {
                    if showIntro || firstIntro {
                        VStack {
                            Spacer()
                            Intro(showIntro: $showIntro, firstIntro: $firstIntro)
                            Spacer()
                        }    
                    }
                    else
                    {
                        ScrollView {
                            Blocks()
                        }
                    }
                    VStack {
                        Spacer()
                        ZStack {
                            AddButton(addBlock: $addBlock)
                            AddBlock(addBlock: $addBlock)
                                .opacity(addBlock ? 1 : 0)
                                .animation(.easeIn, value: addBlock)
                                .padding()
                                .offset(y: -keyboardHeight)
                        }    
                    }
                }
                .animation(.default, value: showIntro || firstIntro)
            }
            if ARViewOn {
                ARViewClose(ARViewOn: $ARViewOn)
            }
        }
        .background(
            Image("Background")
                .resizable()
                .scaledToFill()
        )
        .ignoresSafeArea()
        .environmentObject(blockList)
        .onAppear {
            NotificationCenter.default.addObserver(forName: UIResponder.keyboardWillShowNotification, object: nil, queue: .main) { notification in
                guard let keyboardFrame = notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? CGRect else { return }
                keyboardHeight = keyboardFrame.height
            }
            NotificationCenter.default.addObserver(forName: UIResponder.keyboardWillHideNotification, object: nil, queue: .main) { _ in
                keyboardHeight = 0
            }
        }
        .onDisappear {
            NotificationCenter.default.removeObserver(self)
        }
    }
}
