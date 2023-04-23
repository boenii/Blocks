import SwiftUI
import EventKit

struct Blocks: View {
    @EnvironmentObject var data: BlockList
    
    let dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "dd. MMMM"
        return formatter
    }()
    
    var sortedBlocks: [Block] {
        data.blocks.sorted { $0.start < $1.start }
    }
    
    var body: some View {
        HStack {
            Spacer(minLength: 25)
            VStack {
                ForEach(sortedBlocks.indices, id: \.self) { index in
                    let block = sortedBlocks[index]
                    ZStack {
                        RoundedRectangle(cornerRadius: 25)
                            .foregroundColor(.clear)
                            .background(.ultraThinMaterial, in: RoundedRectangle(cornerRadius: 25))
                        VStack {
                            ZStack {
                                Text(dateFormatter.string(from: block.start))
                                    .padding()
                                HStack {
                                    if !block.safedcal {
                                        Button(action: {
                                            let eventStore = EKEventStore()
                                            eventStore.requestAccess(to: .event) { (granted, error) in
                                                if let error = error {
                                                    print("Error requesting access to calendar: \(error.localizedDescription)")
                                                    return
                                                }
                                                if granted {
                                                    let newEvent = EKEvent(eventStore: eventStore)
                                                    newEvent.title = block.title
                                                    newEvent.startDate = block.start
                                                    newEvent.endDate = block.end
                                                    newEvent.calendar = eventStore.defaultCalendarForNewEvents
                                                    newEvent.isAllDay = true
                                                    do {
                                                        try eventStore.save(newEvent, span: .thisEvent)
                                                        DispatchQueue.main.async {
                                                            if let indexInData = data.blocks.firstIndex(where: { $0.id == block.id }) {
                                                                data.blocks[indexInData].safedcal = true
                                                                data.save()
                                                            }
                                                        }
                                                    } catch {
                                                        print("Error saving event: \(error.localizedDescription)")
                                                    }
                                                } else {
                                                    print("Access to calendar was not granted")
                                                }
                                            }
                                        }){
                                            Image(systemName: "calendar.badge.plus")
                                                .font(.title3)
                                                .foregroundColor(.white)
                                                .padding(15)
                                        }
                                    } else {
                                        Image(systemName: "checkmark")
                                            .font(.title3)
                                            .foregroundColor(.white)
                                            .padding(15)
                                    }
                                    Spacer()
                                    Button(action: {
                                        data.blocks.remove(at: index)
                                        data.save()
                                    }){
                                        Image(systemName: "trash")
                                            .font(.title3)
                                            .foregroundColor(.white)
                                            .padding(15)
                                    }
                                }
                            }
                            Spacer()
                            Text(block.title)
                                .font(.title)
                            Spacer()
                            Text(dateFormatter.string(from: block.end))
                                .padding()
                        }
                        
                    }
                }
            }
            Spacer(minLength: 25)
        }
        .padding(.top, 10)
    }
}
