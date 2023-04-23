import SwiftUI
struct AddBlock: View {
    @EnvironmentObject var data: BlockList
    @Binding var addBlock: Bool
    @State var newBlock: Block = Block(title: "", start: Date(), end: Date(), safedcal: Bool())
    @State private var errorMessage: String = ""
    
    var body: some View {
        VStack {
            HStack {
                Button(action: {
                    addBlock.toggle()
                }){
                    ZStack {
                        RoundedRectangle(cornerRadius: 15)
                            .frame(width: 70, height: 35)
                            .foregroundColor(.red)
                        Text("Cancel")
                            .foregroundColor(.white)
                    }
                    .padding([.horizontal, .top], 15)
                }
                Spacer()
                Button(action: {
                    let overlappingBlocks = data.blocks.filter { block in
                        newBlock.start < block.end && block.start < newBlock.end
                    }
                    if overlappingBlocks.isEmpty {
                        let block = Block(title: newBlock.title, start: newBlock.start, end: newBlock.end, safedcal: newBlock.safedcal)
                        data.blocks.append(block)
                        data.save()
                        addBlock.toggle()
                    } else {
                        let overlappingBlockTitles = overlappingBlocks.map { $0.title }.joined(separator: ", ")
                        errorMessage = "This period is already blocked by: \(overlappingBlockTitles)"
                    }
                }){
                    Text("Add")
                        .foregroundColor(.white)
                        .background(RoundedRectangle(cornerRadius: 15)
                            .frame(width: 70, height: 35)
                            .foregroundColor(.green)
                        )
                        .frame(width: 70, height: 30)
                        .padding([.horizontal, .top], 15)
                }
            }
            TextField("Title", text: $newBlock.title)
                .font(.title)
                .padding(.horizontal, 15)
                .foregroundColor(.white)
            DatePicker("Start", selection: $newBlock.start, displayedComponents: .date)
                .foregroundColor(.white)
                .padding(.horizontal, 15)
            DatePicker("End", selection: $newBlock.end, displayedComponents: .date)
                .foregroundColor(.white)
                .padding([.horizontal, .bottom], 15)
        }
        .frame(width: 250, height: 194)
        .foregroundColor(.clear)
        .background(.ultraThinMaterial, in: RoundedRectangle(cornerRadius: 25))
        .padding()
        .alert(isPresented: Binding<Bool>(get: { !errorMessage.isEmpty }, set: { _ in errorMessage = "" })) {
            Alert(title: Text("Sorry"), message: Text(errorMessage), dismissButton: .default(Text("OK")))
        }
    }
}
