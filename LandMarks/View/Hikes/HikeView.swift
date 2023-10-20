/*
See LICENSE folder for this sample’s licensing information.

Abstract:
A view displaying information about a hike, including an elevation graph.
*/

import SwiftUI


extension AnyTransition {
    static var moveAndFade: AnyTransition {
        .asymmetric(
            insertion: .move(edge: .trailing).combined(with: .opacity),
            removal: .scale.combined(with: .opacity)
        )
    }
}


struct HikeView: View {
    var hike: Hike
    @State private var showDetail = false


    var body: some View {
        VStack {
            HStack {
                HikeGraph(hike: hike, path: \.elevation) // HikeGraph 파일 view 가져옴
                    .frame(width: 50, height: 30)


                VStack(alignment: .leading) {
                    Text(hike.name)
                        .font(.headline)
                    Text(hike.distanceText)
                }


                Spacer()


                Button {
                    withAnimation {
                        showDetail.toggle() // 토글시 이미지가 변동하는 토글 버튼 생성
                    }
                } label: { // 토글 버튼 이미지
                    Label("Graph", systemImage: "chevron.right.circle")
                        .labelStyle(.iconOnly)
                        .imageScale(.large)
                        .rotationEffect(.degrees(showDetail ? 90 : 0)) // 회전 효과 부여
                        .scaleEffect(showDetail ? 1.5 : 1) // 토글시 크기 변경효과 부여
                        .padding()
                }
            }


            if showDetail { // showDetail = true 의 경우 발생
                HikeDetail(hike: hike) // HikeDetail 의 view를 가져온다
                    .transition(.moveAndFade) // view 생성방식 지정
            }
        }
    }
}

struct HikeView_Previews: PreviewProvider {
    static var previews: some View {
        VStack {
            HikeView(hike: ModelData().hikes[0])
                .padding()
            Spacer()
        }
    }
}
