//
//  TrailMatesApp.swift
//  TrailMates
//
//  Created by Afga Ghifari on 15/04/25.
//

import SwiftUI
import SwiftData

@main
struct TrailMatesApp: App {
    @StateObject private var activityStore = ActivityStore()
    @StateObject private var myActivityStore = MyActivityStore()
    
    var body: some Scene {
        WindowGroup {
            TabView {
                DiscoverView()
                    .environmentObject(activityStore)
                    .tabItem {
                        Label("Discover", systemImage: "magnifyingglass")
                    }
                    .tag(0)
                ManageView()
                    .environmentObject(myActivityStore)
                    .tabItem {
                        Label("Manage", systemImage: "square.and.pencil")
                    }
                    .tag(1)
                UpcomingView()
                    .environmentObject(myActivityStore)
                    .tabItem {
                        Label("Upcoming", systemImage: "list.bullet.rectangle.portrait")
                    }
                    .tag(2)
            }
        }
    }
}
