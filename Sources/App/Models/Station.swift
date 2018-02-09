//
//  Station.swift
//  App
//
//  Created by Kristaps Grinbergs on 09/02/2018.
//

import Foundation
import SWXMLHash

struct Station {
  let name: String
//  let wmocode: Int?
  let longitude: Float
  let latitude: Float
//  let phenomenon: String?
//  let visibility: Float?
//  let precipitations: Float?
//  let airpressure: Float?
//  let relativehumidity: Float?
  let airtemperature: Float?
//  let winddirection: Int?
//  let windspeed: Float?
//  let windspeedmax: Float?
//  let waterlevel: Float?
//  let watertemperature: Float?
//  let uvindex: Float?
}

extension Station: XMLIndexerDeserializable {
  
  static func deserialize(_ node: XMLIndexer) throws -> Station {
    return try! Station(name: node["name"].value(), longitude: node["longitude"].value(), latitude: node["latitude"].value(), airtemperature: node["airtemperature"].element?.text.float)
  }
}

extension Station: JSONRepresentable {
  func makeJSON() throws -> JSON {
    var json = JSON()
    try json.set("name", name)
    try json.set("airtemperature", airtemperature)
    try json.set("longitude", longitude)
    try json.set("latitude", latitude)
    return json
  }
}
