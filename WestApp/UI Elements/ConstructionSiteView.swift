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
      
      imageView.translatesAutoresizingMaskIntoConstraints = false
      imageView.contentMode = .scaleAspectFill
      imageView.clipsToBounds = true
    }
  }
  
  private var streetNameLabel: UILabel! {
    didSet {
      streetNameLabel.translatesAutoresizingMaskIntoConstraints = false
      
      streetNameLabel.font = Configuration.Fonts.title
      streetNameLabel.textColor = Configuration.Colors.black
    }
  }
  
  private var streetNumberLabel: UILabel! {
    didSet {
      streetNumberLabel.translatesAutoresizingMaskIntoConstraints = false
      
      streetNumberLabel.font = Configuration.Fonts.title
      streetNumberLabel.textColor = Configuration.Colors.black
    }
  }
  
  private var infoLabel: UILabel! {
    didSet {
      infoLabel.translatesAutoresizingMaskIntoConstraints = false
      
      infoLabel.textColor = Configuration.Colors.black
      
      infoLabel.numberOfLines = 0
      infoLabel.lineBreakMode = .byWordWrapping
    }
  }
  
  private var views: [String: Any] {
    return [
      "imageView": imageView,
      "streetNameLabel": streetNameLabel,
      "streetNumberLabel": streetNumberLabel,
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
    
    backgroundColor = Configuration.Colors.white
    
    imageView = UIImageView()
    addSubview(imageView)
    
    streetNameLabel = UILabel()
    addSubview(streetNameLabel)
    
    streetNumberLabel = UILabel()
    addSubview(streetNumberLabel)
    
    infoLabel = UILabel()
    addSubview(infoLabel)
    
    imageView?.image = constructionSite.image
    streetNameLabel?.text = constructionSite.adress.streetName
    streetNumberLabel.text = constructionSite.adress.streetNumber
    infoLabel.text = constructionSite.infoText
    
    constraint()
  }
  
  private func constraint() {
    
    var constraints: [NSLayoutConstraint] = []
    
    constraints += NSLayoutConstraint.constraints(withVisualFormat: "H:|-[imageView(120)]-[streetNameLabel]-[streetNumberLabel(>=20@800)]", options: [.alignAllTop], metrics: nil, views: views)
    constraints += NSLayoutConstraint.constraints(withVisualFormat: "H:[imageView]-[infoLabel]-|", metrics: nil, views: views)
    
    constraints += NSLayoutConstraint.constraints(withVisualFormat: "V:|-[imageView]-|", metrics: nil, views: views)
    constraints += NSLayoutConstraint.constraints(withVisualFormat: "V:|-[streetNameLabel]-[infoLabel]-|", metrics: nil, views: views)
    constraints += NSLayoutConstraint.constraints(withVisualFormat: "V:|-[streetNumberLabel]-[infoLabel]", metrics: nil, views: views)
    
    NSLayoutConstraint.activate(constraints)
  }
}
