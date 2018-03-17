//
//  ConstructionSiteView.swift
//  WestApp
//
//  Created by mathias@privat on 17.03.18.
//

import UIKit

class ConstructionSiteView: UIView {
  
  // MARK: - Properties
  
  private var constructionSite: ConstructionSite!
  private var imageView: UIImageView! {
    didSet {
      imageView.translatesAutoresizingMaskIntoConstraints = false
    }
  }
  private var streetNameLabel: UILabel! {
    didSet {
      streetNameLabel.translatesAutoresizingMaskIntoConstraints = false
    }
  }
  private var infoLabel: UILabel! {
    didSet {
      infoLabel.translatesAutoresizingMaskIntoConstraints = false
    }
  }
  
  private var views: [String: Any] {
    return [
      "imageView": imageView,
      "streetNameLabel": streetNameLabel,
      "infoLabel": infoLabel
    ]
  }
  
  // MARK: - Lifecycle
  
  init(constructionSite: ConstructionSite) {
    super.init(frame: CGRect(x: 0, y: 0, width: 10, height: 10))
    
    self.constructionSite = constructionSite
    setup()
  }
  
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  // MARK: - Functions
  
  private func setup() {
    
    guard let constructionSite = constructionSite else {
      fatalError("construction site not found")
    }
    
    backgroundColor = Configuration.Colors.fuchsia
    
    imageView = UIImageView()
    addSubview(imageView)
    
    streetNameLabel = UILabel()
    addSubview(streetNameLabel)
    
    infoLabel = UILabel()
    addSubview(infoLabel)
    
    imageView?.image = constructionSite.image
    streetNameLabel?.text = constructionSite.adress.streetName + " " + constructionSite.adress.streetNumber
    
    constraint()
  }
  
  private func constraint() {
    
    var constraints: [NSLayoutConstraint] = []
    
    constraints += NSLayoutConstraint.constraints(withVisualFormat: "H:|-[imageView(120)]-[streetNameLabel]-|", metrics: nil, views: views)
    constraints += NSLayoutConstraint.constraints(withVisualFormat: "V:|-[imageView(120)]-|", metrics: nil, views: views)
    
    NSLayoutConstraint.activate(constraints)
  }
}
