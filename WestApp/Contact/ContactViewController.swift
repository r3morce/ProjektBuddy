//
//  ContactViewController.swift
//  WestApp
//
//  Created by mathias@privat on 17.03.18.
//

import UIKit

class ContactViewController: UITableViewController {
  
  // MARK: - Properties
  
  private var contacts: [Contact] = [
    Contact(name: "Mathias Schmidt", phone: "+0123456789", email: "roteaugen@gmx.net", companyName: "ACME Hacking"),
    Contact(name: "Khai Ho", phone: "+0123456789", email: "khaiho@gmx.net", companyName: "ACME Hacking"),
    Contact(name: "Philipp Designboi", phone: "+0123456789", email: "miomao@gmx.net", companyName: "Apple Headquarters"),
    Contact(name: "Leisure Suit Larry", phone: "+0123456789", email: "peanutbutterlover@gmx.net", companyName: "Lucasarts")
  ]
  
  // MARK: - IBOutlets
  
  // MARK: - Delegate Functions
  
  override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
    return 88
  }
  
  override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return contacts.count
  }
  
  override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    
    let cell = UITableViewCell(style: .subtitle, reuseIdentifier: "")
    
    cell.textLabel?.text = contacts[indexPath.row].name
    cell.textLabel?.font = Configuration.Fonts.button
    
    cell.detailTextLabel?.text = contacts[indexPath.row].companyName
    cell.detailTextLabel?.font = Configuration.Fonts.text
    
    
    
    return cell
  }
  
  override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    
    if let url = URL(string: "tel://\(contacts[indexPath.row].phone)"), UIApplication.shared.canOpenURL(url) {
      
      UIApplication.shared.open(url, options: [:], completionHandler: nil)
      
    } else {
      
      let alert = UIAlertController(title: "Keine Telefonnummer hinterlegt.", message: "", preferredStyle: .alert)
      alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
      
      self.present(alert, animated: true)
    }
  }
}

