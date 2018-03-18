//
//  FirstViewController.swift
//  WestApp
//
//  Created by mathias@privat on 17.03.18.
//

import UIKit

protocol ConstructionSiteDelegate {
  func didSelect(constructionSite: ConstructionSite)
}

class StartViewController: UIViewController {
  
  // MARK: - IBOutlets
  
  @IBOutlet weak var presenceButton: UIButton! {
    didSet {
      presenceButton.setTitle("Ankunft", for: .normal)
      presenceButton.titleLabel?.font = Configuration.Fonts.button
      presenceButton.backgroundColor = Configuration.Colors.yellow
      presenceButton.setTitleColor(Configuration.Colors.white, for: .normal)
      
      presenceButton.titleLabel?.lineBreakMode = .byWordWrapping
    }
  }
  
  @IBOutlet weak var photoDocumentationButton: UIButton! {
    didSet {
      photoDocumentationButton.setTitle("Meldungsfall", for: .normal)
      photoDocumentationButton.titleLabel?.font = Configuration.Fonts.button
      photoDocumentationButton.backgroundColor = Configuration.Colors.purple
      photoDocumentationButton.setTitleColor(Configuration.Colors.white, for: .normal)
    }
  }
  
  @IBOutlet weak var contactButton: UIButton! {
    didSet {
      contactButton.setTitle("Kontakt", for: .normal)
      contactButton.titleLabel?.font = Configuration.Fonts.button
      contactButton.backgroundColor = Configuration.Colors.indigo
      contactButton.setTitleColor(Configuration.Colors.white, for: .normal)
    }
  }
  
  // MARK: - Properties
  
  var photos: [UIImage] = []
  
  var currentConstructionSite: ConstructionSite? {
    didSet {
      
      if let adress = currentConstructionSite?.adress {
      let text = "\(adress.streetName) \(adress.streetNumber)\n\(adress.zipCode) \(adress.cityName)"
        presenceButton.setTitle(text, for: .normal)
      } else {
        presenceButton.setTitle("Ankunft", for: .normal)
      }
    }
  }
  
  // MARK: - Lifecycle
  
  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view, typically from a nib.
    
    title = "Westnetz Projekt Buddy"
  }

  // MARK: - Functions
  
  override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    
    if segue.identifier == "openLoginViewController", let loginViewController = segue.destination as? LoginViewController {
      loginViewController.delegate = self
      
    }
  }
  
  // MARK: - IBActions
  
  @IBAction func openLoginViewController(_ sender: Any) {
    performSegue(withIdentifier: "openLoginViewController", sender: nil)
  }
  
  @IBAction func openReportViewController(_ sender: Any) {
    performSegue(withIdentifier: "openReportViewController", sender: nil)
  }
}

extension StartViewController: ConstructionSiteDelegate {
  
  func didSelect(constructionSite: ConstructionSite) {
    self.currentConstructionSite = constructionSite
  }
}
