//
//  ReportFormViewController.swift
//  WestApp
//
//  Created by mathias@privat on 17.03.18.
//

import UIKit
import Alamofire

class ReportFormViewController: UIViewController {
  
  // MARK: - Properties
  
  var photo: UIImage? {
    didSet {
      setup()
    }
  }
  
  // MARK: - IBOutlets
  
  
  @IBOutlet weak var photoToSend: UIImageView!{
    didSet {
      photoToSend.contentMode = .scaleAspectFit
      photoToSend.backgroundColor = Configuration.Colors.yellow
      setup()
    }
  }
  
  @IBOutlet weak var textFieldBackgroundView: UIView! {
    didSet {
      textFieldBackgroundView.backgroundColor = Configuration.Colors.purple
    }
  }
  
  @IBOutlet weak var textField: UITextField!{
    didSet {
      textField.text = ""
      textField.textColor = Configuration.Colors.white
      
      textField.backgroundColor = Configuration.Colors.purple
      textField.borderStyle = .none
      
      textField.font = Configuration.Fonts.inputText
      textField.returnKeyType = .done
      
      textField.delegate = self
      textField.becomeFirstResponder()
    }
  }
  
  @IBOutlet weak var sendButton: UIButton! {
    didSet {
      sendButton.setTitle("Senden", for: .normal)
      sendButton.titleLabel?.font = Configuration.Fonts.button
      sendButton.backgroundColor = Configuration.Colors.indigo
      sendButton.setTitleColor(Configuration.Colors.white, for: .normal)
    }
  }
  
  // MARK: - Functions
  
  private func setup() {
    photoToSend?.image = photo
  }
  
  private func sendSMS() {
    
    let parameters: Parameters = [
      "phone": "+491123456789",
      "message": textField.text! + " // Störung auf Baustelle Mittelstrasse 2b, 66128 Saarbrücken-Gersweiler",
      "key": "c26be6ff8efde65e5fe79e222b79e46d29efa2b5DEQLerDZ1vj5FsrAcFpI9H6Pb"
    ]
    
    Alamofire.request("https://textbelt.com/text", method: .post, parameters: parameters)
  }
  
  private func uploadPhoto() {
    
    let alert = UIAlertController(title: "Meldung gesendet.", message: "SMS an Firma Kurzschluss GmbH ist raus.", preferredStyle: .alert)
    
    alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: { _ in
      self.navigationController?.popToRootViewController(animated: true)
    }))
    
    self.present(alert, animated: true)
    
    
    
    
//    let parameters: Parameters = [
//      "text": ""
////      "image": photo.enco,
////      "type": "",
////      "incidentDate": "",
////      "projectId": "",
////      "latitude": "",
////      "longitude": ""
//    ]
//
//    Alamofire.request("https://textbelt.com/text", method: .post, parameters: parameters)
  }
  
  // MARK: - IBActions
  
  @IBAction func send(_ sender: Any) {
    sendSMS()
    uploadPhoto()
    
  }
}

extension ReportFormViewController: UITextFieldDelegate {
  
  func textFieldShouldReturn(_ textField: UITextField) -> Bool {
    self.view.endEditing(true)
    return false
  }
}
