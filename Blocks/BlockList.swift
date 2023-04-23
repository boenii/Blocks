import SwiftUI

class BlockList: ObservableObject {
    @Published var blocks = [
        Block(title: "WWDC", start: DateComponents(calendar: .current, year: 2023, month: 6, day: 5).date ?? Date(), end: DateComponents(calendar: .current, year: 2023, month: 6, day: 9).date ?? Date(), safedcal: false),
        Block(title: "Hike", start: DateComponents(calendar: .current, year: 2023, month: 7, day: 1).date ?? Date(), end: DateComponents(calendar: .current, year: 2023, month: 7, day: 5).date ?? Date(), safedcal: false),
    ].sorted(by: { $0.start < $1.start })
    
    private let dataFileURL: URL = {
        let documentsDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
        return documentsDirectory.appendingPathComponent("BlockList.json")
    }()
    
    init() {
        if let data = try? Data(contentsOf: dataFileURL) {
            if let savedList = try? JSONDecoder().decode([Block].self, from: data) {
                blocks = savedList
            }
        }
    }
    
    func save() {
        if let encodedData = try? JSONEncoder().encode(blocks) {
            try? encodedData.write(to: dataFileURL)
        }
    }
    
    func delete(at indexSet: IndexSet) {
        blocks.remove(atOffsets: indexSet)
        save()
    }
}

struct Block : Identifiable, Codable {
    var title : String
    var start : Date
    var end : Date
    var safedcal : Bool
    
    var id = UUID()
}
