//
//  AppStoreView.swift
//  AppleStore
//
//  Created by Raghavendra Mikkilineni on 14/05/21.
//

import SwiftUI
import Kingfisher

struct AppStoreView: View {
    @ObservedObject private(set) var viewModel: AppStoreViewModel
    
    private var navigation: some View {
        NavigationView {
            content
                .navigationBarTitle("App Store")
                .edgesIgnoringSafeArea(.bottom)
        }
        .navigationViewStyle(StackNavigationViewStyle())
    }
    
    private var content: some View {
        ScrollView {
            LazyVStack(spacing: 0) {
                ForEach(0..<viewModel.appStorePresentationModels.count, id: \.self) { index in
                    MainCategoryView(appStorePresentationModel: $viewModel.appStorePresentationModels[index])
                    
                    if viewModel.appStorePresentationModels[index].isExpanded {
                        ForEach(0..<viewModel.appStorePresentationModels[index].genres.count) { genreIndex in
                            SubCategoryView(genre: $viewModel.appStorePresentationModels[index].genres[genreIndex])
                            
                            if viewModel.appStorePresentationModels[index].genres[genreIndex].isExpanded {
                                switch viewModel.appStorePresentationModels[index].type {
                                case .iBooks:
                                    AlbumView(books: getFilteredResultsForGenre(index,
                                                                                genreId: viewModel.appStorePresentationModels[index].genres[genreIndex].genreId))
                                case .iosApps:
                                    iOSAppsView(iOSApps: getFilteredResultsForGenre(index,
                                                                                    genreId: viewModel.appStorePresentationModels[index].genres[genreIndex].genreId))
                                default:
                                    AlbumView(books: getFilteredResultsForGenre(index,
                                                                                genreId: viewModel.appStorePresentationModels[index].genres[genreIndex].genreId))
                                }
                            }
                        }
                    }
                }
            }
            .padding(EdgeInsets(top: 10, leading: 0, bottom: 40, trailing: 0))
        }
    }
    
    private func getFilteredResultsForGenre(_ index: Int, genreId: String) -> Array<Result> {
        return viewModel.appStorePresentationModels[index].results.filter { (result) -> Bool in
            for genre in result.genres {
                if genre.genreId == genreId {
                    return true
                }
            }
            return false
        }
    }
    
    var body: some View {
        navigation
    }
}

struct AppStoreView_Previews: PreviewProvider {
    static var previews: some View {
        AppStoreView(viewModel: AppStoreView.AppStoreViewModel())
    }
}
