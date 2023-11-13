//
//  StoryTopBar.swift
//  BTProjects
//
//  Created by Ario Syahputra on 02/11/23.
//

import SwiftUI

struct StoryTopBar: View {
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    var body: some View {
        HStack {
            
            //MARK: Menu Button
            Button(action: {
                        // Add your action code here
                    }) {
                        
                        HStack(alignment: .center, spacing: 0) {
                            Image(systemName: "list.bullet")
                                .bold()
                                .imageScale(.large)
                                .foregroundColor(Color.PB500)

                        }
                        .frame(width: 62, height: 62)
                        .background(Color.white)
                        .cornerRadius(100)
                        .overlay(
                            RoundedRectangle(cornerRadius: 100)
                                .inset(by: 1.5)
                                .stroke(Color.PB500, lineWidth: 3)
                        )
                        

                    }
            
            Spacer()
            
            //MARK: X Button
            Button(action: {
                presentationMode.wrappedValue.dismiss()
                    }) {
                        
                        HStack(alignment: .center, spacing: 0) {
                            Image(systemName: "xmark")
                                .bold()
                                .imageScale(.large)
                                .foregroundColor(Color.PB500)

                        }
                        .frame(width: 62, height: 62)
                        .background(Color.white)
                        .cornerRadius(100)
                        .overlay(
                            RoundedRectangle(cornerRadius: 100)
                                .inset(by: 1.5)
                                .stroke(Color.PB500, lineWidth: 3)
                        )
                        

                    }

        }
        
    }
}

#Preview {
    StoryTopBar()
}
