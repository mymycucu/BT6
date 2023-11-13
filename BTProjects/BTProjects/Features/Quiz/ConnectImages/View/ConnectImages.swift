//
//  ConnectImages.swift
//  BTProjects
//
//  Created by Sarah Uli Octavia on 08/11/23.
//

import SwiftUI

struct ConnectImages: View {
    @State var disableNext: Bool = true
    @State var leftSelected: Int?
    @State var rightSelected: Int?
    @State var isLeftSelected:Bool = false
    @State var isRightSelected:Bool = false
    
    @State var path: Path = Path()
    
    @State var menu = false
    
    var body: some View {
        
        ZStack {
            VStack(alignment: .center, spacing: 0){
                //MARK: Quiz Header
                HStack(spacing: 15){
                    Button(action: {
                        menu.toggle()
                    }) {
                        Image(systemName: "list.bullet")
                            .font(.Button)
                    }
                    .buttonStyle(CircularButtonStyle())
                    ProgressBar()
                    Button(action: {
                        
                    }) {
                        Image(systemName: "xmark")
                            .font(.Button)
                    }
                    .buttonStyle(CircularButtonStyle())
                }
                
                ZStack {
                    HStack{
                        //MARK: Left Images
                        VStack{
                            ForEach(0..<3) { index in
                                
                                ImageContainer(isSelected: Binding(
                                    get: {
                                        leftSelected == index
                                    },
                                    set: { newValue in
                                        if newValue {
                                            leftSelected = index
                                            rightSelected = nil
                                            updatePath()
                                        } else {
                                            leftSelected = nil
                                            updatePath()
                                        }
                                    }
                                ), position: .left)
                                .onTapGesture {
                                    if leftSelected == index {
                                        leftSelected = nil
                                    } else {
                                        leftSelected = index
                                        rightSelected = nil
                                    }
                                    updatePath()
                                }
                                
                            }
                            
                            
                        }
                        
                        Spacer()
                        //MARK: Right Images
                        VStack{
                            ForEach(0..<3) { index in
                                ImageContainer(isSelected: Binding(
                                    get: {
                                        rightSelected == index
                                    },
                                    set: { newValue in
                                        if newValue {
                                            rightSelected = index
                                            leftSelected = nil
                                            updatePath()
                                        } else {
                                            rightSelected = nil
                                            updatePath()
                                        }
                                    }
                                ),
                                               position: .right)
                                .onTapGesture {
                                    if rightSelected == index {
                                        rightSelected = nil
                                    } else {
                                        rightSelected = index
                                        isRightSelected = true
                                    }
                                    updatePath()
                                    
                                }
                            }
                        }
                    }
                    .padding(.horizontal, 122)
                    .padding(.vertical, 37)
                    
                    
                    //MARK: Navigation Previous-Next Button
                    VStack {
                        Spacer()
                        HStack{
                            Button(action: {
                                //action
                            }) {
                                Image(systemName: "arrowshape.left.fill")
                                    .font(.Button)
                            }
                            .buttonStyle(CircularButtonStyle())
                            
                            Spacer()
                            Button(action: {
                                //action
                            }) {
                                Image(systemName: "arrowshape.right.fill")
                                    .font(.Button)
                            }
                            .buttonStyle(CircularButtonStyle(disabled: disableNext))
                            
                            
                        }
                    }
                    
                    //MARK: Draw Connecting Line
                    if let leftSelected = leftSelected, let rightSelected = rightSelected {
                        Path { path in
                            path.move(to: CGPoint(x: 50, y: 50 + CGFloat(leftSelected) * 60))
                            path.addLine(to: CGPoint(x: 250, y: 50 + CGFloat(rightSelected) * 60))
                        }
                        .stroke(Color.PB100, style: StrokeStyle(lineWidth: 6, dash: [12,12]))
                        .cornerRadius(10)
                    }
                    
                }
                //            Spacer()
                
            }
            .padding(.horizontal, 38)
            .padding(.vertical, 20)
            
            //MARK: Show Menu
            if menu {
                MenuView(show: $menu)
                
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
                    .scaledToFill()
                    .opacity(0.1)
                    .edgesIgnoringSafeArea(.all)
                
                
            }
            
            
        )
    }
    
    func updatePath() {
        path = Path { path in
            if let leftSelected = leftSelected, let rightSelected = rightSelected {
                path.move(to: CGPoint(x: 50, y: 150 + CGFloat(leftSelected) * 60))
                path.addLine(to: CGPoint(x: 250, y: 50 + CGFloat(rightSelected) * 60))
            }
        }
    }
    
}

#Preview {
    ConnectImages()
}
