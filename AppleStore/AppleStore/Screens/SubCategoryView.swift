//
//  SubCategoryView.swift
//  AppleStore
//
//  Created by Raghavendra Mikkilineni on 16/05/21.
//

import SwiftUI

struct SubCategoryView: View {
    @Binding var genre: GenrePresentationModel
    
    private func iconAngle(_ isExpanded: Bool) -> Double {
        return isExpanded ? 180 : 0
    }
    
    private func text(_ genreName: String) ->  some View {
        Text(genreName)
            .font(.system(size: 12, weight: .medium, design: .default))
    }
    
    private var content: some View {
        HStack(spacing: 5) {
            Rectangle()
                .frame(width: 10, alignment: .leading)
                .foregroundColor(Color.clear)
            text(genre.name)
            Spacer()
            Image(systemName: "chevron.down")
                .font(.system(size: 12, weight: .medium, design: .default))
                .rotationEffect(.degrees(iconAngle(genre.isExpanded)))
                .animation(.interactiveSpring())
            Rectangle()
                .frame(width: 10, alignment: .trailing)
                .foregroundColor(Color.clear)
        }
        .frame(height: 30)
        .padding(.horizontal, 25)
        .contentShape(Rectangle())
        .onTapGesture {
            DispatchQueue.main.async { genre.isExpanded.toggle() }
        }
    }
    
    var body: some View {
        content
        Divider()
    }
}
