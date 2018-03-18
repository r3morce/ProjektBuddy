//
//  SecondViewController.swift
//  WestApp
//
//  Created by mathias@privat on 17.03.18.
//

import UIKit
import Alamofire

class SecondViewController: UIViewController {

  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view, typically from a nib.
  }

  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }

  @IBAction func sendSMS(_ sender: Any) {
    
    
    guard let image: UIImage = UIImage(named:"construction site") else {
      return
    }
    
    guard let imageData: NSData = UIImagePNGRepresentation(image) as NSData? else {
      return
    }
    
    let strBase64 = imageData.base64EncodedString(options: .lineLength64Characters)
    
    let parameters = [
      "test": "this is my value"
    ]
    
//    Alamofire.request(Configuration.URLs.api).response(completionHandler: { response in
//      print("response: \(response.response)")
//    })
    
    Alamofire.request("https://projektbuddy-e403a.firebaseio.com/test.json", method: .post, parameters: parameters, headers: ["Content-Type": "application/json"]).response(completionHandler: { response in


    
//    Alamofire.request(Configuration.URLs.api, method: .post, parameters: parameters, headers: ["Content-Type": "application/json"]).response(completionHandler: { response in

      print(response.response?.allHeaderFields as Any)
      print(response.response?.statusCode as Any)
    })
  }
  
  
}

