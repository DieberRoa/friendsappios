import Foundation
import SwiftData

@Model
class Friend {
    let name : String
    let birthday : Date
    
    init(name: String, birthday: Date) {
        self.name = name
        self.birthday = birthday
    }
}

	
