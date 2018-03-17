//
//  ReportFormViewController.swift
//  WestApp
//
//  Created by mathias@privat on 17.03.18.
//

import UIKit

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
  
  // MARK: - IBActions
  
  @IBAction func send(_ sender: Any) {
    
    
  }
}

extension ReportFormViewController: UITextFieldDelegate {
  
  func textFieldShouldReturn(_ textField: UITextField) -> Bool {
    self.view.endEditing(true)
    return false
  }
}
