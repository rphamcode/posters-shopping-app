//
//  FavoriteViewModel.swift
//  posters-shopping-app
//
//  Created by Pham on 4/27/23.
//

import SwiftUI
import Combine

class FavoriteViewModel: ObservableObject {
      @Published var items: [Poster] = []
      
      func addToFavorite(poster: Poster) {
            items.append(poster)
      }
}
