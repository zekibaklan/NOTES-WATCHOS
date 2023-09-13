//
//  DetailView.swift
//  Notes Watch App
//
//  Created by Zeki Baklan on 13.09.2023.


import SwiftUI

struct DetailView: View {
    
    //    MARK: - PROPERTY
    
    let note: Note
    let count : Int
    let index : Int
    
    @State private var isCreditsPresented : Bool = false
    
    //    MARK: - BODY
    var body: some View {
        VStack(alignment: .center,spacing: 3) {
            
            //HEADER
            HeaderView(title: "")
            
            
            //CONTENT
            Spacer()
            ScrollView(.vertical) {
                Text(note.text)
                    .font(.title3)
                    .fontWeight(.semibold)
                    .multilineTextAlignment(.center)
               
            }
            Spacer()
            
            
            //FOOTER
            HStack(alignment: .center) {
                Image(systemName: "gear")
                    .imageScale(.large)
                Spacer()
                Text("\(count)/ \(index + 1 )")
                Spacer()
                Image(systemName: "info.circle")
                .imageScale(.large)
                .onTapGesture {
                    isCreditsPresented.toggle()
                }
                .sheet(isPresented: $isCreditsPresented) {
                    CreditsView()
                }
                
                
              
                
            }//:HSTACK
            .foregroundColor(.secondary)
            
            
        }//:VSTACK
        .padding(3)
    }
}
//    MARK: - PREVIEW
struct DetailView_Previews: PreviewProvider {
    static var sampleData : Note = Note(id: UUID(), text: "Hello, World")
    static var previews: some View {
        DetailView(note: sampleData, count: 5, index: 1 )
    }
}
