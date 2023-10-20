//
//  PageView.swift
//  LandMarks
//
//  Created by 황재영 on 2023/09/19.
//

import SwiftUI


struct PageView<Page: View>: View {
    var pages: [Page]


    var body: some View {
        PageViewController(pages: pages) // PageViewController 참조
    }
}


struct PageView_Previews: PreviewProvider {
    static var previews: some View {
        PageView(pages: ModelData().features.map { FeatureCard(landmark: $0) })
            .aspectRatio(3 / 2, contentMode: .fit)
    }
}
