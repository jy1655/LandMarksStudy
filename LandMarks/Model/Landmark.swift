//
//  Landmark.swift
//  LandMarks
//
//  Created by 황재영 on 2023/09/18.
//

import Foundation
import SwiftUI
import CoreLocation


struct Landmark: Hashable, Codable, Identifiable {
//    Hashable = 사용자 지정 객체를 Dictionary의 키로 사용하거나 Set에 저장할 때 사용,
//    Codable = Decodable & Encodable의 조합인 typealias JSON API에서 데이터를 파싱하거나 객체를 JSON으로 인코딩할 때 사용
//    Identifiable = 객체에 고유한 식별자를 제공 SwiftUI List나 ForEach에서 사용되며, 각 요소가 고유하게 식별 가능해야 할 때 사용
    var id: Int
    var name: String
    var park: String
    var state: String
    var description: String
    var isFavorite: Bool
    var isFeatured: Bool


    var category: Category
    enum Category: String, CaseIterable, Codable, Hashable { //연관값을 case별로 그룹화
        case lakes = "Lakes"
        case rivers = "Rivers"
        case mountains = "Mountains"
    }

    // private var => 외부범위에서 변수 접근 제한
    private var imageName: String
    var image: Image {
        Image(imageName)
    }
    var featureImage: Image? { 
//        ? 연산자 => nil이 아닐때 값을 추출
        isFeatured ? Image(imageName + "_feature") : nil 
//        nil => 값이 없음, 메모리 누수를 방지하기 위해 사용 imageName + "_feature"의 이미지가 없을 경우 nil 값을 반환
    }


    private var coordinates: Coordinates
    
    var locationCoordinate: CLLocationCoordinate2D { // CLLocationCoordinate2D => Core Location 프레임워크에서 사용되는 구조체 : 지리적 위치를 위도(latitude)와 경도(longitude)로 나타내는 데 사용
        CLLocationCoordinate2D(
            latitude: coordinates.latitude,
            longitude: coordinates.longitude)
    }


    struct Coordinates: Hashable, Codable { // private var coordinates: Coordinates 의 Coordinates 타입의 정의를 위해 작성 (상단이 아닌 하단에 있어도 된다)
        var latitude: Double // Double => 부동소수점 숫자
        var longitude: Double
    }
}
