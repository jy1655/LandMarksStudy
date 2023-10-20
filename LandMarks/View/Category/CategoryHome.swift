//
//  CategoryHome.swift
//  LandMarks
//
//  Created by 황재영 on 2023/09/18.
//

import SwiftUI


struct CategoryHome: View {
    @EnvironmentObject var modelData: ModelData
    @State private var showingProfile = false


    var body: some View {
        NavigationView {
            List {
                modelData.features[0].image
                    .resizable()
                    .scaledToFill()
                    .frame(height: 200)
                    .clipped()
                    .listRowInsets(EdgeInsets())


                ForEach(modelData.categories.keys.sorted(), id: \.self) { key in
                    CategoryRow(categoryName: key, items: modelData.categories[key]!)
                    // CategoryRow 파일 참조
                }
                .listRowInsets(EdgeInsets()) //List 여백(insets)을 지정하는 modifier(변경자)
            }
            .listStyle(.inset)
            .navigationTitle("Featured")
            .toolbar {
                Button {
                    showingProfile.toggle()
                } label: {
                    Label("User Profile", systemImage: "person.crop.circle")
                }
            }
            .sheet(isPresented: $showingProfile) {
                ProfileHost() // Profile 폴더의 ProfileHost파일 참조
                    .environmentObject(modelData)
            }
        }
    }
}


struct CategoryHome_Previews: PreviewProvider {
    static var previews: some View {
        CategoryHome()
            .environmentObject(ModelData())
    }
}
