//
//  PersonViewController.swift
//  FirebaseData
//
//  Created by Kelvin Lau on 2016-10-18.
//  Copyright © 2016 Kelvin Lau. All rights reserved.
//

import UIKit
import Firebase

final class PersonViewController: UIViewController {
  @IBOutlet fileprivate var tableView: UITableView!
  
  fileprivate var people: [Person] = []
  
  fileprivate let personRef = FIRDatabase.database().reference().child("people")
  fileprivate var handles: [FIRDatabaseHandle] = []
  
  deinit {
    handles.forEach {
      personRef.removeObserver(withHandle: $0)
    }
  }
}

// MARK: - Life Cycle
extension PersonViewController {
  override func viewDidLoad() {
    super.viewDidLoad()
    
    let personHandle = personRef.observe(.childAdded, with: { snapshot in
      guard let personDict = snapshot.value as? [String: Any] else { return print("couldn't cast") }
      let person = Person(dictionary: personDict)
      self.people.append(person)
      self.tableView.insertRows(at: [IndexPath(row: self.people.count - 1, section: 0)], with: .automatic)
    })
    
    handles.append(personHandle)
  }
}

// MARK: - UITableViewDataSource
extension PersonViewController: UITableViewDataSource {
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
    cell.textLabel?.text = people[indexPath.row].name
    return cell
  }
  
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return people.count
  }
}

// MARK: - @IBActions
private extension PersonViewController {
  @IBAction func addButtonTapped() {
    let alertController = UIAlertController(title: "Add a Person", message: nil, preferredStyle: .alert)
    
    alertController.addTextField { textField in
      textField.placeholder = "Name"
    }
    
    let okAction = UIAlertAction(title: "OK", style: .default) { _ in
      guard let name = alertController.textFields?[0].text else { fatalError() }
      let person = Person(name: name)
      Server.save(person: person)
    }
    
    let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
    
    alertController.addAction(okAction)
    alertController.addAction(cancelAction)
    
    present(alertController, animated: true, completion: nil)
  }
}
