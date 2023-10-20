//
//  LandmarkRow.swift
//  LandMarks
//
//  Created by 황재영 on 2023/09/18.
//

import SwiftUI


struct LandmarkRow: View {
    var landmark: Landmark


    var body: some View {
        HStack {
            landmark.image
                .resizable() // 이미지를 크기 조정 가능하게
                .frame(width: 50, height: 50) // 크기 지정
                .cornerRadius(5) // 모서리를 둥글게
            Text(landmark.name)


            Spacer()


            if landmark.isFavorite {
                Image(systemName: "star.fill")
                    .imageScale(.medium)
                    .foregroundColor(.yellow)
            }
        }
    }
}


struct LandmarkRow_Previews: PreviewProvider {
    static var landmarks = ModelData().landmarks


    static var previews: some View {
        Group {
            LandmarkRow(landmark: landmarks[0])
            LandmarkRow(landmark: landmarks[1])
        }
        .previewLayout(.fixed(width: 300, height: 70))
    }
}
