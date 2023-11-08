//
//  StoryText.swift
//  BTProjects
//
//  Created by Ario Syahputra on 25/10/23.
//

import SwiftUI

struct StoryText: View {
    var body: some View {
        HStack(alignment: .center, spacing: 10) {
            
            //MARK: Story Words
            
            Text("Dino ")
                .font(.Subhead1_Medium)
                .foregroundColor(.PB500) +
            Text("membaca")
                .font(.Subhead1_Medium)
                .foregroundColor(.Purple5) +
            Text(" buku di taman.")
                .font(.Subhead1_Medium)
                .foregroundColor(.PB500)
            
        }
        .padding(.horizontal, 10)
        .padding(.vertical, 18)
        .frame(width: 986, alignment: .center)
        .background(Color(.systemGray6))
        .cornerRadius(12)
    }
}

#Preview {
    StoryText()
}
