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
  let wmocode: Int?
  let longitude: Float
  let latitude: Float
  let phenomenon: String?
  let visibility: Float?
  let precipitations: Float?
  let airpressure: Float?
  let relativehumidity: Float?
  let airtemperature: Float?
  let winddirection: Float?
  let windspeed: Float?
  let windspeedmax: Float?
  let waterlevel: Float?
  let watertemperature: Float?
  let uvindex: Float?
}

extension Station: XMLIndexerDeserializable {
  
  static func deserialize(_ node: XMLIndexer) throws -> Station {
    return try! Station(name: node["name"].value(),
                        wmocode: node["wmocode"].element?.text.int,
                        longitude: node["longitude"].value(),
                        latitude: node["latitude"].value(),
                        phenomenon: node["phenomenon"].element?.text,
                        visibility: node["visibility"].element?.text.float,
                        precipitations: node["precipitations"].element?.text.float,
                        airpressure: node["airpressure"].element?.text.float,
                        relativehumidity: node["relativehumidity"].element?.text.float,
                        airtemperature: node["airtemperature"].element?.text.float,
                        winddirection: node["winddirection"].element?.text.float,
                        windspeed: node["windspeed"].element?.text.float,
                        windspeedmax: node["windspeedmax"].element?.text.float,
                        waterlevel: node["waterlevel"].element?.text.float,
                        watertemperature: node["watertemperature"].element?.text.float,
                        uvindex: node["uvindex"].element?.text.float)
  }
}

extension Station: JSONRepresentable {
  func makeJSON() throws -> JSON {
    var json = JSON()
    try json.set("name", name)
    try json.set("airtemperature", airtemperature)
    try json.set("longitude", longitude)
    try json.set("latitude", latitude)
    
    if let wmocode = wmocode {
      try json.set("wmocode", wmocode)
    }
    
    if let phenomenon = phenomenon {
      try json.set("phenomenon", phenomenon)
    }
    
    if let visibility = visibility {
      try json.set("visibility", visibility)
    }
    
    if let precipitations = precipitations {
      try json.set("precipitations", precipitations)
    }
    
    if let airpressure = airpressure {
      try json.set("airpressure", airpressure)
    }
    
    if let relativehumidity = relativehumidity {
      try json.set("relativehumidity", relativehumidity)
    }
    
    if let winddirection = winddirection {
      try json.set("winddirection", winddirection)
    }
    
    if let windspeedmax = windspeedmax {
      try json.set("windspeedmax", windspeedmax)
    }
    
    if let waterlevel = waterlevel {
      try json.set("waterlevel", waterlevel)
    }
    
    if let watertemperature = watertemperature {
      try json.set("watertemperature", watertemperature)
    }
    
    if let uvindex = watertemperature {
      try json.set("watertemperature", uvindex)
    }
    
    return json
  }
}
