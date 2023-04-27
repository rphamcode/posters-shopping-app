//
//  ContentView.swift
//  posters-shopping-app
//
//  Created by Pham on 4/26/23.
//

import SwiftUI

struct ContentView: View {
      @StateObject var posterModel: PosterViewModel = .init()
      @StateObject var cartModel: CartViewModel = .init()
      
      @Namespace var animation
      
      init() {
            UITabBar.appearance().isHidden = true
      }
      
      var body: some View {
            TabView(selection: $posterModel.currentTab) {
                  HomeView(cartModel: cartModel, animation: animation)
                        .environmentObject(posterModel)
                        .tag(Tab.home)
                        .setUpTab()
                  
                  CartView(cartModel: cartModel)
                      .environmentObject(posterModel)
                      .tag(Tab.cart)
                      .setUpTab()
            }
            .overlay(alignment: .bottom) {
                  CustomTabBarView(currentTab: $posterModel.currentTab, animation: animation)
                        .offset(y: posterModel.showDetailView ? 150 : 0)
            }
            .overlay {
                  if let poster = posterModel.currentActiveItem, posterModel.showDetailView {
                        DetailView(poster: poster, animation: animation, cartModel: cartModel)
                              .environmentObject(posterModel)
                              .transition(.offset(x: 1, y: 1))
                  }
            }
            .ignoresSafeArea(.keyboard, edges: .bottom)
      }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
