//
//  CategoryRow.swift
//  LandMarks
//
//  Created by 황재영 on 2023/09/18.
//

import SwiftUI


struct CategoryRow: View {
    var categoryName: String
    var items: [Landmark]


    var body: some View {
        VStack(alignment: .leading) { //VStack 수직으로 컨텐츠 정렬 alignment를 .leading으로 설정하면 VStack의 앞쪽 가장자리를 따라 뷰가 정렬
            Text(categoryName)
                .font(.headline)
                .padding(.leading, 15)
                .padding(.top, 5)


            ScrollView(.horizontal, showsIndicators: false) { 
                // ScrollView 사용하여 콘텐츠에 대한 스크롤 가능한 컨테이너를 생성 .horizontal 스크롤이 수평으로 발생하도록 지정 showsIndicators는 스크롤 표시기를 표시할지 여부를 결정
                HStack(alignment: .top, spacing: 0) {
                    // HStack 수평으로 컨텐츠 정렬(Scrollview 내부)
                    ForEach(items) { // item 배열을 반복 = [Landmark]
                        landmark in NavigationLink { // landmarks = ModelData().landmarks, "landmarkData.json" 파일 로드
                            LandmarkDetail(landmark: landmark) // NavigationLink로 LandmarkDetail 파일 view로 이동
                        } label: {
                            CategoryItem(landmark: landmark) // 링크 버튼에 나오는 이미지와 글씨 -> CategoryItem 파일 func 로드
                        }
                    }
                }
            }
            .frame(height: 185)
        }
    }
}


struct CategoryRow_Previews: PreviewProvider {
    static var landmarks = ModelData().landmarks


    static var previews: some View {
        CategoryRow(
            categoryName: landmarks[0].category.rawValue,
            items: Array(landmarks.prefix(4))
        )
    }
}

