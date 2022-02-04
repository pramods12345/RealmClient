//
//  Realm.swift
//  SayBubble
//
//  Created by Sundaresh on 05/07/16.
//  Copyright © 2016 Y MEDIA LABS. All rights reserved.
//

import Foundation
import RealmSwift
import Realm


typealias JSONDictionary = [String: AnyObject]

typealias JSONArray = [JSONDictionary]

protocol Mappable {
    func mapToModel(json: JSONDictionary) -> Self  // used to get the Realm Objects
    
    func handleMigration(migration: AnyObject, oldSchemaVersion: Any)
}

protocol RealmMigration {
    
    
    
    
    func hanldeMigration()
    func resetData()
}

class RealmManager {
    
    static let sharedManager = RealmManager()
    private let calendar: NSCalendar = NSCalendar(calendarIdentifier: NSCalendar.Identifier.gregorian)!
    let dateFormatter = DateFormatter()
    private let numberFormatter = NumberFormatter()
    
    init() {
        
    }
    
    // Migration Block
    func checkSchema(schemaVersion: UInt64) {
        
    }
}

extension RealmManager: RealmMigration {
    func resetData() {
        //
    }
    
    func hanldeMigration() {
         Realm.Configuration.defaultConfiguration = Realm.Configuration (
         // Set the new schema version. This must be greater than the previously used
         // version (if you've never set a schema version before, the version is 0).
         schemaVersion: 1, // temp
         
         // Set the block which will be called automatically when opening a Realm with
         // a schema version lower than the one set above
         migrationBlock: { migration, oldSchemaVersion in
            // Custom code
         })
    }
}

// used to create array of Integers/Strings/Double in an object
class IntObject: Object {
    var value = RealmOptional<Int>()
}

class StringObject: Object {
    dynamic var value = ""
}

class DoubleObject: Object {
    dynamic var value : Double = 0.0
}
