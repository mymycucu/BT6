//
//  HomeViewSandbox.swift
//  BTProjects
//
//  Created by Hilmy Noerfatih on 10/11/23.
//

import SwiftUI

struct HomeView: View {
    @EnvironmentObject var appState: AppState
    @FetchRequest(entity: Category.entity(), sortDescriptors: [])
    private var categories: FetchedResults<Category>
    @State private var indexCategory = 0
    @Binding var mainScene: Int
    
    var body: some View {
        
        VStack{
            HomeHeader()
                .padding(.horizontal,40)
            CategorySelection(index: $indexCategory, categories: Array(categories))
            ZStack {
                TabView(selection: $indexCategory) {
                    ForEach(0..<categories.count, id: \.self) { index in
                        StoryBookPerCategory(mainScene: $mainScene, category: categories[index])
                            .environmentObject(appState)
                    }
                }
                .animation(.easeInOut, value: indexCategory)
                .tabViewStyle(.page(indexDisplayMode: .never))
                
                
                HStack{
                    if (indexCategory > categories.startIndex){
                        Button(action: {
                            if indexCategory - 1 <= 0 {
                                indexCategory = 0
                            }else{
                                indexCategory -= 1
                            }
                        }) {
                            Image(systemName: "arrowshape.left.fill")
                                .font(.Button)
                        }
                        .buttonStyle(CircularButtonStyle())
                        .shadow(color: .white.opacity(0.25), radius: 2, x: 0, y: 4)
                    }
                    Spacer()
                    
                    if (indexCategory < categories.count-1){
                        Button(action: {
                            if indexCategory + 1 >= categories.count-1 {
                                indexCategory = categories.count-1
                            }else{
                                indexCategory += 1
                            }
                        }) {
                            Image(systemName: "arrowshape.right.fill")
                                .font(.Button)
                        }
                        .buttonStyle(CircularButtonStyle())
                        .shadow(color: .white.opacity(0.25), radius: 2, x: 0, y: 4)
                    }
                }
                .foregroundColor(Color.PB500)
                .padding(.horizontal,20)
                
            }
            
        }
        .background(
            ZStack{
                RadialGradient(
                    gradient: Gradient(
                        stops: [
                            .init(color: .PB600.opacity(0.8), location: 0), // Starting around $0% from the center
                            .init(color: .PB600, location: 0.8) // Strating 0.8
                        ]
                    ),
                    center: UnitPoint(x: 0.5, y: 1.5),
                    startRadius: 0,
                    endRadius: 1500
                )
                .edgesIgnoringSafeArea(.all)
                Image("background")
                    .resizable()
                    .scaledToFit()
                    .opacity(0.1)
                    .edgesIgnoringSafeArea(.all)
            }
        )
    }
}

struct CardView: View{
    var body: some View{
        Rectangle()
            .fill(Color.pink)
            .frame(height: 200)
            .border(Color.black)
            .padding()
    }
}

#Preview {
    HomeView(mainScene: .constant(0))
}
