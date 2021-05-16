//
//  TopHeaderView.swift
//  AppleStore
//
//  Created by Raghavendra Mikkilineni on 14/05/21.
//

import SwiftUI
import Kingfisher

struct MainCategoryView: View {
    @Binding var appStorePresentationModel: AppStorePresentationModel
    
    private var iconAngle: Double {
        return appStorePresentationModel.isExpanded ? 180 : 0
    }
    
    private var text: some View {
        Text(appStorePresentationModel.title)
            .font(.system(size: 16, weight: .heavy, design: .default))
    }
    
    private var content: some View {
        HStack(spacing: 5) {
            text
            Spacer()
            Image(systemName: "chevron.down")
                .rotationEffect(.degrees(iconAngle))
                .animation(.interactiveSpring())
        }
        .frame(height: 40)
        .padding(.horizontal, 25)
        .contentShape(Rectangle())
        .onTapGesture {
            DispatchQueue.main.async { appStorePresentationModel.isExpanded.toggle() }
        }
    }
    
    var body: some View {
        content
        Divider()
    }
}

