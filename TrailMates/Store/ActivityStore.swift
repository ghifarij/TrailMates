import Foundation

final class ActivityStore: ObservableObject {
    @Published var activities: [ActivityModel] = [] {
        didSet { saveToDocuments() }
    }
    
    private let fileName = "initialActivities.json"
    
    init() {
        loadFromBundle()
        saveToDocuments()
    }
    
    // MARK: – Bundle Loader
    private func loadFromBundle() {
        guard let url = Bundle.main.url(forResource: "initialActivities", withExtension: "json"),
              let data = try? Data(contentsOf: url),
              let decoded = try? JSONDecoder().decode([ActivityModel].self, from: data)
        else { return }
        
        activities = decoded
    }
    
    // MARK: – Documents Loader/Saver
    @discardableResult
    private func loadFromDocuments() -> Bool {
        let url = documentsDirectory.appendingPathComponent(fileName)
        guard FileManager.default.fileExists(atPath: url.path),
              let data = try? Data(contentsOf: url),
              let decoded = try? JSONDecoder().decode([ActivityModel].self, from: data)
        else { return false }
        
        activities = decoded
        return true
    }
    
    private func saveToDocuments() {
        let url = documentsDirectory.appendingPathComponent(fileName)
        guard let data = try? JSONEncoder().encode(activities) else { return }
        try? data.write(to: url, options: .atomic)
    }
    
    private var documentsDirectory: URL {
        FileManager.default
            .urls(for: .documentDirectory, in: .userDomainMask)[0]
    }
}
