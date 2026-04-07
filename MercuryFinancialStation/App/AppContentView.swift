import SwiftUI
import SwiftData

struct AppContentView: View {
    private let modelContainer: ModelContainer = {
        let schema = Schema([
            StationState.self,
            TransactionRecord.self,
            ShiftDaySummary.self
        ])
        let configuration = ModelConfiguration("MercuryFinancialStation")
        do {
            return try ModelContainer(for: schema, configurations: [configuration])
        } catch {
            fatalError("Failed to create SwiftData container: \(error)")
        }
    }()
    
    var body: some View {
        ContentView()
            .preferredColorScheme(.dark)
            .modelContainer(modelContainer)
    }
}
