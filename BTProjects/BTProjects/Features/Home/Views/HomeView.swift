//
//  HomeView.swift
//  BTProjects
//
//  Created by Sarah Uli Octavia on 02/11/23.
//

import SwiftUI

struct HomeView: View {
    private let items = (1...3).map {"Item \($0)"}
    
    private let columns: [GridItem] = [
        GridItem(.fixed(254), spacing: 24, alignment: .center),
        GridItem(.fixed(254), spacing: 24, alignment: .center)
    ]
    var body: some View {
        VStack(spacing: 20){
            //MARK: Header
            HomeHeader()
            
            Spacer()
            //MARK: List of Stories
            ScrollView(.horizontal){
                HStack {
                    ZStack{
                        RoundedRectangle(cornerRadius: 20)
                            .fill(Color.Gray6)
                            .opacity(0.4)
                            .frame(width: 896, height: 568)
                        
                        LazyHGrid(
                            rows: columns, spacing: 24
                        ){
                            ForEach(items, id: \.self){ item in
                                StoryBook()
                            }
                        }
                    }
                    .frame(width: 896, height: 568)
                    
                    ZStack{
                        RoundedRectangle(cornerRadius: 20)
                            .fill(Color.Gray6)
                            .opacity(0.4)
                            .frame(width: 896, height: 568)
                        
                        LazyHGrid(
                            rows: columns, spacing: 24
                        ){
                            ForEach(items, id: \.self){ item in
                                StoryBook()
                            }
                        }
                    }
                    .frame(width: 896, height: 568)
                }
                
                
            }
            

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
