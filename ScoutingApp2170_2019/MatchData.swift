//
//  MatchData.swift
//  ScoutingApp2170_2019
//
//  Created by Leonard Liu on 2/26/19.
//  Copyright © 2019 Leonard Liu. All rights reserved.
//

import Foundation
import Firebase

struct MatchData {
    
    let ref: DatabaseReference?
    let key: String
    let name: String
    let data: String
    let addedByUser: String
    var completed: Bool
    
    init(name: String, addedByUser: String, completed: Bool, key: String = "", data: String) {
        self.ref = nil
        self.key = key
        self.name = name
        self.addedByUser = addedByUser
        self.completed = completed
        self.data = data
    }
    
    init?(snapshot: DataSnapshot) {
        guard
            let value = snapshot.value as? [String: AnyObject],
            let name = value["name"] as? String,
            let addedByUser = value["addedByUser"] as? String,
            let data = value["data"] as? String,
            let completed = value["completed"] as? Bool else {
                return nil
        }
        
        self.ref = snapshot.ref
        self.key = snapshot.key
        self.name = name
        self.addedByUser = addedByUser
        self.completed = completed
        self.data = data
    }
    
    func toAnyObject() -> Any {
        return [
            "name": name,
            "addedByUser": addedByUser,
            "completed": completed,
            "data": data
        ]
    }
}
