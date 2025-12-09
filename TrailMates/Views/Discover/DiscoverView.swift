//
//  Discover.swift
//  TrailMates
//
//  Created by Afga Ghifari on 11/04/25.
//

import SwiftUI
import SwiftData

struct DiscoverView: View {
    @EnvironmentObject var store: ActivityStore
    @State private var searchTerm = ""
    
    var filteredActivities: [ActivityModel] {
        if searchTerm.isEmpty {
            return store.activities
        } else {
            return store.activities.filter { activity in
                activity.title.localizedCaseInsensitiveContains(searchTerm) ||
                activity.category.localizedCaseInsensitiveContains(searchTerm) ||
                activity.location.localizedCaseInsensitiveContains(searchTerm)
            }
        }
    }
    
    var body: some View {
        NavigationStack {
            ZStack {
                Color(.systemGray6)
                .ignoresSafeArea()
                
                ScrollView {
                    LazyVStack(spacing: 20) {
                        ForEach(filteredActivities) { activity in
                            NavigationLink(destination: ActivityDetailView(activity: activity)) {
                                ActivityCardView(activity: activity)
                                    .padding(.horizontal)
                                    .shadow(color: Color.black.opacity(0.1), radius: 5, x: 0, y: 2)
                            }
                            .buttonStyle(.plain)
                        }
                    }
                    .padding(.vertical)
                }
                .navigationTitle("Discover")
                .searchable(text: $searchTerm, prompt: "Title, Category, or Location")
            }
        }
    }
}

#Preview {
    let store = ActivityStore()
    
    if let url = Bundle.main.url(forResource: "initialActivities", withExtension: "json"),
       let data = try? Data(contentsOf: url),
       let decoded = try? JSONDecoder().decode([ActivityModel].self, from: data) {
        store.activities = decoded
    }
    
    return DiscoverView()
        .environmentObject(store)
}
