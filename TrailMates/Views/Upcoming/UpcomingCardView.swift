//
//  UpcomingCardView.swift
//  TrailMates
//
//  Created by Afga Ghifari on 21/04/25.
//

import SwiftUI

struct UpcomingCardView: View {
    let activity: ActivityModel

    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text("\(activity.date) at \(activity.time)")
                .font(.caption2)
                .foregroundColor(.secondary)
            
            HStack {
                Text(activity.title)
                    .font(.headline)
                    .foregroundColor(.primary)
                
                Spacer()
                
                Text(activity.category.uppercased())
                    .font(.caption)
                    .padding(.horizontal, 12)
                    .padding(.vertical, 6)
                    .background(Color.accentColor.opacity(0.1))
                    .foregroundStyle(.secondary)
                    .clipShape(Capsule())
            }
            
            HStack {
                Text(activity.location)
                    .font(.subheadline)
                    .foregroundColor(.secondary)
                
                Spacer()
                
                Image(systemName: "square.and.arrow.up")
                    .font(.body)
                    .foregroundColor(.accentColor)
                    .accessibilityLabel("Share \(activity.title)")
            }
        }
        .padding(16)
        .background(
            Color(.secondarySystemBackground),
            in: RoundedRectangle(cornerRadius: 12, style: .continuous)
        )
        .shadow(color: Color.black.opacity(0.05), radius: 4, x: 0, y: 2)
        .accessibilityElement(children: .combine)
    }
}

struct UpcomingCardView_Previews: PreviewProvider {
    static var previews: some View {
        UpcomingCardView(activity:
            ActivityModel(imageName: "",
                          title: "Morning Swim",
                          distance: 2.5,
                          category: "Swimming",
                          date: "Monday, Apr 28 2025",
                          time: "15.00 GMT +8",
                          contact: "0812987654321",
                          guests: 10,
                          location: "Happy pool",
                          locationImageName: ""
            )
        )
        .previewLayout(.sizeThatFits)
        .padding()
    }
}
