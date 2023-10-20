//
//  CategoryItem.swift
//  LandMarks
//
//  Created by 황재영 on 2023/09/18.
//

import SwiftUI


struct CategoryItem: View {
    var landmark: Landmark // Asset파일의 이미지에 접근하기 위한 타입 작성


    var body: some View {
        VStack(alignment: .leading) {
            landmark.image 
            // Asset파일의 이미지에 접근
                .renderingMode(.original)
                .resizable()
                .frame(width: 155, height: 155)
                .cornerRadius(5)
            Text(landmark.name)
            // 이미지 밑에 label 작성 - 자동적으로
                .foregroundColor(.primary)
                .font(.caption)
        }
        .padding(.leading, 15)
    }
}


struct CategoryItem_Previews: PreviewProvider {
    static var previews: some View {
        CategoryItem(landmark: ModelData().landmarks[0])
    }
}
