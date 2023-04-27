//
//  CardView.swift
//  posters-shopping-app
//
//  Created by Pham on 4/27/23.
//

import SwiftUI

struct CardView: View {
      @EnvironmentObject var posterModel: PosterViewModel
      @ObservedObject var cartModel: CartViewModel
      
      var poster: Poster
      var animation: Namespace.ID
      let black: Color = Color("Black")
      
      var body: some View {
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
                                    cartModel.addToCart(poster: poster)
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
}

struct CardView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
