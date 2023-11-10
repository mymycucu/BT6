//
//  SummaryHeader.swift
//  BTProjects
//
//  Created by Sarah Uli Octavia on 07/11/23.
//

import SwiftUI

struct SummaryHeader: View {
    var body: some View {
        HStack(spacing: 15){
            //MARK: Menu
            Button(action: {
                
            }) {
                Image(systemName: "list.bullet")
                    .font(.Button)
            }
            .buttonStyle(CircularButtonStyle())
            
            Spacer()
            
            //MARK: Exit
            Button(action: {
                
            }) {
                Image(systemName: "xmark")
                    .font(.Button)
            }
            .buttonStyle(CircularButtonStyle())
        }
        //        .padding(.top,20)
        
    }
}

#Preview {
    SummaryHeader()
}
