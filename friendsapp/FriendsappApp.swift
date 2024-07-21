import SwiftUI
import SwiftData

@main
struct FriendsappApp: App {
    
    let modelContainer : ModelContainer
    
    init() {
        do {
            modelContainer = try ModelContainer(for: Friend.self)
        } catch {
            fatalError("Fooo!")
        }
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .modelContainer(for: Friend.self)
        }
    }
}
