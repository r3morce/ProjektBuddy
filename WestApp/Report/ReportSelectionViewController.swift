//
//  ReportViewController.swift
//  WestApp
//
//  Created by mathias@privat on 17.03.18.
//

import UIKit

class ReportSelectionViewController: UIViewController {
  
  // MARK: - Enum
  
  enum ReportType {
    case progress
    case technican
    case surveyor
    case finished
  }
  
  // MARK: - Properties
  
  var selectedReportType: ReportType?
  var photo: UIImage?
  
  // MARK: - IBOutlets
  
  @IBOutlet weak var progressReportButton: UIButton!{
    didSet {
      progressReportButton.setTitle("Bauabschnittsmeldung", for: .normal)
      progressReportButton.titleLabel?.font = Configuration.Fonts.button
      progressReportButton.backgroundColor = Configuration.Colors.yellow
      progressReportButton.setTitleColor(Configuration.Colors.white, for: .normal)
    }
  }
  
  @IBOutlet weak var needTechnicanButton: UIButton!{
    didSet {
      needTechnicanButton.setTitle("Techniker wird benötigt", for: .normal)
      needTechnicanButton.titleLabel?.font = Configuration.Fonts.button
      needTechnicanButton.backgroundColor = Configuration.Colors.purple
      needTechnicanButton.setTitleColor(Configuration.Colors.white, for: .normal)
    }
  }
  
  @IBOutlet weak var needSurveyorButton: UIButton!{
    didSet {
      needSurveyorButton.setTitle("Vermesser wird benötigt", for: .normal)
      needSurveyorButton.titleLabel?.font = Configuration.Fonts.button
      needSurveyorButton.backgroundColor = Configuration.Colors.fuchsia
      needSurveyorButton.setTitleColor(Configuration.Colors.white, for: .normal)
    }
  }
  
  @IBOutlet weak var finishedConstructionSite: UIButton!{
    didSet {
      finishedConstructionSite.setTitle("Baustelle abgeschlossen", for: .normal)
      finishedConstructionSite.titleLabel?.font = Configuration.Fonts.button
      finishedConstructionSite.backgroundColor = Configuration.Colors.indigo
      finishedConstructionSite.setTitleColor(Configuration.Colors.white, for: .normal)
    }
  }
  
  // MARK: - Functions
  
  private func openImagePicker() {
    if UIImagePickerController.isSourceTypeAvailable(UIImagePickerControllerSourceType.photoLibrary) {
      
      let imagePicker = UIImagePickerController()
      imagePicker.delegate = self
      imagePicker.sourceType = UIImagePickerControllerSourceType.photoLibrary;
      imagePicker.allowsEditing = true
      
      self.present(imagePicker, animated: true, completion: nil)
    }
  }
  
  // MARK: - IBActions
  
  @IBAction func reportProgress(_ sender: Any) {
    selectedReportType = .progress
    
    openImagePicker()
  }
  
  @IBAction func needTechnican(_ sender: Any) {
    selectedReportType = .technican
    
    openImagePicker()
  }
  
  @IBAction func needSurveyor(_ sender: Any) {
    selectedReportType = .surveyor
    
    openImagePicker()
  }
  
  @IBAction func finishedContructionSite(_ sender: Any) {
    selectedReportType = .finished
    
    openImagePicker()
  }
}

// MARK: - UIImagePickerControllerDelegate

extension ReportSelectionViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
  
  func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
    
    if let photo = info["UIImagePickerControllerEditedImage"] as? UIImage {
      self.photo = photo
    } else {
      print("Something went wrong")
    }
    
    self.dismiss(animated: true, completion: {
      
//      self.performSegue(withIdentifier: "openReportForm", sender: nil)
    })
  }
}


