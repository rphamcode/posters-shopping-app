//
//  MainView.swift
//  posters-shopping-app
//
//  Created by Pham on 4/27/23.
//

import SwiftUI

struct MainView: View {
      @StateObject var posterModel: PosterViewModel = .init()
      
      @Namespace var animation
      
      init() {
            UITabBar.appearance().isHidden = true
      }
      
      var body: some View {
            TabView(selection: $posterModel.currentTab) {
                  HomeView(animation: animation)
                        .environmentObject(posterModel)
                        .tag(Tab.home)
                        .setUpTab()
                  
                  Text("Favorite")
                        .tag(Tab.favorite)
                        .setUpTab()
                  
                  Text("Cart")
                        .tag(Tab.cart)
                        .setUpTab()
                  
            
                  Text("Profile")
                        .tag(Tab.profile)
                        .setUpTab()
            }
            .overlay(alignment: .bottom) {
                  CustomTabBarView(currentTab: $posterModel.currentTab, animation: animation)
                        .offset(y: posterModel.showDetailView ? 150 : 0)
            }
            .overlay {
                  if let poster = posterModel.currentActiveItem, posterModel.showDetailView {
                        DetailView(poster: poster, animation: animation)
                              .environmentObject(posterModel)
                              .transition(.offset(x: 1, y: 1))
                  }
            }
            .ignoresSafeArea(.keyboard, edges: .bottom)
      }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
