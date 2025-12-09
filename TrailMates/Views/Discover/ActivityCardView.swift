//
//  ActivityCardView.swift
//  TrailMates
//
//  Created by Afga Ghifari on 15/04/25.
//

import SwiftUI

struct ActivityCardView: View {
    let activity: ActivityModel

    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            // Image Section
            ZStack(alignment: .bottomLeading) {
                Group {
                    if activity.imageName.isEmpty {
                        Rectangle()
                            .fill(Color(.systemGray5))
                            .overlay {
                                Image(systemName: "photo")
                                    .font(.largeTitle)
                                    .foregroundStyle(.secondary)
                            }
                    } else {
                        Image(activity.imageName)
                            .resizable()
                            .scaledToFill()
                    }
                }
                .frame(height: 180)
                .clipShape(RoundedRectangle(cornerRadius: 12))
                .accessibilityHidden(true)
                
                // Guest Badge
                Label {
                    Text("\(activity.guests) \(activity.guests == 1 ? "Guest" : "Guests")")
                        .font(.caption)
                        .fontWeight(.medium)
                } icon: {
                    Image(systemName: "person.3.fill")
                        .symbolRenderingMode(.hierarchical)
                        .foregroundStyle(.tint)
                }
                .padding(8)
                .background(.ultraThinMaterial)
                .clipShape(RoundedRectangle(cornerRadius: 8))
                .padding(12)
            }
            
            // Content Section
            VStack(alignment: .leading, spacing: 12) {
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
                
                HStack {
                    Label {
                        Text("\(activity.distance, specifier: "%.1f") km away")
                            .font(.subheadline)
                    } icon: {
                        Image(systemName: "location.fill")
                            .symbolRenderingMode(.hierarchical)
                            .foregroundStyle(.tint)
                    }
                    
                    Spacer()
                    
                    Label {
                        Text(activity.date)
                            .font(.subheadline)
                    } icon: {
                        Image(systemName: "calendar")
                            .symbolRenderingMode(.hierarchical)
                            .foregroundStyle(.tint)
                    }
                }
                
                Label {
                    Text(activity.location)
                        .font(.subheadline)
                        .lineLimit(1)
                } icon: {
                    Image(systemName: "map.fill")
                        .symbolRenderingMode(.hierarchical)
                        .foregroundStyle(.tint)
                }
            }
            .padding(.horizontal, 4)
        }
        .padding()
        .background(Color(.secondarySystemBackground))
        .clipShape(RoundedRectangle(cornerRadius: 16))
        .accessibilityElement(children: .combine)
        .accessibilityLabel("Activity: \(activity.title), \(activity.category), \(activity.distance) kilometers away, on \(activity.date), at \(activity.location)")
    }
}

struct ActivityCardView_Previews: PreviewProvider {
    static var previews: some View {
        ActivityCardView(activity:
            ActivityModel(
                imageName: "",
                title: "Sunset Surf Session",
                distance: 5.8,
                category: "Surfing",
                date: "Friday, Apr 25 2025",
                time: "09.00 GMT +8",
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
