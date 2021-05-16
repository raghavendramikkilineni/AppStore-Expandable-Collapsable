//
//  iOSAppsView.swift
//  AppleStore
//
//  Created by Raghavendra Mikkilineni on 14/05/21.
//

import SwiftUI
import Kingfisher

struct iOSAppsView: View {
    var iOSApps: Array<Result> = Array<Result>()
    
    var body: some View {
        let columns: [GridItem] =
            Array(repeating: .init(.flexible(minimum: 50, maximum: 200),
                                   spacing: 16,
                                   alignment: .top),
                  count: 4)
        LazyVGrid(columns: columns,
                  alignment: .leading,
                  spacing: 16) {
            ForEach(0..<iOSApps.count, id: \.self) { index in
                VStack(alignment: .leading, spacing: 2) {
                    KFImage(URL(string: iOSApps[index].artworkUrl100))
                        .resizable()
                        .scaledToFit()
                        
                        .cornerRadius(22)
                        .padding(.bottom, 3)
                    
                    Text(iOSApps[index].name)
                        .font(.system(size: 10, weight: .semibold, design: .default))
                    Text(iOSApps[index].releaseDate)
                        .font(.system(size: 8, weight: .medium, design: .default))
                    Text(iOSApps[index].copyright ?? "")
                        .font(.system(size: 8, weight: .medium, design: .default))
                    
                }
            }
        }
        .padding(.horizontal, 16)
        .padding(.top, 16)
    }
}

struct iOSAppsView_Previews: PreviewProvider {
    static var previews: some View {
        iOSAppsView()
    }
}
