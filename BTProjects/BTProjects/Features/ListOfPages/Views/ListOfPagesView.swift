//
//  ListOfPageView.swift
//  BTProjects
//
//  Created by Dary Ramadhan on 06/11/23.
//

import SwiftUI

struct ListOfPageView: View {
    
    @State var menu = false
    
    var body: some View {
        
        ZStack {
            VStack{
                HStack(spacing: 15){
                    Button(action: {
                        withAnimation{
                            menu.toggle()
                        }
                    }) {
                        Image(systemName: "list.bullet")
                            .font(.Button)
                    }
                    .buttonStyle(CircularButtonStyle())
                    Spacer()
                    Button(action: {
                        
                    }) {
                        Image(systemName: "xmark")
                            .font(.Button)
                    }
                    .buttonStyle(CircularButtonStyle())
                }
                Spacer()
            }
            .padding(40)
            
            if menu {
                MenuView(show: $menu)
            }
        }
        .edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
        
    }
}

struct MenuView: View {
    private let data = (1...5)
    @Binding var show : Bool
    @State var story1 = "story-1"
    @State var story2 = "story-2"
    
    @State var isSelect = 1
    private let columns: [GridItem] = [
        GridItem(.fixed(316), spacing: 24, alignment: .center),
        GridItem(.fixed(316), spacing: 24, alignment: .center)
    ]
    var body: some View {
        ZStack (alignment: Alignment(horizontal: .trailing, vertical: .top), content: {
            
            ScrollView(.vertical, showsIndicators: false) {
                VStack(spacing: 20) {
                    VStack(spacing: 32) {
                        LazyVGrid (columns: columns, spacing: 32, content: {
                            Section(header: Text("Stories")
                                .font(.Heading2_Semibold)
                                .foregroundColor(.white))
                            {
                                ForEach(data, id: \.self) { item in
                                    Button(action: {
                                        isSelect = item
                                    }, label: {
                                        ThumbnailPage(isSelect: $isSelect, order: item)
                                    })
                                }
                            }
                            Section(header:
                                        Text("Question")
                                .font(.Heading2_Semibold)
                                .foregroundColor(.white))
                            {
                                ForEach(data, id: \.self) { item in
                                    Button(action: {
                                        isSelect = item
                                    }, label: {
                                        ThumbnailPage(isSelect: $isSelect, order: item)
                                    })
                                }
                            }
                        })
                        
                        
                        
                    }
                    
                    
                    
                    
                }
                .padding(.vertical, 25)
                .padding(.horizontal, 30)
                .cornerRadius(25)
            }
            //Main Content
            
            
            Button(action: {
                
                withAnimation{
                    show.toggle()
                }
                
            }, label: {
                Image(systemName: "xmark.circle")
                    .font(.system(size: 40, weight: .bold))
                    .foregroundColor(.white)
            })
            .padding()
        })
        
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .padding(.top, 43)
        .background(
            Color.primary.opacity(0.7)
        )
        
    }
}

#Preview {
    ListOfPageView()
}
