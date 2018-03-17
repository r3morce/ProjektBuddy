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
      needSurveyorButton.backgroundColor = Configuration.Colors.indigo
      needSurveyorButton.setTitleColor(Configuration.Colors.white, for: .normal)
    }
  }
  
  @IBOutlet weak var finishedConstructionSite: UIButton!{
    didSet {
      finishedConstructionSite.setTitle("Baustelle abgeschlossen", for: .normal)
      finishedConstructionSite.titleLabel?.font = Configuration.Fonts.button
      finishedConstructionSite.backgroundColor = Configuration.Colors.fuchsia
      finishedConstructionSite.setTitleColor(Configuration.Colors.white, for: .normal)
    }
  }
  
  // MARK: - Functions
  
  override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    if segue.identifier == "openReportForm", let reportFormViewController = segue.destination as? ReportFormViewController {
      reportFormViewController.photo = self.photo
    }
  }
  
  private func inputSelection() {
    
    let alert = UIAlertController(title: "Bild verwenden von", message: "", preferredStyle: .alert)
    

    let cameraAction = UIAlertAction(title: "Kamera", style: .default, handler: { _ in
      self.openCamera()
    })
    
    let galeryAction = UIAlertAction(title: "Gallerie", style: .default, handler: { _ in
      self.openGallery()
    })
    
    let cancelAction = UIAlertAction(title: "Abbrechen", style: .cancel, handler: nil)
    
    alert.addAction(cameraAction)
    alert.addAction(galeryAction)
    alert.addAction(cancelAction)

    self.present(alert, animated: true)
  }
  
  private func openCamera() {
    
    if UIImagePickerController.isSourceTypeAvailable(.camera) {
      
      let imagePicker = UIImagePickerController()
      imagePicker.delegate = self
      imagePicker.sourceType = .camera
      imagePicker.allowsEditing = false
      
      self.present(imagePicker, animated: true, completion: nil)
    }
  }
  
  private func openGallery() {
    
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
    
    inputSelection()
  }
  
  @IBAction func needTechnican(_ sender: Any) {
    selectedReportType = .technican
    
    inputSelection()
  }
  
  @IBAction func needSurveyor(_ sender: Any) {
    selectedReportType = .surveyor
    
    inputSelection()
  }
  
  @IBAction func finishedContructionSite(_ sender: Any) {
    selectedReportType = .finished
    
    inputSelection()
  }
}

// MARK: - UIImagePickerControllerDelegate

extension ReportSelectionViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
  
  @objc func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
    
    if let photo = info["UIImagePickerControllerEditedImage"] as? UIImage {
       self.photo = photo
      
      self.dismiss(animated: true, completion: {
        
        self.performSegue(withIdentifier: "openReportForm", sender: nil)
      })
    }
  }
}


