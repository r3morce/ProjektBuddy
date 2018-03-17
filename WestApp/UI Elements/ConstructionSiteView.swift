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
  private var imageView: UIImageView!
  private var streetNameLabel: UILabel!
  private var infoLabel: UILabel!
  
  private var views: [String: Any] {
    return [
      "imageView": imageView,
      "streetNameLabel": streetNameLabel,
      "infoLabel": infoLabel
    ]
  }
  
  // MARK: - Lifecycle
  
  init(constructionSite: ConstructionSite) {
    super.init(frame: CGRect.zero)
    
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
    
    NSLayoutConstraint.constraints(withVisualFormat: "H:|-[imageView]-[streetNameLabel]-|", options: [], metrics: [:], views: views)
    NSLayoutConstraint.constraints(withVisualFormat: "V:|-[imageView]-|", options: [], metrics: [:], views: views)
  }
}
