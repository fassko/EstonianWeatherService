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
    
    let resp = try droplet.client.get("http://www.ilmateenistus.ee/ilma_andmed/xml/observations.php")
    var json = JSON()
    
    guard let body = resp.body.makeBody().bytes else { return json }
    
    let data = Data(bytes: body, count: body.count)
    
    let xml = SWXMLHash.lazy(data)

    let stations: [Station] = xml["observations"]["station"].all.map { elem -> Station in
      Station(name: (elem["name"].element?.text)!)
    }
    
    
    try json.set("stations", stations)
    return json
  }
}
