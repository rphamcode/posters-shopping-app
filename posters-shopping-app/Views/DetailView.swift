//
//  DetailView.swift
//  posters-shopping-app
//
//  Created by Pham on 4/27/23.
//

import SwiftUI

struct DetailView: View {
      var poster: Poster
      var animation: Namespace.ID
      
      @EnvironmentObject var posterModel: PosterViewModel
      
      @State var showDetailContent: Bool = false
      @State var activeColor: String = "Color1"
      @State var cartCount: Int = 0
      
    var body: some View {
          GeometryReader { geo in
                let size = geo.size
                
                VStack {
                      HStack {
                            Button {
                                  withAnimation(.easeInOut) {
                                        showDetailContent = false
                                  }
                                  
                                  withAnimation(.easeInOut.delay(0.05)) {
                                        posterModel.showDetailView = false
                                  }
                            } label: {
                                  Image(systemName: "chevron.left")
                                        .foregroundColor(Color("Black"))
                                        .padding(12)
                                        .background {
                                              RoundedRectangle(cornerRadius: 10, style: .continuous)
                                                    .fill(.white)
                                        }
                            }
                            
                            Spacer()
                            
                            Button {
                                  
                            } label: {
                                  Image(systemName: "suit.heart.fill")
                                        .foregroundColor(.red)
                                        .padding(12)
                                        .background {
                                              RoundedRectangle(cornerRadius: 10, style: .continuous)
                                                    .fill(.white)
                                        }
                            }
                      }
                      .padding()
                      .opacity(showDetailContent ? 1 : 0)
                      
                      Image(poster.image)
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .matchedGeometryEffect(id: poster.id + "IMAGE", in: animation)
                            .frame(height: size.height / 3)
                      
                      VStack(alignment: .leading) {
                            HStack(spacing: 10) {
                                  VStack(alignment: .leading, spacing: 5) {
                                        Text(poster.title)
                                              .font(.title.bold())
                                              .foregroundColor(Color("Black"))
                                              .fixedSize()
                                              .matchedGeometryEffect(id: poster.id + "TITLE", in: animation)
                                              .lineLimit(1)
                                        
                                        Text("by RP")
                                              .font(.caption2)
                                              .bold()
                                              .foregroundColor(.gray)
                                              .fixedSize()
                                              .matchedGeometryEffect(id: poster.id + "SUBTITLE", in: animation)
                                  }
                                  .frame(maxWidth: .infinity, alignment: .leading)
                                  
                                  Label {
                                        Text("4.8")
                                              .font(.callout)
                                              .fontWeight(.bold)
                                  } icon: {
                                        Image(systemName: "star.fill")
                                              .foregroundColor(.yellow)
                                  }
                                  .padding(.horizontal, 15)
                                  .padding(.vertical, 10)
                                  .background {
                                        Capsule()
                                              .strokeBorder(Color("Black").opacity(0.2), lineWidth: 1)
                                  }
                                  .scaleEffect(0.8)
                            }
                            
                            Text("")
                                  .font(.callout)
                                  .foregroundColor(.gray)
                                  .multilineTextAlignment(.leading)
                                  .padding(.vertical)
                            
                            HStack(spacing: 10) {
                                  Spacer()
                                  
                                  HStack(spacing: 10) {
                                        Image(systemName: "minus")
                                              .onTapGesture {
                                                    if cartCount > 0 { cartCount -= 1 }
                                              }
                                        
                                        Text("\(cartCount)")
                                        
                                        Image(systemName: "plus")
                                              .onTapGesture {
                                                    cartCount += 1
                                              }
                                  }
                                  .font(.system(size: 16, weight: .semibold))
                                  .foregroundColor(Color("Black"))
                                  .padding(.horizontal)
                                  .padding(.vertical,8)
                                  .background{
                                        Capsule()
                                              .fill(Color("Black").opacity(0.1))
                                  }
                            }
                            
                            Spacer(minLength: 5)
                            
                            Rectangle()
                                  .fill(Color("Black").opacity(0.1))
                                  .frame(height: 1)
                            
                            HStack {
                                  Text(poster.price)
                                        .font(.largeTitle.bold())
                                        .foregroundColor(Color("Black"))
                                  
                                  Spacer()
                                  
                                  Button {
                                        
                                  } label: {
                                        Text("Buy Now")
                                              .fontWeight(.semibold)
                                              .foregroundColor(.white)
                                              .padding(.vertical)
                                              .padding(.horizontal,30)
                                              .background{
                                                    Capsule()
                                                          .fill(Color("Orange"))
                                              }
                                  }
                            }
                            .padding(.bottom,5)
                      }
                      .padding(.top,35)
                      .padding(.horizontal)
                      .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
                      .background {
                            RoundedRectangle(cornerRadius: 30, style: .continuous)
                                  .fill(.white)
                                  .ignoresSafeArea()
                      }
                      .opacity(showDetailContent ? 1 : 0)
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
          }
          background {
                Color("BG")
                      .opacity(showDetailContent ? 1 : 0)
                      .ignoresSafeArea()
          }
          .onAppear {
                withAnimation(.easeInOut) {
                      showDetailContent = true
                }
          }
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
