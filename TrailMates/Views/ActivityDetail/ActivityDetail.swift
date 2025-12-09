//
//  ActivityDetail.swift
//  TrailMates
//
//  Created by Afga Ghifari on 15/04/25.
//

import SwiftUI

struct ActivityDetailView: View {
    @State private var isJoined: Bool = false
    let activity: ActivityModel
    
    // MARK: - View
    var body: some View {
        ScrollView {
            VStack(spacing: 20) {
                headerView
                
                activityInfoSection
                
                locationSection
                
                joinButton
            }
            .padding()
        }
        .navigationTitle("Activity Details")
        .navigationBarTitleDisplayMode(.inline)
        .background(Color(.systemGroupedBackground))
    }
    
    // MARK: - Header
    private var headerView: some View {
        ZStack(alignment: .bottomLeading) {
            Group {
                if activity.imageName.isEmpty {
                    Rectangle()
                        .fill(Color(.systemGray5))
                        .overlay {
                            Image(systemName: "photo")
                                .font(.system(size: 40))
                                .foregroundStyle(.secondary)
                        }
                } else {
                    Image(activity.imageName)
                        .resizable()
                        .scaledToFill()
                }
            }
            .frame(height: 240)
            .clipShape(RoundedRectangle(cornerRadius: 16))
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
    }
    
    // MARK: - Activity Section
    private var activityInfoSection: some View {
        VStack(alignment: .leading, spacing: 16) {
            HStack {
                Text(activity.title)
                    .font(.title2)
                    .fontWeight(.bold)
                
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
            
            VStack(alignment: .leading, spacing: 12) {
                Label {
                    Text("\(activity.distance, specifier: "%.1f") km away")
                        .font(.subheadline)
                } icon: {
                    Image(systemName: "location.fill")
                        .symbolRenderingMode(.hierarchical)
                        .foregroundStyle(.tint)
                }
                
                Label {
                    HStack {
                        Text(activity.date)
                        Text("at")
                        Text(activity.time)
                            .fontWeight(.medium)
                    }
                    .font(.subheadline)
                } icon: {
                    Image(systemName: "calendar")
                        .symbolRenderingMode(.hierarchical)
                        .foregroundStyle(.tint)
                }
                
                Label {
                    Text(activity.contact)
                        .font(.subheadline)
                } icon: {
                    Image(systemName: "phone.circle.fill")
                        .symbolRenderingMode(.hierarchical)
                        .foregroundStyle(.tint)
                }
            }
        }
        .padding()
        .background(Color(.secondarySystemBackground))
        .clipShape(RoundedRectangle(cornerRadius: 16))
    }
    
    // MARK: - Location Section
    private var locationSection: some View {
        VStack(alignment: .leading, spacing: 16) {
            Text("Location")
                .font(.title2)
                .fontWeight(.bold)
            
            Divider()
            
            Label {
                Text(activity.location)
                    .font(.subheadline)
            } icon: {
                Image(systemName: "map.fill")
                    .symbolRenderingMode(.hierarchical)
                    .foregroundStyle(.tint)
            }
            
            Group {
                if activity.locationImageName.isEmpty {
                    Rectangle()
                        .fill(Color(.systemGray5))
                        .overlay {
                            Image(systemName: "photo")
                                .font(.largeTitle)
                                .foregroundStyle(.secondary)
                        }
                } else {
                    Image(activity.locationImageName)
                        .resizable()
                        .scaledToFill()
                }
            }
            .frame(height: 180)
            .clipShape(RoundedRectangle(cornerRadius: 12))
            .accessibilityHidden(true)
        }
        .padding()
        .background(Color(.secondarySystemBackground))
        .clipShape(RoundedRectangle(cornerRadius: 16))
    }
    
    // MARK: - Join (RSVP) Button
    private var joinButton: some View {
        Button(action: { isJoined.toggle() }) {
            Text(isJoined ? "Joined" : "Join Activity")
                .font(.headline)
                .frame(maxWidth: .infinity)
                .padding()
                .background(isJoined ? Color.secondary : Color.accentColor)
                .foregroundColor(.white)
                .clipShape(RoundedRectangle(cornerRadius: 16))
                .contentTransition(.identity)
                .animation(.easeInOut, value: isJoined)
        }
        .buttonStyle(.plain)
        .padding(.vertical, 8)
    }
}

#Preview {
    ActivityDetailView(activity: ActivityModel(
        imageName: "run_fun",
        title: "Run Fun",
        distance: 4.2,
        category: "Running",
        date: "Sunday, Apr 13 2025",
        time: "09.00 GMT+8",
        contact: "08123456789",
        guests: 5,
        location: "Lapangan Puputan Bandung",
        locationImageName: "lapangan_puputan"
    ))
}
