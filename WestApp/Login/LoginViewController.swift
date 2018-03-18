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
  
  var currentConstructionSite: ConstructionSite? {
    didSet {
      setup()
    }
  }
  
  var delegate: ConstructionSiteDelegate?
  
  // MARK: - Lifecycle
  
  required init?(coder aDecoder: NSCoder) {
    super.init(coder: aDecoder)
    
    let adress = ConstructionSite.Adress(streetName: "Teststrasse", streetNumber: "2b", zipCode: "54478", cityName: "Essen")
    let image = UIImage(named: "construction site")!
    
    let loremIpsum = """
    Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet. Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed d
    """
    
    currentConstructionSite = ConstructionSite(adress: adress, image: image, infoText: loremIpsum)
  }
  
  // MARK: - Functions
  
  private func setup() {
    
    guard constructionSiteContainerView != nil, let currentConstructionSite = currentConstructionSite else {
      return
    }
    
    let constructionSiteView = ConstructionSiteView(constructionSite: currentConstructionSite)
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
    
    if let currentConstructionSite = currentConstructionSite {
      delegate?.didSelect(constructionSite: currentConstructionSite)
    } else {
      fatalError("No construction site selected")
    }
    
    navigationController?.popViewController(animated: true)
  }
}
