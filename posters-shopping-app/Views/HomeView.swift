//
//  HomeView.swift
//  posters-shopping-app
//
//  Created by Pham on 4/27/23.
//

import SwiftUI

struct HomeView: View {
      @EnvironmentObject var posterModel: PosterViewModel
      
      var animation: Namespace.ID
      
      let black: Color = Color("Black")
      
    var body: some View {
          ScrollView(.vertical, showsIndicators: false) {
                VStack(spacing: 15) {
                      VStack(alignment: .leading, spacing: 8) {
                            Text("Best Poster")
                                  .font(.title.bold())
                            
                            Text("Great Choice!")
                                  .font(.callout)
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
                                  
                                  TextField("Search", text: .constant(""))
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
                      
                      ForEach(posters) { poster in
                            CardView(poster: poster)
                      }
                }
                .padding()
                .padding(.bottom, 100)
          }
    }
      
      @ViewBuilder
      func CardView(poster: Poster) -> some View {
            HStack(spacing: 12) {
                  Group {
                        if posterModel.currentActiveItem?.id == poster.id && posterModel.showDetailView {
                              Image(poster.image)
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .opacity(0)
                        } else {
                              Image(poster.image)
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .matchedGeometryEffect(id: poster.id + "IMAGE", in: animation)
                        }
                  }
                  .frame(width: 120)
                  .padding()
                  .background {
                        RoundedRectangle(cornerRadius: 20, style: .continuous)
                              .fill(Color("CardBG"))
                  }
                  
                  VStack(alignment: .leading, spacing: 10) {
                        Group {
                              if posterModel.currentActiveItem?.id == poster.id && posterModel.showDetailView{
                                    Text(poster.title)
                                          .fontWeight(.bold)
                                          .foregroundColor(black)
                                          .opacity(0)
                                    
                                    Text("by RP")
                                          .font(.caption2.bold())
                                          .foregroundColor(.gray)
                                          .padding(.top,-5)
                                          .opacity(0)
                              } else {
                                    Text(poster.title)
                                          .fontWeight(.bold)
                                          .foregroundColor(black)
                                          .matchedGeometryEffect(id: poster.id + "TITLE", in: animation)
                                    
                                    Text("by RP")
                                          .font(.caption2.bold())
                                          .foregroundColor(.gray)
                                          .matchedGeometryEffect(id: poster.id + "SUBTITLE", in: animation)
                                          .padding(.top,-5)
                              }
                        }
                        
                        Text(poster.subTitle)
                              .font(.system(size: 14))
                              .foregroundColor(black.opacity(0.8))
                        
                        HStack {
                              Text(poster.price)
                                    .font(.title3.bold())
                                    .foregroundColor(black)
                              
                              Spacer()
                              
                              Button {
                                    
                              } label: {
                                    Text("Buy")
                                          .font(.callout)
                                          .fontWeight(.semibold)
                                          .foregroundColor(.white)
                                          .padding(.vertical, 8)
                                          .padding(.horizontal, 20)
                                          .background {
                                                Capsule()
                                                      .fill(Color("Orange"))
                                          }
                              }
                              .scaleEffect(0.9)
                        }
                        .offset(y: 10)
                  }
                  .padding(.vertical, 10)
                  .frame(maxWidth: .infinity,maxHeight: .infinity,alignment: .topLeading)
            }
            .padding(10)
            .background {
                  RoundedRectangle(cornerRadius: 20, style: .continuous)
                        .fill(.white)
                        .shadow(color: black.opacity(0.08), radius: 5, x: 5, y: 5)
            }
            .onTapGesture(perform: {
                  withAnimation(.easeInOut) {
                        posterModel.currentActiveItem = poster
                        posterModel.showDetailView = true
                  }
            })
            .padding(.bottom, 6)
      }
      
      @ViewBuilder
      func CustomMenu() -> some View {
            HStack(spacing: 0) {
                  ForEach(["All","King Bear", "Gangster Penguin", "Playboy Lion", "Spy Raccoon"], id: \.self) { menu in
                        Text(menu)
                              .font(.callout)
                              .fontWeight(.semibold)
                              .foregroundColor(posterModel.currentMenu != menu ? black : .white)
                              .padding(.vertical,8)
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
            .padding(.top,10)
            .padding(.bottom,20)
      }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
