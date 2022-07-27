//
//  ContentView.swift
//  BasicSave
//
//  Created by Can on 27.07.2022.
//

import SwiftUI
import CoreData


struct ContentView: View {
    @Environment(\.managedObjectContext) var managedObject
    @FetchRequest(sortDescriptors: [SortDescriptor(\.name)]) var person: FetchedResults<Person>
    @State private var showingAddPerson = false
    
    var body: some View {
        NavigationView {
            List {
                ForEach(person) { person in
                    HStack {
                    Text(person.name!)
                        Spacer()
                            .frame(width: 10)
                    Text(person.surname!)
                        Spacer()
                            .frame(width: 10)
                    Text(person.occupation!)
                    }
                    
                    
                    
                }
                .onDelete(perform: deletePerson)
            }
            .listStyle(.plain)
            .navigationTitle("My List")
            .toolbar  {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        showingAddPerson.toggle()
                    } label: {
                        Label("Add person", systemImage: "plus.circle")
                    }
                }
            }
            .sheet(isPresented: $showingAddPerson) {
                AddPerson()
            }
        }
       
    }
    private func deletePerson(offsets: IndexSet) {
        withAnimation {
            offsets.map { person[$0] }
            .forEach(managedObject.delete)
            
            DataController().save(context: managedObject)
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
