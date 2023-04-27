//
//  CustomTabBarView.swift
//  posters-shopping-app
//
//  Created by Pham on 4/27/23.
//

import SwiftUI

struct CustomTabBarView: View {
      @Binding var currentTab: Tab
      @State var currentXValue: CGFloat = 0
      
      var animation: Namespace.ID
      
    var body: some View {
          HStack(spacing: 0) {
                ForEach(Tab.allCases, id: \.rawValue) { tab in
                      TabButton(tab: tab)
                            .overlay {
                                  Text(tab.rawValue)
                                        .font(.system(size: 14, weight: .semibold))
                                        .foregroundColor(Color("Black"))
                                        .offset(y: currentTab == tab ? 15 : 100)
                            }
                }
          }
          .padding(.top)
          .padding(.bottom, getSafeArea().bottom == 0 ? 15 : 10)
          .background {
                Color.white
                      .shadow(color: Color("Black").opacity(0.08), radius: 5, x: 0, y: -5)
                      .clipShape(BottomCurve(currentXValue: currentXValue))
                      .ignoresSafeArea(.container, edges: .bottom)
          }
    }
      
      @ViewBuilder
      func TabButton(tab: Tab) -> some View {
            GeometryReader { geo in
                  Button {
                        withAnimation(.easeInOut) {
                              currentTab = tab
                              currentXValue = geo.frame(in: .global).midX
                        }
                  } label: {
                        Image(tab.rawValue)
                              .resizable()
                              .renderingMode(.template)
                              .aspectRatio(contentMode: .fit)
                              .frame(width: 25, height: 25)
                              .frame(maxWidth: .infinity)
                              .foregroundColor(currentTab == tab ? .white : .gray.opacity(0.8))
                              .padding(currentTab == tab ? 15 : 0)
                              .background(
                                    ZStack {
                                          if currentTab == tab {
                                                Circle()
                                                      .fill(Color("Orange"))
                                                      .shadow(color: Color("Black").opacity(0.1), radius: 8, x: 5, y: 5)
                                                      .matchedGeometryEffect(id: "TAB", in: animation)
                                          }
                                    }
                              )
                              .contentShape(Rectangle())
                              .offset(y: currentTab == tab ? -50 : 0)
                  }
                  .onAppear {
                        if tab == Tab.allCases.first && currentXValue == 0 {
                              currentXValue = geo.frame(in: .global).midX
                        }
                  }
            }
            .frame(height: 30)
      }
}

struct CustomTabBarView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
