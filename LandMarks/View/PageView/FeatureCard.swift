//
//  FeatureCard.swift
//  LandMarks
//
//  Created by 황재영 on 2023/09/19.
//

import SwiftUI

struct FeatureCard: View {
    var landmark: Landmark // Modeld의 Landmark파일의 타입을 사용


    var body: some View {
        landmark.featureImage?
            .resizable()
            .aspectRatio(3 / 2, contentMode: .fit)
            .overlay {
                TextOverlay(landmark: landmark)
            }
    }
}

struct TextOverlay: View {
    var landmark: Landmark // Modeld의 Landmark파일의 타입을 사용


    var gradient: LinearGradient {
        .linearGradient(
            Gradient(colors: [.black.opacity(0.6), .black.opacity(0)]),
            startPoint: .bottom,
            endPoint: .center)
    }


    var body: some View {
        ZStack(alignment: .bottomLeading) {
            gradient
            VStack(alignment: .leading) {
                Text(landmark.name)
                    .font(.title)
                    .bold()
                Text(landmark.park)
            }
            .padding()
        }
        .foregroundColor(.white)
    }
}

struct FeatureCard_Previews: PreviewProvider {
    static var previews: some View {
        FeatureCard(landmark: ModelData().features[0]) // ModelData로 Json파일을 불러와 정보와 사진 표현
    }
}
