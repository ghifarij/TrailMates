//
//  ActivityModel.swift
//  TrailMates
//
//  Created by Afga Ghifari on 11/04/25.
//

import Foundation

struct ActivityModel: Codable, Identifiable {
    var id: UUID = .init()
    var imageName: String
    var title: String
    var distance: Float
    var category: String
    var date: String
    var time: String
    var contact: String
    var guests: Int
    var location: String
    var locationImageName: String
}
