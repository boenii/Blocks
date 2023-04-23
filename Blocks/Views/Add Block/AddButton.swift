import SwiftUI
struct AddButton: View {
    @Binding var addBlock: Bool
    var body: some View {
        VStack {
            Spacer()
            Button(action: {
                addBlock.toggle()
            }) {
                Text("Add")
                    .background(
                        RoundedRectangle(cornerRadius: 10)
                            .foregroundColor(.clear)
                            .frame(width: 70, height: 45)
                            .background(.ultraThinMaterial, in: RoundedRectangle(cornerRadius: 15))
                            .shadow(color: .black, radius: 8)
                                
                    )
                    .opacity(addBlock ? 0:1)
                    .animation(.default, value: addBlock)
                    .frame(height: 30)
                    .padding()
            }
        }
        .frame(height: 194)
    }
}
