//
//  ContentView.swift
//  LandMarks
//
//  Created by 황재영 on 2023/09/18.
//

import SwiftUI


struct ContentView: View {
    @State private var selection: Tab = .featured 
    //.featured= 상태 속성을 선언, 현재 선택된 탭을 추적 Tab 열거형중 기본값으로 .featured 설정.

    enum Tab { 
        // Tab에 case를 부여
        case featured
        case list
    }

    var body: some View {
        TabView(selection: $selection) { // TabView 로 선택에 따라 보이는 view의 변경
            CategoryHome() // Category 폴더의 CategoryHome 파일 참조
                .tabItem{ //설정 지정
                Label("Featured", systemImage: "star") // 이미지는 별이고 이름은 Featured
            }
            .tag(Tab.featured) // 고유한 값 지정 = Tab.featured 일때 CategoryHome()을 보여줌

            LandmarkList() // Landmarks파일의 LandmarkList폴더 참조
                .tabItem {
                Label("List", systemImage: "list.bullet")
                
            }
                .tag(Tab.list)
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(ModelData())
    }
}
