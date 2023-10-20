//
//  ProfileSummary.swift
//  LandMarks
//
//  Created by 황재영 on 2023/09/18.
//

import SwiftUI


struct ProfileSummary: View {
    @EnvironmentObject var modelData: ModelData
    var profile: Profile //Model 폴더에 있는 Profile 파일을 가져옴


    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 10) {
                Text(profile.username)
                    .bold()
                    .font(.title)


                Text("Notifications: \(profile.prefersNotifications ? "On": "Off" )")
                // profile.prefersNotifications의 bool값에 따름
                Text("Seasonal Photos: \(profile.seasonalPhoto.rawValue)")
                Text("Goal Date: ") + Text(profile.goalDate, style: .date)
                // profile.goalDate의 값을 .date의 값으로 표현


                Divider() // 분할선 추가


                VStack(alignment: .leading) {
                    Text("Completed Badges")
                        .font(.headline)


                    ScrollView(.horizontal) { // 좌우로 스크롤
                        HStack {
                            HikeBadge(name: "First Hike") // HikeBadge 이름 "First Hike"
                            HikeBadge(name: "Earth Day")
                                .hueRotation(Angle(degrees: 90)) // 원래 지정된 뱃지의 색조를 변경
                            HikeBadge(name: "Tenth Hike")
                                .grayscale(0.5) // 50%의 회색조(흑백) 효과 부여
                                .hueRotation(Angle(degrees: 45))
                        }
                        .padding(.bottom)
                    }
                }


                Divider()


                VStack(alignment: .leading) {
                    Text("Recent Hikes")
                        .font(.headline)


                    HikeView(hike: modelData.hikes[0])
                }
            }
        }
    }
}


struct ProfileSummary_Previews: PreviewProvider {
    static var previews: some View {
        ProfileSummary(profile: Profile.default)
            .environmentObject(ModelData())
                }
}
