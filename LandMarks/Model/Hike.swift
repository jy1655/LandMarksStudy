//
//  Hike.swift
//  LandMarks
//
//  Created by 황재영 on 2023/09/18.
//

import Foundation

struct Hike: Codable, Hashable, Identifiable {
    var id: Int
    var name: String
    var distance: Double
    var difficulty: Int
    var observations: [Observation]


    static var formatter = LengthFormatter()
    // LengthFormatter() => 미터, 피트, 인치 등 다양한 길이 단위 간의 변환을 수행. 지역화를 지원하며, 사용자의 로컬 설정에 따라 단위와 포맷을 자동으로 조정


    var distanceText: String {
        Hike.formatter
            .string(fromValue: distance, unit: .kilometer)
    }


    struct Observation: Codable, Hashable {
        var distanceFromStart: Double


        var elevation: Range<Double>
        var pace: Range<Double>
        var heartRate: Range<Double>
    }
}
