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
    var body: some View {
        
        VStack(alignment: .center, spacing: 0){
            //MARK: Quiz Header
            QuizHeader()
            
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
                                    } else {
                                        leftSelected = nil
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
                                    } else {
                                        rightSelected = nil
                                    }
                                }
                            ),
                            position: .right)
                                .onTapGesture {
                                    if rightSelected != index {
                                        rightSelected = index
                                        isRightSelected = true
                                    }
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
            }
            Spacer()
            
        }
        .padding(40)
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

#Preview {
    ConnectImages()
}
