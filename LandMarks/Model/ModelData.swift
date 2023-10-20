//
//  ModelData.swift
//  LandMarks
//
//  Created by 황재영 on 2023/09/18.
//

import Foundation
import Combine  // ObservableObject 사용을 위한 라이브러리

final class ModelData: ObservableObject { // final 키워드를 사용하면 해당 메서드는 상속이 불가능하다(서브클래스 생성불가) -> 코드안정성을 위해 사용
    @Published var landmarks: [Landmark] = load("landmarkData.json")
    // ObservableObject 프로토콜 -> @Published 속성을 사용 = (데이터 바인딩)과 함께 사용되어 UI 데이터 모델 간에 양방향 통신을 단순하게 만듬
    var hikes: [Hike] = load("hikeData.json")
    @Published var profile = Profile.default
    
    var features: [Landmark] {
        landmarks.filter { $0.isFeatured }
    }


    var categories: [String: [Landmark]] {
        Dictionary(
            grouping: landmarks,
            by: { $0.category.rawValue }
        )
    }
}


// json 데이터를 가져오기 위한 function 생성
func load<T: Decodable>(_ filename: String) -> T { // 해당 데이터를 Decodable을 준수하는 모델 타입(T)으로 디코딩(JSON 데이터를 로드하고 디코딩)
    let data: Data
// Decodable 프로토콜? Decodable은 Codable 프로토콜 중 하나로, JSON 또는 다른 데이터 형식을 Swift 데이터 모델로 디코딩할 때 사용
    guard let file = Bundle.main.url(forResource: filename,
                                     withExtension: nil) 
//    guard let => 옵셔널 값이 nil이 아닌 경우에만 해당 값을 추출하여 사용하고, 그렇지 않으면 조건이 만족되지 않았다는 에러를 발생
        else {
            fatalError("Couldn't find \(filename) in main bundle.") // fatalError => 프로그램을 중단하고 오류 메시지를 출력
    }

    do {
        data = try Data(contentsOf: file)
    } catch {
        fatalError("Couldn't load \(filename) from main bundle:\n\(error)")
    }

    do {
        let decoder = JSONDecoder()
        return try decoder.decode(T.self,from: data)
//        try => 함수 내에서 에러를 던질 수 있는 코드를 호출할 때 사용. 만약 에러가 발생하면 해당 함수에서 처리해야 합니다. try? = 에러가 발생하더라도 에러를 던지지 않고 옵셔널 값을 반환, try! = 에러가 발생하면 런타임 오류가 발생
    } catch {
        fatalError("Couldn't parse \(filename) as \(T.self):\n\(error)")
    }
}
