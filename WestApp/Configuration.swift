//
//  Configuration.swift
//  WestApp
//
//  Created by mathias@privat on 17.03.18.
//

import UIKit

class Configuration {
  
  // MARK: URLs
  
  // MARK: - Colors
  
  class Colors {
    static let yellow: UIColor = UIColor(hexString: "f59b00")
    static let purple: UIColor = UIColor(hexString: "c81e82")
    static let blue: UIColor = UIColor(hexString: "005f69")
    static let indigo: UIColor = UIColor(hexString: "00aae1")
    static let red: UIColor = UIColor(hexString: "eb4b0a")
    static let fuchsia: UIColor = UIColor(hexString: "e60050")
    static let white: UIColor = UIColor.white
    static let black: UIColor = UIColor.black
  }
  
  // MARK: - Fonts
  
  class Fonts {
    static let button = UIFont.systemFont(ofSize: 18, weight: .bold)
    static let title = UIFont.systemFont(ofSize: 24, weight: .medium)
    static let text = UIFont.systemFont(ofSize: 14, weight: .light)
  }
}
