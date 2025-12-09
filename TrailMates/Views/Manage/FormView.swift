//
//  FormView.swift
//  TrailMates
//
//  Created by Afga Ghifari on 21/04/25.
//

import SwiftUI

struct FormView: View {
    var onSave: (ActivityModel) -> Void
    @Environment(\.dismiss) private var dismiss

    @State private var imageName = ""
    @State private var title = ""
    @State private var distanceText = ""
    @State private var category = ""
    @State private var date = ""
    @State private var time = ""
    @State private var contact = ""
    @State private var guestsText = ""
    @State private var location = ""
    @State private var locationImageName = ""

    var body: some View {
        NavigationStack {
            Form {
                Section("Image") {
                    TextField("Asset name (optional)", text: $imageName)
                }
                Section("Title & Category") {
                    TextField("Title", text: $title)
                    TextField("Category", text: $category)
                }
                Section("When & Where") {
                    TextField("Date (e.g. Saturday, May 3 2025)", text: $date)
                    TextField("Time (e.g. 06:30 GMT+8)", text: $time)
                    TextField("Location", text: $location)
                }
                Section("Location Image") {
                    TextField("Location asset name (optional)", text: $locationImageName)
                }
                Section("Details") {
                    TextField("Distance (km)", text: $distanceText)
                        .keyboardType(.decimalPad)
                    TextField("Contact", text: $contact)
                        .keyboardType(.phonePad)
                    TextField("Max guests", text: $guestsText)
                        .keyboardType(.numberPad)
                }
            }
            .navigationTitle("New Activity")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .cancellationAction) {
                    Button("Cancel") { dismiss() }
                }
                ToolbarItem(placement: .confirmationAction) {
                    Button("Save") {
                        
                        let distance = Float(distanceText) ?? 0
                        let guests = Int(guestsText) ?? 0
                        let new = ActivityModel(
                            imageName: imageName,
                            title: title,
                            distance: distance,
                            category: category,
                            date: date,
                            time: time,
                            contact: contact,
                            guests: guests,
                            location: location,
                            locationImageName: locationImageName
                        )
                        onSave(new)
                    }
                    .disabled(title.isEmpty || category.isEmpty)
                }
            }
        }
    }
}
#Preview {
    FormView { newActivity in
        print("Preview Saved: \(newActivity)")
    }
}

