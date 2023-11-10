//
//  HomeHeader.swift
//  BTProjects
//
//  Created by Sarah Uli Octavia on 02/11/23.
//

import SwiftUI

struct HomeHeader: View {
    var body: some View {
        HStack{
            VStack(alignment: .leading){
                Text("Selamat Pagi,")
                    .font(.Caption_Regular)
                Text("Sarah Octavia")
                    .font(.Body_Medium)
            }
            Spacer()
            Circle()
                .fill(.white)
                .frame(width: 52)
                .overlay(
                    RoundedRectangle(cornerRadius: 100)
                    .inset(by: 2)
                    .stroke(Color(red: 0.59, green: 0.66, blue: 0.8), lineWidth: 4)

                )
        }
        .foregroundColor(.white)
    }
}

#Preview {
    HomeHeader()
}
