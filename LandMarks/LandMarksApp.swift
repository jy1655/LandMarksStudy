//
//  LandMarksApp.swift
//  LandMarks
//
//  Created by 황재영 on 2023/09/18.
//

import SwiftUI


@main //Swift 앱의 진입점(Entry Point) 지정
struct LandmarksApp: App { //struct => 값 타입으로 동작하고 상속불가능
    @StateObject private var modelData = ModelData()
    //@StateObject => SwiftUI 뷰의 생명주기와 관련하여 관리되는 상태 객체(State Object)를 생성하고 관리하기 위해 사용

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(modelData) //(final class ModelData) 데이터를 가져와서 공유함
        }
    }
}
