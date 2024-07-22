import SwiftUI
import SwiftData

struct ContentView: View {
    
    @Query private var friends : [Friend]
    @Environment(\.modelContext) private var context
    
    @State private var newName = ""
    @State private var newDate = Date.now
    
    var body: some View {
        List(friends) { friend in
            HStack {
                if friend.isBirthdayToday {
                    Image(systemName: "birthday.cake")
                }
                Text(friend.name)
                Spacer()
                Text(friend.birthday, format: .dateTime.month(.wide).day().year())
            }
        }
        .navigationTitle("BirthDays")
        .safeAreaInset(edge: .bottom) {
            VStack (alignment: .center, spacing: 20) {
                Text("New Birthday")
                    .font(.headline)
                DatePicker(selection: $newDate, in: Date.distantPast...Date.now, displayedComponents: .date) {
                    TextField("Name", text: $newName)
                        .textFieldStyle(.roundedBorder)
                }
                .padding()
                Button("Save") {
                    let newFriend = Friend(name: newName, birthday: newDate)
                    context.insert(newFriend)
                    
                    newName = ""
                    newDate = .now
                }
                .bold()
            }
            .padding()
            .background(.bar)
        }
    }
}


#Preview {
    MainActor.assumeIsolated {
        ContentView()
            .modelContainer(for : Friend.self, inMemory: true)
    }
}
