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
  
  struct Adress {
    var streetName: String
    var streetNumber: String
    var zipCode: String
    var cityName: String
  }
}
