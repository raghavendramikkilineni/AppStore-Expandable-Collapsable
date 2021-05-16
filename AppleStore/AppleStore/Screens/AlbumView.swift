//
//  iBooksViews.swift
//  AppleStore
//
//  Created by Raghavendra Mikkilineni on 14/05/21.
//

import SwiftUI
import Kingfisher

struct AlbumView: View {
    var books: Array<Result> = Array<Result>()
    var body: some View {
        let columns: [GridItem] =
            Array(repeating: .init(.flexible(),
                                   spacing: 16,
                                   alignment: .top),
                  count: 3)
        LazyVGrid(columns: columns,
                  spacing: 16) {
            ForEach(0..<books.count, id: \.self) { index in
                VStack(alignment: .leading) {
                    KFImage(URL(string: books[index].artworkUrl100))
                        .resizable()
                        .scaledToFit()
                        .padding(.bottom, 3)
                    
                    Text(books[index].name)
                        .font(.system(size: 10, weight: .semibold, design: .default))
                    Text(books[index].artistName)
                        .font(.system(size: 8, weight: .medium, design: .default))
                }
            }
        }
        .padding(.horizontal, 16)
        .padding(.top, 10)
    }
}

struct iBooksViews_Previews: PreviewProvider {
    static var previews: some View {
        AlbumView()
    }
}
