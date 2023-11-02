//
//  HomeView.swift
//  BTProjects
//
//  Created by Sarah Uli Octavia on 02/11/23.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        VStack(spacing: 20){
            //MARK: Header
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
            
            Circle()
                .fill(.white)
                .frame(width: 84)
                .overlay(
                    RoundedRectangle(cornerRadius: 100)
                    .inset(by: 2)
                    .stroke(Color(red: 0.59, green: 0.66, blue: 0.8), lineWidth: 4)

                )
            
            
            ZStack{
                RoundedRectangle(cornerRadius: 20)
                    .fill(.gray6)
                    .opacity(0.4)
                
            }
            .padding(.top, 20)
            
            
        }
        .padding(40)
        .background(
            ZStack{
                LinearGradient(colors: [.PB600,.PB500], startPoint: .top, endPoint: .bottom)
                    .edgesIgnoringSafeArea(.all)
            }
            
            
        )
    }
}

#Preview {
    HomeView()
}
