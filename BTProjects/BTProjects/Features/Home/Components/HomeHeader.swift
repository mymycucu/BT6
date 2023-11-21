//
//  HomeHeader.swift
//  BTProjects
//
//  Created by Sarah Uli Octavia on 02/11/23.
//

import SwiftUI

struct HomeHeader: View {
    var userName = "Sarah Octavia"
    var body: some View {
        HStack{
            VStack(alignment: .leading){
                Text("\(GetTime.getTimeGreeting()),")
                    .font(.Caption_Regular)
                Text(userName)
                    .font(.Body_Medium)
            }
            Spacer()
            Circle()
                .fill(Color.white) // Use fill to set the background color
                .frame(width: 52)   // Set the desired width
                .overlay(
                    Image("user_default")
                        .resizable()
                        .padding(.top, 5)
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 48)  // Adjust the size to be the same as in the second code snippet
                        .clipShape(Circle())
                        .overlay(
                            Circle()
                                .stroke(Color(red: 0.59, green: 0.66, blue: 0.8), lineWidth: 4)
                        )
                )

        }
        .foregroundColor(.white)
    }
}

#Preview {
    HomeHeader()
}
