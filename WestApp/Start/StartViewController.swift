//
//  FirstViewController.swift
//  WestApp
//
//  Created by mathias@privat on 17.03.18.
//

import UIKit

class StartViewController: UIViewController {
  
  // MARK: - IBOutlets
  
  @IBOutlet weak var presenceButton: UIButton! {
    didSet {
      presenceButton.titleLabel?.font = Configuration.Fonts.button
      presenceButton.backgroundColor = Configuration.Colors.yellow
      presenceButton.setTitleColor(Configuration.Colors.white, for: .normal)
    }
  }
  
  @IBOutlet weak var photoDocumentationButton: UIButton! {
    didSet {
      photoDocumentationButton.titleLabel?.font = Configuration.Fonts.button
      photoDocumentationButton.backgroundColor = Configuration.Colors.purple
      photoDocumentationButton.setTitleColor(Configuration.Colors.white, for: .normal)
    }
  }
  
  @IBOutlet weak var contactButton: UIButton! {
    didSet {
      contactButton.titleLabel?.font = Configuration.Fonts.button
      contactButton.backgroundColor = Configuration.Colors.indigo
      contactButton.setTitleColor(Configuration.Colors.white, for: .normal)
    }
  }
  
  // MARK: - Properties
  
  var photos: [UIImage] = []
  
  var currentConstructionSite: ConstructionSite {
    
    let adress = ConstructionSite.Adress(streetName: "Teststrasse", streetNumber: "2b", zipCode: "54478", cityName: "Essen")
    let image = UIImage(named: "construction site")!
    
    let loremIpsum = """
    Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet. Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed d
    """
    
    return ConstructionSite(adress: adress, image: image, infoText: loremIpsum)
  }
  
  // MARK: - Lifecycle
  
  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view, typically from a nib.
  }

  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }
  
  // MARK: - Functions
  
  override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    
    print("segue")
    
    if segue.identifier == "openLoginViewController", let loginViewController = segue.destination as? LoginViewController {
      loginViewController.constructionSite = currentConstructionSite
    }
  }
  
  // MARK: - IBActions
  
  
  @IBAction func openLoginViewController(_ sender: Any) {
    performSegue(withIdentifier: "openLoginViewController", sender: nil)
  }
  
  
  @IBAction func openPhotoLibraryButton(sender: AnyObject) {
    if UIImagePickerController.isSourceTypeAvailable(UIImagePickerControllerSourceType.photoLibrary) {
      
      let imagePicker = UIImagePickerController()
      imagePicker.delegate = self
      imagePicker.sourceType = UIImagePickerControllerSourceType.photoLibrary;
      imagePicker.allowsEditing = true
      
      self.present(imagePicker, animated: true, completion: nil)
    }
  }
}

// MARK: - UIImagePickerControllerDelegate, UINavigationControllerDelegate

extension StartViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
  
  func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
    
    if let photo = info["UIImagePickerControllerEditedImage"] as? UIImage {
      photos.append(photo)
    } else {
      print("Something went wrong")
    }
    
    self.dismiss(animated: true, completion: nil)
  }
}

