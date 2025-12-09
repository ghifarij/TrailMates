//
//  MyActivityStore.swift
//  TrailMates
//
//  Created by Afga Ghifari on 17/04/25.
//

import Foundation

final class MyActivityStore: ObservableObject {
    @Published var activities: [ActivityModel] = [] {
        didSet { saveToDocuments() }
    }
    
    private let fileName = "myActivities.json"
    
    init() {
        loadFromBundle()
        saveToDocuments()
    }

    
    func add(_ activity: ActivityModel) {
        activities.append(activity)
    }
    
    func remove(at offsets: IndexSet) {
        activities.remove(atOffsets: offsets)
    }
    
    // MARK: – Bundle Loader
    private func loadFromBundle() {
        guard let url = Bundle.main.url(forResource: "myActivities", withExtension: "json"),
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
