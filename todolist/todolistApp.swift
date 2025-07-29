import SwiftUI
import SwiftData

@main
struct todolistApp: App {
    
    @StateObject var listViewModel: ListViewModel =  ListViewModel()
    
    var body: some Scene {
        WindowGroup {
            NavigationView {
                ListView()
            }.environmentObject(listViewModel)
        }
    }
}

