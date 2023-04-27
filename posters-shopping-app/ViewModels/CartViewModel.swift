//
//  CartViewModel.swift
//  posters-shopping-app
//
//  Created by Pham on 4/27/23.
//

import SwiftUI
import Combine

class CartViewModel: ObservableObject {
      @Published var items: [Poster] = []
      
      func addToCart(poster: Poster) {
            items.append(poster)
      }
}
