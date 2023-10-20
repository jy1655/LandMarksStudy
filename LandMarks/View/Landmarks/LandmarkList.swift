//
//  LandmarkList.swift
//  LandMarks
//
//  Created by 황재영 on 2023/09/18.
//

import SwiftUI


struct LandmarkList: View {
    @EnvironmentObject var modelData: ModelData
    @State private var showFavoritesOnly = false 
    // showFavoritesOnly = false로 지정


    var filteredLandmarks: [Landmark] {
        modelData.landmarks.filter { landmark in
            (!showFavoritesOnly || landmark.isFavorite) 
            // filter 설정: showFavoritesOnly = false일 경우와 landmark.isFavorite = true 경우
        }
    }


    var body: some View {
        NavigationView {
            List {
                Toggle(isOn: $showFavoritesOnly) {
                    Text("Favorites only") //Favorites only 토글버튼 생성
                }


                ForEach(filteredLandmarks) { 
                    // !showFavoritesOnly조건의 경우 항목이 원래 존재하지 않기에 모든항목이 보인다
                    landmark in NavigationLink {
                        LandmarkDetail(landmark: landmark)
                    } label: {
                        LandmarkRow(landmark: landmark) 
                        // LandmarkRow의 항목을 클릭하면 해당 항목의 LandmarkDetail 링크로 이동
                    }
                }
            }
            .navigationTitle("Landmarks")
        }
    }
}


struct LandmarkList_Previews: PreviewProvider {
    static var previews: some View {
        LandmarkList()
            .environmentObject(ModelData())
    }
}
