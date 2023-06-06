//
//  User.swift
//  IgListKitApp
//
//  Created by Brandon Bravos on 6/6/23.
//

import Foundation
import IGListKit

class User {
  let primaryKey: Int
  let name: String
  // implementation, etc

    init(primaryKey: Int, name: String) {
        self.primaryKey = primaryKey
        self.name = name
    }
}

extension User: ListDiffable {
    func isEqual(toDiffableObject object: ListDiffable?) -> Bool {
        if let object = object as? User {
          return name == object.name
        }
        return false
    }

  func diffIdentifier() -> NSObjectProtocol {
    return primaryKey  as NSObjectProtocol
  }
}
