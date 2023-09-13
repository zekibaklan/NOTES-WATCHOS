//
//  ContentView.swift
//  Notes Watch App
//
//  Created by Zeki Baklan on 13.09.2023.
//

import SwiftUI

struct ContentView: View {
    
    //    MARK: - PROPERTY
    
    @State private var notes : [Note]  = [Note]()
    @State private var text : String = ""
    
    
    //    MARK: - FUNCTION
    
    func getDocumentDirectory() -> URL{
        let path = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        return path[0]
    }
    
    
    
    func save () {
        dump(notes)
    }
    
    
    
    //    MARK: - BODY
    
    
    var body: some View {
        VStack {
            HStack(alignment: .center, spacing: 6) {
                TextField("Add New Note", text: $text)
                Button {
                    // 1. Only run the button's action when the text field is not empty
                    
                    guard text.isEmpty == false else { return }
                    // 2.Create a new note item and initialize it with the text value
                    let note = Note(id: UUID(), text: text)
                    
                    // 3. Add the  new note item to the notes array(append)
                    notes.append(note)
                    // 4.Make the text field empty
                    text = ""
                    // 5.Save the notes (funtion)
                    save()
                        
                } label: {
                    Image(systemName: "plus.circle")
                        .font(.system(size: 42, weight: .semibold))
                }
                .fixedSize()
                .buttonStyle(PlainButtonStyle())
                .foregroundColor(.accentColor)
                
//                .buttonStyle(BorderedButtonStyle(tint: .accentColor))

            }//:HSTACK
            Spacer()
            Text("\(notes.count)")
        }//:VSTACK
        .navigationTitle("xrert")
        .padding()
    }
}


 //    MARK: - PREVIEW

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
