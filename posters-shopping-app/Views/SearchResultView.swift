//
//  SearchResultView.swift
//  posters-shopping-app
//
//  Created by Pham on 4/27/23.
//

import SwiftUI

struct SearchResultView: View {
      @ObservedObject var cartModel: CartViewModel
      var posters: [Poster]
      var animation: Namespace.ID
      
      var body: some View {
            VStack(spacing: 15) {
                  Text("Search Results")
                        .font(.title)
                        .fontWeight(.bold)
                  
                  ForEach(posters) { poster in
                        CardView(cartModel: cartModel, poster: poster, animation: animation)
                  }
            }
            .padding()
      }
}

struct SearchResultView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
