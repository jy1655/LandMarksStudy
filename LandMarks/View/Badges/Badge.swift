//
//  Badge.swift
//  LandMarks
//
//  Created by 황재영 on 2023/09/18.
//

import SwiftUI


struct Badge: View { // 모양 만들기
    var badgeSymbols: some View {
        ForEach(0..<8) { index in
                    RotatedBadgeSymbol(
                        angle: .degrees(Double(index) / Double(8)) * 360.0
                    )
                }
                .opacity(0.5)
    }
    
    var body: some View {
        ZStack {
            BadgeBackground() 
            // BadgeBackground 파일의 메소드를 가져옴
            GeometryReader { geometry in
                            badgeSymbols
                                .scaleEffect(1.0 / 4.0, anchor: .top)
                                .position(x: geometry.size.width / 2.0, y: (3.0 / 4.0) * geometry.size.height)
                        }
        }
        .scaledToFit()
    }
}


struct Badge_Previews: PreviewProvider {
    static var previews: some View {
        Badge()
    }
}
