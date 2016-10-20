//
//  Person.swift
//  FirebaseData
//
//  Created by Kelvin Lau on 2016-10-18.
//  Copyright © 2016 Kelvin Lau. All rights reserved.
//

import Foundation

struct Person {
  var uid: UUID
  var name: String
  
  init(uid: UUID = UUID(), name: String) {
    self.uid = uid
    self.name = name
  }
}

// MARK: - FirebaseConvertible
extension Person: FirebaseConvertible {
  var json: [String: Any] {
    return [
      "uid": uid.uuidString,
      "name": name
    ]
  }
  
  init(dictionary: [String: Any]) {
    guard let uuidString = dictionary["uid"] as? String, let uid = UUID(uuidString: uuidString) else { fatalError() }
    self.uid = uid
    guard let name = dictionary["name"] as? String else { fatalError() }
    self.name = name
  }
}
