//
//  ViewExtension.swift
//  posters-shopping-app
//
//  Created by Pham on 4/27/23.
//

import SwiftUI

extension View {
      func getSafeArea() -> UIEdgeInsets {
            guard let screen = UIApplication.shared.connectedScenes.first as? UIWindowScene else {
                  return .zero
            }
            
            guard let safeArea = screen.windows.first?.safeAreaInsets else {
                  return .zero
            }
            
            return safeArea
      }
      
      @ViewBuilder
      func setUpTab()->some View {
            self
                  .frame(maxWidth: .infinity, maxHeight: .infinity)
                  .background {
                        Color("BG")
                              .ignoresSafeArea()
                  }
      }
}
