//
//  ProfileSummary.swift
//  Landmarks
//
//  Created by Amir Mostafavi on 12/26/19.
//  Copyright © 2019 Apple. All rights reserved.
//

import SwiftUI

struct ProfileSummary: View {
    var profile: Profile
    
    static let goalFormat: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateStyle = .long
        formatter.timeStyle = .none
        return formatter
    }()
    
    var body: some View {
        List {
            Text(profile.username)
                .bold()
                .font(.title)
            
            Text("Notifications: \(profile.prefersNotifications ? "On" : "Off")")
            
            Text("Seasonal Photos: \(profile.seasonalPhoto.rawValue)")
            
            Text("Goal Date: \(profile.goalDate, formatter: Self.goalFormat)")
            
            VStack(alignment: .leading) {
                Text("Completed Badges")
                    .font(.headline)
                
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack {
                        HikeBadge(name: "First Hike")
                        
                        HikeBadge(name: "Earth Day")
                            .hueRotation(Angle(degrees: 90))
                        
                        HikeBadge(name: "Tenth Hike")
                            .hueRotation(Angle(degrees: 45))
                            .grayscale(0.5)
                    }
                }
                .frame(height: 140)
            }
            
            VStack(alignment: .leading) {
                Text("Recent Hikes")
                    .font(.headline)
                    .animation(nil)
                
                HikeView(hike: hikeData[0])
            }
        }
    }
}

struct ProfileSummary_Previews: PreviewProvider {
    static var previews: some View {
        ProfileSummary(profile: Profile.default)
    }
}

