//
//  ConnectImages.swift
//  BTProjects
//
//  Created by Sarah Uli Octavia on 08/11/23.
//

import SwiftUI

struct Ans: Identifiable, Hashable, Equatable {
    var id = UUID().uuidString
    var name: String?
    var type: Int?
    var illustration: String
    var illustration2: String
    var isCorrect: Bool?
    var signLanguage: String?
}
let answers: [Ans] = [
    Ans(name: "budi", type: 4, illustration: "mencari-kumbang", illustration2: "background-word-summary", isCorrect: true),
    Ans(name: "sarah", type: 4, illustration: "background", illustration2: "mencari-kumbang", isCorrect: true),
    Ans(name: "fany", type: 4, illustration: "background-word-summary", illustration2: "background", isCorrect: true)
]

struct Quest: Identifiable, Hashable, Equatable  {
    var id = UUID().uuidString
    var name: String?
    var type: Int?
    var order: Int?
    var illustration: String?
    var isDone: Bool?
    var signLanguage: String?
    var answers: [Ans]
}

struct imagePosition: Identifiable, Equatable  {
    var id: Int
    var position: CGPoint
}


struct ConnectImages: View {
    @State var disableNext: Bool = true
    @State var leftSelected: Int?
    @State var rightSelected: Int?
    
    @State var path: Path = Path()
    
    @State var leftImages: [String] = []
    @State var rightImages: [String] = []
    
    @State private var leftImagePosition: CGPoint = .zero
    @State private var rightImagePosition: CGPoint = .zero
    
    @State var leftImagesPoint: [imagePosition] = []
    @State var rightImagesPoint: [imagePosition] = []
    
    let questions: Quest = Quest(name: "hubungkan", type: 3, order: 1, answers: answers)
    
    var body: some View {
        
        VStack(alignment: .center, spacing: 0){
            //MARK: Quiz Header
            QuizHeader()
            
            ZStack {
                HStack{
                    //MARK: Left Images
                    VStack{
                        ForEach(leftImages.indices, id: \.self) { index in
                            
                            ImageContainer(
                                imageTitle: leftImages[index],
                                isSelected: Binding(
                                    get: { leftSelected == index },
                                    set: { newValue in
                                        leftSelected = newValue ? index : nil
                                        rightSelected = nil
                                        updatePath()
                                    }
                                ),
                                position: .left
                            )
                            .onTapGesture {
                                leftSelected = leftSelected == index ? nil : index
                                updatePath()
                            }
                            .background(GeometryReader { proxy in
                                Color.clear.onAppear {
                                    leftImagePosition = proxy.frame(in: .global).origin
                                    leftImagesPoint.append(imagePosition(id: index, position: leftImagePosition))
                                    print("Left ImageContainer  \(index) at \(leftImagePosition)")
                                    print(leftImagesPoint)
                                }
                            })

                            
                            
                        }
                        
                        
                    }
                    
                    Spacer()
                    //MARK: Right Images
                    VStack{
                        ForEach(rightImages.indices, id:\.self) { index in
                            ImageContainer(
                                imageTitle: rightImages[index],
                                isSelected: Binding(
                                    get: { rightSelected == index },
                                    set: { newValue in
                                        rightSelected = newValue ? index : nil
                                        leftSelected = nil
                                        updatePath()
                                    }
                                ),
                                position: .right
                            )
                            .onTapGesture {
                                rightSelected = rightSelected == index ? nil : index
                                updatePath()
                            }

                            .background(GeometryReader { proxy in
                                Color.clear.onAppear {
                                    // Access the CGPoint of the ImageContainer
                                    rightImagePosition = proxy.frame(in: .global).origin
                                    rightImagesPoint.append(imagePosition(id: index, position: rightImagePosition))
                                    print("Right ImageContainer  \(index) at \(rightImagePosition)")
                                    print(rightImagesPoint)
                                }
                            })
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
                ForEach(leftImages.indices, id:\.self){ item in
                    VStack{
                        if let leftSelected = leftSelected, let rightSelected = rightSelected {
                            Path { path in
                                path.move(to: CGPoint(x: 280, y: 96 + (CGFloat(leftSelected) * 102) * 2))
                                path.addLine(to: CGPoint(x: 595, y: 96 + (CGFloat(rightSelected) * 102) * 2))
                            }
                            .stroke(Color.PB100, style: StrokeStyle(lineWidth: 6, lineCap: .round, dash: [12,12]))
                            .cornerRadius(10)
                            
                        }
                        
                        
                    }
                    .padding(.horizontal, 122)
                    .padding(.vertical, 37)
                    
                }
                
                
            }
            .padding(.vertical, 37)
            
            
            
        }
        .padding(.horizontal, 40)
        .padding(.bottom, 40)
        .padding(.top, 20)
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
        .onAppear{
            withAnimation {
                leftImages = getLeftImages(question: questions).shuffled()
                rightImages = getRightImages(question: questions).shuffled()
              
            }
        }
    }
    
    func updatePath() {
        path = Path { path in
            path.move(to: leftImagePosition)
            path.addLine(to: rightImagePosition)
        }
    }
    
    func getLeftImages(question: Quest) -> [String]{
        var allLeftImages: [String] = []
        for item in question.answers {
            allLeftImages.append(item.illustration)
        }
        print(allLeftImages)
        return allLeftImages
    }
    
    func getRightImages(question: Quest) -> [String]{
        var allRightImages: [String] = []
        for item in question.answers {
            allRightImages.append(item.illustration2)
        }
        print(allRightImages)
        return allRightImages
    }
    
    
    func checkedAnswers(leftImage: String, rightImage: String, question: Quest) -> Bool {
        var checked: Bool = false
        
        for item in question.answers {
            if item.illustration == leftImage && item.illustration2 == rightImage {
                checked = true
            } else{
                checked = false
            }
        }
        
        return checked
        
    }
}

#Preview {
    ConnectImages()
}

