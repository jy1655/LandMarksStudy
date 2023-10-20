//
//  ProfileEditor.swift
//  LandMarks
//
//  Created by 황재영 on 2023/09/19.
//

import SwiftUI

struct ProfileEditor: View {
    @Binding var profile: Profile // Model 폴더에 있는 Profile 파일을 가져옴

    var dateRange: ClosedRange<Date> {
            let min = Calendar.current.date(byAdding: .year, value: -1, to: profile.goalDate)!
        // profile.goalDate의 일년전까지 = min
            let max = Calendar.current.date(byAdding: .year, value: 1, to: profile.goalDate)!
        // profile.goalDate의 일년후까지 = max
            return min...max
        }
    
    var body: some View {
        List {
            HStack {
                Text("Username").bold()
                Divider()
                TextField("Username", text: $profile.username)
            }
            
            Toggle(isOn: $profile.prefersNotifications) {
                Text("Enable Notifications").bold()
            }
            
            VStack(alignment: .leading, spacing: 20) {
                Text("Season Photo").bold()
                
                VStack(alignment: .leading, spacing: 20) {
                    Text("Seasonal Photo").bold()
                    
                    Picker("Seasonal Photo", selection: $profile.seasonalPhoto) {
                        // 모델 폴더의 Profile에 있는 String을 선택형으로 표시
                        ForEach(Profile.Season.allCases) {
                            season in Text(season.rawValue)
                                .tag(season)
                        }
                    }
                    .pickerStyle(.segmented)
                }
                DatePicker(selection: $profile.goalDate, in: dateRange, displayedComponents: .date) {
                                Text("Goal Date").bold() 
                    // 날짜 표시 goal date
                            }
            }
        }
    }
}

struct ProfileEditor_Previews: PreviewProvider {
    static var previews: some View {
        ProfileEditor(profile: .constant(.default))
    }
}
