//
//  HomeView.swift
//  posters-shopping-app
//
//  Created by Pham on 4/27/23.
//

import SwiftUI

struct HomeView: View {
      @EnvironmentObject var posterModel: PosterViewModel
      @ObservedObject var cartModel: CartViewModel
      
      @State private var searchText = ""
      
      var animation: Namespace.ID
      
      let black: Color = Color("Black")
      
    var body: some View {
          ScrollView(.vertical, showsIndicators: false) {
                VStack(spacing: 15) {
                      VStack(alignment: .leading, spacing: 8) {
                            Text("Poster City")
                                  .font(.title.bold())
                      }
                      .foregroundColor(Color("Black"))
                      .frame(maxWidth: .infinity,alignment: .leading)
                      
                      HStack(spacing: 12) {
                            HStack(spacing: 12) {
                                  Image("Search")
                                        .resizable()
                                        .renderingMode(.template)
                                        .aspectRatio(contentMode: .fit)
                                        .frame(width: 25, height: 25)
                                        .foregroundColor(black)
                                  
                                  TextField("Search", text: $searchText)
                            }
                            .padding(.horizontal)
                            .padding(.vertical,12)
                            .background {
                                  RoundedRectangle(cornerRadius: 10, style: .continuous)
                                        .fill(.white)
                            }
                            
                            Button {
                                  
                            } label: {
                                  Image("Filter")
                                        .resizable()
                                        .renderingMode(.template)
                                        .aspectRatio(contentMode: .fit)
                                        .foregroundColor(black)
                                        .frame(width: 25, height: 25)
                                        .padding(12)
                                        .background {
                                              RoundedRectangle(cornerRadius: 10, style: .continuous)
                                                    .fill(.white)
                                        }
                            }
                      }
                      
                      CustomMenu()
                      
                      if !searchText.isEmpty {
                            let filteredPosters = posters.filter { $0.title.lowercased().contains(searchText.lowercased()) }
                            if !filteredPosters.isEmpty {
                                  SearchResultView(cartModel: cartModel, posters: filteredPosters, animation: animation)
                            } else {
                                  Text("No posters found")
                                        .font(.callout)
                                        .foregroundColor(.gray)
                            }
                      } else {
                            ForEach(posters) { poster in
                                  CardView(cartModel: cartModel, poster: poster, animation: animation)
                            }
                      }
                }
                .padding()
                .padding(.bottom, 100)
          }
    }
      
      @ViewBuilder
      func CustomMenu() -> some View {
            HStack(spacing: 0) {
                  ForEach(["All", "16 x 16", "32 x 32", "64 x 64", "128 x 128"], id: \.self) { menu in
                        Text(menu)
                              .font(.callout)
                              .fontWeight(.semibold)
                              .foregroundColor(posterModel.currentMenu != menu ? black : .white)
                              .padding(.vertical, 8)
                              .frame(maxWidth: .infinity)
                              .background {
                                    if posterModel.currentMenu == menu {
                                          Capsule()
                                                .fill(black)
                                                .shadow(color: black.opacity(0.1), radius: 5, x: 5, y: 5)
                                                .matchedGeometryEffect(id: "MENU", in: animation)
                                    }
                              }
                              .onTapGesture {
                                    withAnimation(.easeInOut) {
                                          posterModel.currentMenu = menu
                                    }
                              }
                  }
            }
            .padding(.top, 10)
            .padding(.bottom, 20)
      }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
