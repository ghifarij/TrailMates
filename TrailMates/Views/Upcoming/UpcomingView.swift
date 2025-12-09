//
//  UpcomingView.swift
//  TrailMates
//
//  Created by Afga Ghifari on 16/04/25.
//

import SwiftUI

struct UpcomingView: View {
    @EnvironmentObject var store: MyActivityStore
    
    var body: some View {
        NavigationStack {
            ZStack {
                Color(.systemGray6)
                .ignoresSafeArea()
                
                ScrollView {
                    LazyVStack(spacing: 20) {
                        ForEach(store.activities) { activity in
                            NavigationLink (destination: ActivityDetailView(activity: activity)) {
                                UpcomingCardView(activity: activity)
                                    .padding(.horizontal)
                                    .shadow(color: Color.black.opacity(0.1), radius: 5, x: 0, y: 2)
                            }
                            .buttonStyle(.plain)
                        }
                    }
                    .padding(.vertical)
                }
                .navigationTitle("Upcoming")
            }
        }
    }
}

#Preview {
    let store = MyActivityStore()
    if let url = Bundle.main.url(forResource: "myActivities", withExtension: "json"),
       let data = try? Data(contentsOf: url),
       let decoded = try? JSONDecoder().decode([ActivityModel].self, from: data) {
        store.activities = decoded
    }
        
    return UpcomingView()
        .environmentObject(store)
}
