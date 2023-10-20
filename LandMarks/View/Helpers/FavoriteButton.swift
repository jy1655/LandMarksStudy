//
//  FavoriteButton.swift
//  LandMarks
//
//  Created by 황재영 on 2023/09/18.
//

import SwiftUI


struct FavoriteButton: View {
    @Binding var isSet: Bool // 버튼 상태 설정을 저장할 변수 isSet 선언


    var body: some View {
        Button {
            isSet.toggle()
            // 현재 상태를 저장하는 변수 isSet 을 토글형식
        } label: {
            Label("Toggle Favorite", systemImage: isSet ? "star.fill" : "star")
            // isSet 변수가 true이면 이미지가 채워지고(star.fill) isSet이 false이면 빈 별(star)이 됩니다.
                .labelStyle(.iconOnly)
                .foregroundColor(isSet ? .yellow : .gray)
        }
    }
}


struct FavoriteButton_Previews: PreviewProvider {
    static var previews: some View {
        FavoriteButton(isSet: .constant(true))
    }
}
