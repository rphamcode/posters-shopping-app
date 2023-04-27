//
//  FavoriteView.swift
//  posters-shopping-app
//
//  Created by Pham on 4/27/23.
//

import SwiftUI

struct FavoriteView: View {
      @EnvironmentObject var favoritesViewModel: FavoriteViewModel
      @ObservedObject var cartModel: CartViewModel
      @Namespace var animation

      var body: some View {
            ScrollView(.vertical, showsIndicators: false) {
                  VStack(spacing: 15) {
                        Text("Your Favorites")
                              .font(.title.bold())
                              .frame(maxWidth: .infinity, alignment: .leading)
                        
                        ForEach(cartModel.items) { poster in
                              CardView(cartModel: cartModel, poster: poster, animation: animation)
                        }
                  }
                  .padding()
                  .padding(.bottom, 100)
            }
      }
}

struct FavoriteView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
