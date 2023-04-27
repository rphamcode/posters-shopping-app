//
//  BottomCurve.swift
//  posters-shopping-app
//
//  Created by Pham on 4/26/23.
//

import SwiftUI

struct BottomCurve: Shape {
      var currentXValue: CGFloat
      var animatableData: CGFloat {
            get { currentXValue }
            set { currentXValue = newValue }
      }
      
      func path(in rect: CGRect) -> Path {
            return Path { path in
                  path.move(to: CGPoint(x: 0, y: 0))
                  path.addLine(to: CGPoint(x: rect.width, y: 0))
                  path.addLine(to: CGPoint(x: rect.width, y: rect.height))
                  path.addLine(to: CGPoint(x: 0, y: rect.height))
                  
                  let mid = currentXValue
                  path.move(to: CGPoint(x: mid - 50, y: 0))
                  
                  let to_1 = CGPoint(x: mid, y: 35)
                  let control_1 = CGPoint(x: mid - 25, y: 0)
                  let control_2 = CGPoint(x: mid - 25, y: 35)
                  
                  path.addCurve(to: to_1, control1: control_1, control2: control_2)
                  
                  let to_2 = CGPoint(x: mid + 50, y: 0)
                  let control_3 = CGPoint(x: mid + 25, y: 35)
                  let control_4 = CGPoint(x: mid + 25, y: 0)
                  
                  path.addCurve(to: to_2, control1: control_3, control2: control_4)
            }
      }
}

struct BottomCurve_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
