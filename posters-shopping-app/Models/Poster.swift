//
//  Poster.swift
//  posters-shopping-app
//
//  Created by Pham on 4/26/23.
//

import Foundation

struct Poster: Identifiable, Hashable {
      var id: String = UUID().uuidString
      var title: String
      var image: String
      var subTitle: String
      var price: String
}

var posters: [Poster] = [
      Poster(title: "King Bear", image: "Poster-1", subTitle: "Proud king bear.", price: "$29.99"),
      Poster(title: "Gangster Penguin", image: "Poster-2", subTitle: "A gangster penguin", price: "$29.99"),
      Poster(title: "Bear Force", image: "Poster-3", subTitle: "A special force team of polar bears", price: "$29.99"),
      Poster(title: "Playboy Lion", image: "Poster-4", subTitle: "A playboy lion", price: "$29.99"),
      Poster(title: "Insect Invasion", image: "Poster-5", subTitle: "An invasion from the army of bee and ant", price: "$29.99")
]
