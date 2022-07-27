//
//  DataController.swift
//  BasicSave
//
//  Created by Can on 27.07.2022.
//

import Foundation
import CoreData

class DataController: ObservableObject {
    let container = NSPersistentContainer(name: "PersonModel")
    
    init() {
        container.loadPersistentStores { desc, error in
            if let error = error {
                print("Failed to load data \(error.localizedDescription)")
            }
            
        }
    }
    
    func save(context: NSManagedObjectContext) {
        do {
            try context.save()
            print("Data saved!!")
        }  catch {
            print("We could not save the data!!")
        }
        
    }
    
    func addPerson(name: String, surname: String, occupation: String, context: NSManagedObjectContext) {
        let person = Person(context: context)
        person.id = UUID()
        person.name = name
        person.surname = surname
        person.occupation = occupation
        
        save(context: context)
    }
    
    
    
    
}
