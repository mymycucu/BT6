//
//  HomeView.swift
//  BTProjects
//
//  Created by Sarah Uli Octavia on 02/11/23.
//

import SwiftUI



struct HomeView: View {
    private let items = (1...3).map {"Item \($0)"}
    @State private var scale: CGFloat?
    @State var category: Cat = Cat(colors: .red)
    @State var scrollID: Int?
    
    @Binding var activeID: UUID?
    let categories = [Cat(colors: .red),Cat(colors: .cyan),Cat(colors: .yellow),
                      Cat(colors: .orange),Cat(colors: .blue),Cat(colors: .purple),
                      Cat(colors: .green),]
    
    
    private let columns: [GridItem] = [
        GridItem(.fixed(254), spacing: 24, alignment: .center),
        GridItem(.fixed(254), spacing: 24, alignment: .center)
    ]
    
    var body: some View {
        VStack(alignment: .center, spacing: 20){
            //MARK: Header
            HomeHeader()
                .padding(.horizontal,40)
            
            
            ScrollViewReader { proxy in
                ScrollView(.horizontal, showsIndicators: false) {
                    LazyHStack(spacing: 10) {
                        Circle()
                            .frame(height: 90)
                            .overlay(
                                RoundedRectangle(cornerRadius: 100)
                                    .inset(by: 1.5)
                                    .stroke(Color(red: 0.19, green: 0.24, blue: 0.35), lineWidth: 3)
                            )
                            .opacity(0)
                        Circle()
                            .frame(height: 90)
                            .overlay(
                                RoundedRectangle(cornerRadius: 100)
                                    .inset(by: 1.5)
                                    .stroke(Color(red: 0.19, green: 0.24, blue: 0.35), lineWidth: 3)
                            )
                            .opacity(0)
                        ForEach(0..<min(categories.count, 9), id: \.self) { index in
                            
                            let scale = calculateScale(index: index)
                            Button {
                                scrollID = index
                            } label: {
                                Circle()
                                    .fill(categories[index].colors)
                                
                                
                            }
                            .overlay(
                                RoundedRectangle(cornerRadius: 100)
                                    .inset(by: 1)
                                    .stroke(Color.PB300, lineWidth: 3)
                            )
                            
                            .scaleEffect(scale, anchor: .center)
                            
                            .onAppear {
                                if index == 0 {
                                    withAnimation {
                                        proxy.scrollTo(index)
                                    }
                                }
                            }
                            .scrollTransition { content, phase in
                                content
                                    .scaleEffect (
                                        x: phase.isIdentity ? 1.0 : 0,
                                        y: phase.isIdentity ? 1.0 : 0)
                            }
                            .frame(maxWidth: 90)
                        }
                        Circle()
                            .frame(height: 90)
                            .overlay(
                                RoundedRectangle(cornerRadius: 100)
                                    .inset(by: 1.5)
                                    .stroke(Color(red: 0.19, green: 0.24, blue: 0.35), lineWidth: 3)
                            )
                            .opacity(0)
                        Circle()
                            .frame(height: 90)
                            .overlay(
                                RoundedRectangle(cornerRadius: 100)
                                    .inset(by: 1.5)
                                    .stroke(Color(red: 0.19, green: 0.24, blue: 0.35), lineWidth: 3)
                            )
                            .opacity(0)
                        
                    }
                    .scrollTargetLayout()
                }
                
                .scrollTargetBehavior(.viewAligned)
                .scrollPosition(id: $scrollID, anchor: .center)
                .onAppear{
                    withAnimation {
                        DispatchQueue.main.async{
                            scrollID = 0
                        }
                    }
                }
                .onChange(of: scrollID) { oldValue, newValue in
                    withAnimation(.easeInOut(duration: 0.1)) {
                        DispatchQueue.main.async{
                            proxy.scrollTo(newValue)
                        }
                    }
                }
                .frame(width: 500, height: 100)
            }
            
            
            
            //MARK: List of Stories
            ScrollViewReader {proxy in
                ZStack {
                    ScrollView(.horizontal, showsIndicators: false){
                        HStack(spacing:24){
                            Spacer().frame(width: (UIScreen.main.bounds.width - 896 - 96) / 2) // minuss frame and spacing(s)
                            //MARK: Story 1
                            StoryBookPerCategory()
                            //MARK: Story 2
                            StoryBookPerCategory()
                            //MARK: Story 3
                            StoryBookPerCategory()
                        }
                        .scrollIndicators(.hidden)
                        
                        
                    }
                    
                    
                    
                    //MARK : Right - Left Button
                    HStack{
                        
                        Button(action: {
                            // Your action here
                        }) {
                            Image(systemName: "arrowshape.left.fill")
                                .font(.Button)
                        }
                        .buttonStyle(CircularButtonStyle())
                        .shadow(color: .white.opacity(0.25), radius: 2, x: 0, y: 4)
                        Spacer()
                        Button(action: {
                            // Your action here
                        }) {
                            Image(systemName: "arrowshape.right.fill")
                                .font(.Button)
                        }
                        .buttonStyle(CircularButtonStyle())
                        .shadow(color: .white.opacity(0.25), radius: 2, x: 0, y: 4)
                        
                    }
                    .foregroundColor(Color.PB500)
                    .padding(.horizontal,20)
                    
                    
                }
            }
            
            
        }
        .padding(.vertical, 40)
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
    
    func calculateScale(index: Int) -> CGFloat {
        let activeIndex = Int(scrollID ?? 0)
        var scale:CGFloat?
        withAnimation(.easeInOut(duration: 0.1)){
            if activeIndex == index {
                scale = 1.0
            } else if activeIndex - 1 == index || activeIndex + 1 == index {
                scale = 0.75
            } else {
                scale = 0.5
            }
        }
        return scale!
    }
    
    
}


struct Cat: Identifiable, Hashable, Equatable {
    let id = UUID()
    let colors: Color
    
    
}

#Preview {
    HomeView(activeID: .constant(UUID()))
}
