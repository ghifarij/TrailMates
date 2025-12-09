//
//  ManageView.swift
//  TrailMates
//
//  Created by Afga Ghifari on 17/04/25.
//

//
//  Discover.swift
//  TrailMates
//
//  Created by Afga Ghifari on 11/04/25.
//

import SwiftUI
import SwiftData

struct ManageView: View {
    @EnvironmentObject var store: MyActivityStore
    @State private var showingCreateForm = false
    
    var body: some View {
        NavigationStack {
            ZStack {
                Color(.systemGray6)
                .ignoresSafeArea()
                
                List {
                        ForEach(store.activities) { activity in
                            Section {
                                NavigationLink {
                                    ActivityDetailView(activity: activity)
                                } label: {
                                    ManageCardView(activity: activity)
                                }
                            }
                            .listRowInsets(.init())
                            .listRowSeparator(.hidden)
                            .listRowBackground(Color.clear)
                        }
                        .onDelete(perform: store.remove)
                }
                
                .scrollContentBackground(.hidden)
                .listSectionSpacing(12)
                .navigationTitle("Manage")
                .toolbar {
                    Button {
                        showingCreateForm = true
                    } label: {
                        Image(systemName: "plus")
                    }
                }
                
                .sheet(isPresented: $showingCreateForm) {
                    FormView { newActivity in
                        store.add(newActivity)
                        showingCreateForm = false
                    }
                }
            }
        }
    }
}



#Preview {
    let store = MyActivityStore()
    
    if
        let url = Bundle.main.url(forResource: "myActivities", withExtension: "json"),
        let data = try? Data(contentsOf: url),
        let decoded = try? JSONDecoder().decode([ActivityModel].self, from: data)
    {
        store.activities = decoded
    }
    
    return ManageView()
        .environmentObject(store)
}

