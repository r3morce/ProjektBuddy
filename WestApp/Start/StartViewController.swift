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
      
    }
  }
  
  @IBOutlet weak var photoDocumentationButton: UIButton! {
    didSet {
      
    }
  }
  
  @IBOutlet weak var contactButton: UIButton! {
    didSet {
      
    }
  }
  
  // MARK: - Properties
  
  var photos: [UIImage] = []
  
  // MARK: - Lifecycle
  
  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view, typically from a nib.
  }

  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }
  
  // MARK: - IBActions
  
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

// MARK: -

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
