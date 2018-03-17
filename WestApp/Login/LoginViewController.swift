//
//  LoginViewController.swift
//  WestApp
//
//  Created by mathias@privat on 17.03.18.
//

import UIKit

class LoginViewController: UIViewController {
  
  // MARK: - IBOutlets
  
  @IBOutlet weak var constructionSiteContainerView: UIView! {
    didSet {
      setup()
    }
  }
  
  // MARK: - Properties
  
  var constructionSite: ConstructionSite? {
    didSet {
      setup()
    }
  }
  
  // MARK: - Lifecycle
  
  
  // MARK: - Functions
  
  private func setup() {
    
    guard let constructionSite = constructionSite else {
      fatalError("construction site missing")
    }
    
    let constructionSiteView = ConstructionSiteView(constructionSite: constructionSite)
  }
}
