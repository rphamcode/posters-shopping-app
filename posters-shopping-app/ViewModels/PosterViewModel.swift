//
//  PosterViewModel.swift
//  posters-shopping-app
//
//  Created by Pham on 4/27/23.
//

import Foundation

class PosterViewModel: ObservableObject {
      @Published var currentTab: Tab = .home
      @Published var currentMenu: String = "All"
      @Published var showDetailView: Bool = false
      @Published var currentActiveItem: Poster?
}
