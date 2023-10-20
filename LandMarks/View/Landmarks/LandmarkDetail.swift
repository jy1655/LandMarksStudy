//
//  LandmarkDetail.swift
//  LandMarks
//
//  Created by 황재영 on 2023/09/18.
//

import SwiftUI


struct LandmarkDetail: View {
    @EnvironmentObject var modelData: ModelData
    // @EnvironmentObject 프로퍼티를 이용해 구조의 어느 뷰에서나 공유 데이터에 접근하도록 함
    var landmark: Landmark


    var landmarkIndex: Int {
        modelData.landmarks.firstIndex(where: { $0.id == landmark.id })! 
        // !는 .firstIndex(where:)가 반환한 결과를 강제로 언래핑하는 데 사용
    }


    var body: some View {
        ScrollView {
            MapView(coordinate: landmark.locationCoordinate) 
            // MapView 의 내부 변수를 landmark.json 값에 맞게 설정
                .ignoresSafeArea(edges: .top)
                .frame(height: 300)


            CircleImage(image: landmark.image)
                .offset(y: -130)
                .padding(.bottom, -130)


            VStack(alignment: .leading) {
                HStack {
                    Text(landmark.name)
                        .font(.title)
                    FavoriteButton(isSet: $modelData.landmarks[landmarkIndex].isFavorite) 
                    // FavoriteButton view, landmark.isFavorite bool 값에 따른 표시 변경
                }


                HStack {
                    Text(landmark.park)
                    Spacer()
                    Text(landmark.state)
                }
                .font(.subheadline)
                .foregroundColor(.secondary)


                Divider()


                Text("About \(landmark.name)")
                    .font(.title2)
                Text(landmark.description)
            }
            .padding()
        }
        .navigationTitle(landmark.name)
        .navigationBarTitleDisplayMode(.inline)
    }
}


struct LandmarkDetail_Previews: PreviewProvider {
    static let modelData = ModelData()


    static var previews: some View {
        LandmarkDetail(landmark: modelData.landmarks[0])
            .environmentObject(modelData)
    }
}
