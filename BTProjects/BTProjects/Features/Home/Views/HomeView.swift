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
    @State var viewState: ViewState = .normal
    
    var body: some View {
        
        VStack{
            HomeHeader()
            CategorySelection(index: $indexCategory, categories: Array(categories))
            ZStack {
                TabView(selection: $indexCategory) {
                    ForEach(0..<categories.count, id: \.self) { index in
                        StoryBookPerCategory(category: categories[index])
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
                
            }
            
        }
        .padding(.horizontal,38)
        .padding(.vertical, 15)
        .background(
            Background(viewState: viewState)
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
    HomeView()
        .environmentObject(AppState())
}
