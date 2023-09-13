//
//  HeaderView.swift
//  Notes Watch App
//
//  Created by Zeki Baklan on 13.09.2023.
//

import SwiftUI

struct HeaderView: View {
    
    var title : String = ""
        
    var body: some View {
        VStack {
            // TITLE
            
            if title != "" {
                Text(title.uppercased())
                    .font(.title3)
                    .fontWeight(.bold)
                    .foregroundColor(.accentColor)
                
            }
                
            
            //SEPERATOR
            
            HStack {
                Capsule()
                    .frame(height: 1)
                Image(systemName: "note.text")
                Capsule()
                    .frame(height: 1)
                
                
            }//:HSTACK
            .foregroundColor(.accentColor)
        }//:VSTACK
    }
}

struct HeaderView_Previews: PreviewProvider {
    static var previews: some View {
        HeaderView(title: "Credits")
    }
}
