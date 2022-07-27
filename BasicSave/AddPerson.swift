//
//  AddPerson.swift
//  BasicSave
//
//  Created by Can on 27.07.2022.
//

import SwiftUI

struct AddPerson: View {
    @Environment(\.managedObjectContext) var managedObject
    @Environment(\.dismiss) var dismiss
    
    @State private var name = ""
    @State private var surname = ""
    @State private var occupation = ""
    
    var body: some View {
        Form {
            Section {
                VStack {
                
                TextField("Name", text: $name)
                    .padding()
                TextField("surname", text: $surname)
                    .padding()
                TextField("occupation", text: $occupation)
                    .padding()
                    Button("Submit") {
                        DataController().addPerson(name: name, surname: surname, occupation: occupation, context: managedObject)
                        dismiss()
                    }
                
                }
            }
            
        }
        
        
        
    }
}

struct AddPerson_Previews: PreviewProvider {
    static var previews: some View {
        AddPerson()
    }
}
