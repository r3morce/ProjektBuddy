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
  
  @IBOutlet weak var acceptButton: UIButton!  {
    didSet {
      acceptButton.setTitle("Ankuft bestätigen", for: .normal)
      acceptButton.titleLabel?.font = Configuration.Fonts.button
      acceptButton.setTitleColor(Configuration.Colors.white, for: .normal)
      acceptButton.backgroundColor = Configuration.Colors.indigo
    }
  }
  
  @IBOutlet weak var chooseConstructionSiteButton: UIButton! {
    didSet {
      chooseConstructionSiteButton.setTitle("Andere Baustelle auswählen", for: .normal)
    chooseConstructionSiteButton.setTitleColor(Configuration.Colors.white, for: .normal)
      chooseConstructionSiteButton.backgroundColor = Configuration.Colors.yellow
    }
  }
  
  // MARK: - Properties
  
  var constructionSite: ConstructionSite? {
    didSet {
      setup()
    }
  }
  
  // MARK: - Lifecycle
  
  required init?(coder aDecoder: NSCoder) {
    super.init(coder: aDecoder)
  }
  
  
  // MARK: - Functions
  
  private func setup() {
    
    print("constructionSite: \(String(describing: constructionSite))")
    print("constructionSiteContainerView: \(constructionSiteContainerView)")
    
    guard constructionSiteContainerView != nil, let constructionSite = constructionSite else {
      return
    }
    
    let constructionSiteView = ConstructionSiteView(constructionSite: constructionSite)
    constructionSiteView.translatesAutoresizingMaskIntoConstraints = false
    constructionSiteContainerView.addSubview(constructionSiteView)

    var constraints: [NSLayoutConstraint] = []
    let views: [String: Any] = ["constructionSiteView": constructionSiteView]
    
    constraints += NSLayoutConstraint.constraints(withVisualFormat: "H:|-0-[constructionSiteView]-0-|", metrics: nil, views: views)
    constraints += NSLayoutConstraint.constraints(withVisualFormat: "V:|-0-[constructionSiteView]-0-|", metrics: nil, views: views)
    
    NSLayoutConstraint.activate(constraints)
  }
  
  // MARK: - IBAction
  
  @IBAction func acceptConstructionSite() {
    
    navigationController?.popViewController(animated: true)
  }
}
