import Vapor
import Foundation
import HTTP


extension Droplet {
  func setupRoutes() throws {
    get("observations") {
      try ObservationsController().listStations($0)
    }
    
  }
}
