//
//  RotatedBadgeSymbol.swift
//  LandMarks
//
//  Created by 황재영 on 2023/09/18.
//

import SwiftUI

struct RotatedBadgeSymbol: View {
    let angle: Angle
    
    var body: some View {
        BadgeSymbol().padding(-60).rotationEffect(angle, anchor: .bottom)
        // BadgeSymbol 만든 도형을 회전시키는 메소드 작성
    }
}

struct RotatedBadgeSymbol_Previews: PreviewProvider {
    static var previews: some View {
        RotatedBadgeSymbol(angle: Angle(degrees: 1))
    }
}
