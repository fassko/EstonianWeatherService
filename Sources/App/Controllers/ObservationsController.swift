//
//  ObservationsController.swift
//  App
//
//  Created by Kristaps Grinbergs on 09/02/2018.
//

import Vapor
import HTTP
import Foundation

final class ObservationsController {
  
  func listStations(_ req: Request) throws -> ResponseRepresentable {
    
    let r = URLRequest(url: URL(string: "http://www.ilmateenistus.ee/ilma_andmed/xml/observations.php")!)
    
    let (data, response) = try! URLSession.shared.data(with: r)
    
    let decoder = XMLDecoder()
    
    let s = try? decoder.decode(Observations.self, from: data)
    
    var json = JSON()
    try json.set("stations", s?.stations)
    return json
  }
}
