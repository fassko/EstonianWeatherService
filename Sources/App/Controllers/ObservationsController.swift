//
//  ObservationsController.swift
//  App
//
//  Created by Kristaps Grinbergs on 09/02/2018.
//

import Vapor
import HTTP
import Foundation
import SWXMLHash

final class ObservationsController {
  
  func listStations(_ req: Request, droplet: Droplet) throws -> ResponseRepresentable {
    
    let r = URLRequest(url: URL(string: "http://www.ilmateenistus.ee/ilma_andmed/xml/observations.php")!)
    
    let (data, response) = try! URLSession.shared.data(with: r)
    let xml = SWXMLHash.lazy(data)
    
    let stations: [Station] = xml["observations"]["station"].all.map { elem -> Station in
      Station(name: (elem["name"].element?.text)!)
    }
    
    var json = JSON()
    try json.set("stations", stations)
    return json
  }
}
