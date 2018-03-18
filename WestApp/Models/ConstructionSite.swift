//
//  ConstructionSite.swift
//  WestApp
//
//  Created by mathias@privat on 17.03.18.
//

import UIKit

struct ConstructionSite {
  
  var adress: Adress
  var image: UIImage
  var infoText: String
  
  struct Adress: Codable {
    var streetName: String
    var streetNumber: String
    var zipCode: String
    var cityName: String
  }
}

struct ConstructionSiteResponse: Codable {
  
  var infoText: String
  var streetName: String
  var streetNumber: String
  var zipCode: String
  var cityName: String
}

