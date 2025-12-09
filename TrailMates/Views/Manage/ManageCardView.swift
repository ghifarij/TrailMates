//
//  ManageCardView.swift
//  TrailMates
//
//  Created by Afga Ghifari on 17/04/25.
//


import SwiftUI

struct ManageCardView: View {
    let activity: ActivityModel

    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            HStack {
                Text(activity.title)
                    .font(.headline)
                Spacer()
                Text(activity.category.uppercased())
                    .font(.caption)
                    .padding(.horizontal, 12)
                    .padding(.vertical, 6)
                    .background(Color.accentColor.opacity(0.1))
                    .foregroundStyle(.secondary)
                    .clipShape(Capsule())
            }
            Divider()
        }
        .padding()
        .background(Color(.secondarySystemBackground))
        .clipShape(RoundedRectangle(cornerRadius: 12))
        .accessibilityElement(children: .combine)
        .accessibilityLabel("Activity: \(activity.title), \(activity.category), \(activity.date) at \(activity.time), \(activity.location), \(activity.guests) guests")
    }
}

struct ManageCardView_Previews: PreviewProvider {
    static var previews: some View {
        ManageCardView(activity:
            ActivityModel(
                imageName: "",
                title: "Sunset Surf Session",
                distance: 5.8,
                category: "Surfing",
                date: "Friday, Apr 25 2025",
                time: "09.00 GMT+8",
                contact: "08123456789",
                guests: 8,
                location: "Kuta Beach",
                locationImageName: ""
            )
        )
        .previewLayout(.sizeThatFits)
        .padding()
    }
}
