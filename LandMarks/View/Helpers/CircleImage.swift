//
//  CircleImage.swift
//  LandMarks
//
//  Created by 황재영 on 2023/09/18.
//

import SwiftUI

struct CircleImage: View {
    var image: Image //저장된 이미지 프로터티 추가
    
    var body: some View {
        image
        .clipShape(Circle()).overlay { Circle().stroke(.black, lineWidth: 4)
        }.shadow(radius: 7)
    }
}

struct CircleImage_Previews: PreviewProvider {
    static var previews: some View {
        CircleImage(image: Image("turtlerock"))
    }
}
