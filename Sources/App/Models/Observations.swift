//
//  Observations.swift
//  App
//
//  Created by Kristaps Grinbergs on 09/02/2018.
//

import Foundation

struct Observations: Codable {
  let stations: [Station]
  
  enum CodingKeys: String, CodingKey {
    case stations = "station"
  }
}
