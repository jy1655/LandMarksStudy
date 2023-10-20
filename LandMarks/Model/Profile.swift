//
//  Profile.swift
//  LandMarks
//
//  Created by 황재영 on 2023/09/18.
//

import Foundation

struct Profile {
    var username: String
    var prefersNotifications = true
    var seasonalPhoto = Season.winter
    var goalDate = Date()


    static let `default` = Profile(username: "g_kumar")


    enum Season: String, CaseIterable, Identifiable {
        case spring = "🌷"
        case summer = "🌞"
        case autumn = "🍂"
        case winter = "☃️"


        var id: String { rawValue } //열거형 각 case의 원시 값을 문자열로 변환    [ex)Season.spring = 🌷 (-String)]
    }
}
