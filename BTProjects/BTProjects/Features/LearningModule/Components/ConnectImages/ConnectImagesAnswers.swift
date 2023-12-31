//
//  ConnectImagesAnswers.swift
//  BTProjects
//
//  Created by Sarah Uli Octavia on 21/11/23.
//

import SwiftUI

struct ConnectImagesAnswers: View {
    var question: Question
    
    
    
    //MARK: which one that is selected
    @State var leftSelected: Int?
    @State var rightSelected: Int?
    
    //MARK: create line
    @State var path: Path = Path()
    
    //MARK: save array of images
    @State var leftImages: [String] = []
    @State var rightImages: [String] = []
    
    //MARK: to read position using geometry reader
    @State private var leftImagePosition: CGPoint = .zero
    @State private var rightImagePosition: CGPoint = .zero
    
    //MARK: save the images postion
    @State var leftImagesPoint: [imagePosition] = []
    @State var rightImagesPoint: [imagePosition] = []
    
    //MARK: to save correct pairs
    @State var correctLeftPosition: [imagePosition] = []
    @State var correctRightPosition: [imagePosition] = []
    
    //MARK: to check correct & false
    @State var isCorrect: Bool = false
    @State var isFalse: Bool = false
    
    //MARK: to check all images correct -> Bool
    @State var allImagesCorrect: Bool = false
    
    //MARK: to check whether it's in process of matching or not
    @State var isMatchingLeft: Bool = false
    @State var isMatchingRight: Bool = false
    
    /// show correct state
    @Binding var isCorrectState: Bool
    
    /// state correct stay
    @Binding var isQuestionDone:Bool

    var body: some View {
        
        ZStack{
            //MARK: Draw Connecting Line
            ForEach(leftImagesPoint, id:\.id){ left in
                ForEach(rightImagesPoint, id:\.id) { right in
                    if leftSelected == left.id && rightSelected == right.id {
                        VStack (spacing: 0){
                            Path { path in
                                path.move(to: CGPoint(x: left.position.x , y: left.position.y))
                                path.addLine(to: CGPoint(x: right.position.x , y: right.position.y))
                            }
                            .stroke(Color.PB100, style: StrokeStyle(lineWidth: 6, lineCap: .round, dash: [12,10]))
                            .cornerRadius(10)
                            
                        }
                    }
                    
                }
            }
            
            
            //MARK: Draw Correct Line
            ForEach(0..<correctLeftPosition.count, id:\.self){ index in
                VStack{
                    Path { path in
                        path.move(to: CGPoint(x: correctLeftPosition[index].position.x, y: correctLeftPosition[index].position.y))
                        path.addLine(to: CGPoint(x: correctRightPosition[index].position.x, y: correctRightPosition[index].position.y))
                    }
                    .stroke(Color.PB100, style: StrokeStyle(lineWidth: 6, lineCap: .round, dash: [12,10]))
                    .cornerRadius(10)
                    
                }
            }
            
            
            HStack (spacing: 0){
                //MARK: Left Images
                VStack (spacing: 12){
                    ForEach(leftImages.indices, id: \.self) { index in
                        
                        ImageContainer(
                            imageTitle: leftImages[index],
                            isSelected: Binding(
                                get: { leftSelected == index },
                                set: { newValue in
                                    leftSelected = newValue ? index : nil
                                    rightSelected = nil
                                }
                            ),
                            position: .left,
                            /// check  if it's correct
                            isCorrect: Binding(get: {
                                getIsCorrectLeftImage(id: index)
                            }, set: { Value in
                                
                            }),
                            /// check  if it's false
                            isFalse: Binding(get: {
                                leftSelected == index && isFalse
                            }, set: { Value in
                                
                            })
                        )
                        //MARK: On Tap Left
                        .onTapGesture {
                            if !isQuestionDone {
                                if allImagesCorrect == false && isMatchingLeft == false {
                                    leftSelected =  index
                                    isMatchingLeft = true
                                    
                                }
                                /// if it's already correct then it cannot be tapped
                                for item in correctLeftPosition {
                                    if item.id == index{
                                        leftSelected = nil
                                        isMatchingLeft = false
                                    }
                                }
                            }
                        }
                        //MARK: GeoReder Left
                        .background(GeometryReader { proxy in
                            Color.clear.onAppear {
                                leftImagePosition = CGPoint(x: proxy.frame(in: .global).maxX, y: proxy.frame(in: .global).midY)
                                leftImagesPoint.append(imagePosition(id: index, position: leftImagePosition))
                            }
                        })
                        
                        
                    }
                }
                
                //MARK: Spacer
                Spacer()
                
                //MARK: Right Images
                VStack (spacing: 12){
                    ForEach(rightImages.indices, id:\.self) { index in
                        ImageContainer(
                            imageTitle: rightImages[index],
                            isSelected: Binding(
                                get: { rightSelected == index },
                                set: { newValue in
                                    rightSelected = newValue ? index : nil
                                    leftSelected = nil
                                }
                            ),
                            position: .right,
                            /// check  if it's correct
                            isCorrect: Binding(get: {
                                getIsCorrectRightImage(id: index)
                            }, set: { Value in
                                
                            }),
                            /// check if it's false
                            isFalse: Binding(get: {
                                rightSelected == index && isFalse
                                
                            }, set: { Value in
                                
                            })
                        )
                        //MARK: On Tap Right
                        .onTapGesture {
                            if !isQuestionDone{
                                if allImagesCorrect == false && isMatchingRight == false {
                                    rightSelected =  index
                                    isMatchingRight = true
                                    
                                }
                                /// if it's already correct then it cannot be tapped
                                for item in correctRightPosition {
                                    if item.id == index{
                                        rightSelected = nil
                                        isMatchingRight = false
                                    }
                                }
                            }
                        }
                        //MARK: GeoReder Right
                        .background(GeometryReader { proxy in
                            Color.clear.onAppear {
                                rightImagePosition = CGPoint(x: proxy.frame(in: .global).minX, y: proxy.frame(in: .global).midY)
                                rightImagesPoint.append(imagePosition(id: index, position: rightImagePosition))
                            }
                        })
                    }
                }
            }
            .padding(.horizontal, 122)
            .padding(.vertical, 60)
            
            
        }
        //MARK: OnAppear
        .onAppear{
            leftImages = QuizViewModel().getLeftImagesShuffled(question: question)
            rightImages = QuizViewModel().getRightImagesShuffled(question: question)
            if isQuestionDone {
                DispatchQueue.main.async{
                    showAllAnswers()
                    
                }
            }
        }
        .onChange(of: leftSelected) { oldValue, newValue in
            updateIsCorrect()
            
        }
        .onChange(of: rightSelected) { oldValue, newValue in
            updateIsCorrect()
        }
    }
    
    //MARK: Get All Left & Right Images
    func getLeftImages(question: Question) -> [String]{
        var allLeftImages: [String] = []
        if let answers = question.answers {
            for item in answers {
                if let illustration = (item as AnyObject).illustration {
                    allLeftImages.append(illustration ?? Constant.defaultIllustration)
                }
            }
        }
        allLeftImages = allLeftImages.shuffled()
        return allLeftImages
    }
    
    func getRightImages(question: Question) -> [String]{
        var allRightImages: [String] = []
        if let answers = question.answers {
            for item in answers {
                if let illustration = (item as AnyObject).illustration1 {
                    allRightImages.append(illustration ?? Constant.defaultIllustration)
                }
            }
        }
        allRightImages = allRightImages.shuffled()
        return allRightImages
    }
    
    
    //MARK: Check Answers -> Bool
    func checkedAnswers(leftImage: String, rightImage: String, question: Question) -> Bool {
        if let answers = question.answers {
            for item in answers {
                if (item as AnyObject).illustration == leftImage && (item as AnyObject).illustration1 == rightImage {
                    return true
                }
            }
        }
        return false
    }
    
    //MARK: Update The Correct Connecting Images
    func updateIsCorrect() {
        if let leftIndex = leftSelected, let rightIndex = rightSelected {
            isCorrect = checkedAnswers(leftImage: leftImages[leftIndex], rightImage: rightImages[rightIndex], question: question)
            if isCorrect == true{
                for item in leftImagesPoint{
                    if item.id == leftIndex{
                        correctLeftPosition.append(imagePosition(id: item.id, position: item.position, isCorrect: true))
                        
                    }
                }
                for item in rightImagesPoint{
                    if item.id == rightIndex{
                        correctRightPosition.append(imagePosition(id: item.id, position: item.position, isCorrect: true)
                        )
                    }
                }
                
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
                    withAnimation(Animation.easeInOut(duration: 0.2)){
                        leftSelected = nil
                        rightSelected = nil
                    }
                }
                
                if correctLeftPosition.count == leftImagesPoint.count{
                    allImagesCorrect = true
                    isCorrectState = true
                    QuizViewModel().updateQuestionIsDone(question: question)
                    isQuestionDone = true
                }
                
                isMatchingRight = false
                isMatchingLeft = false
                
            }
            else {
                //MARK: False Connect
                isFalse = true
                /// state failed so user must try again
                DispatchQueue.main.asyncAfter(deadline: .now()+0.5){
                    withAnimation(Animation.bouncy(duration: 0.5)){
                        isFalse = false
                        leftSelected = nil
                        rightSelected = nil
                        isMatchingRight = false
                        isMatchingLeft = false
                    }
                }
            }
        }
    }
    
    //MARK: Get IsCorrect
    func getIsCorrectLeftImage(id: Int) -> Bool {
        for item in correctLeftPosition {
            if item.id == id {
                return item.isCorrect ?? false
            }
        }
        return false
    }
    func getIsCorrectRightImage(id: Int) -> Bool {
        for item in correctRightPosition {
            if item.id == id {
                return item.isCorrect ?? false
            }
        }
        return false
    }
    
    func showAllAnswers(){
        for indexLeft in self.leftImagesPoint {
            for indexRight in self.rightImagesPoint {
                let isAnswerCorrect = checkedAnswers(leftImage: leftImages[indexLeft.id], rightImage: rightImages[indexRight.id], question: question)
                if isAnswerCorrect  {
                    correctLeftPosition.append(imagePosition(id: indexLeft.id, position: indexLeft.position, isCorrect: true))
                    correctRightPosition.append(imagePosition(id: indexRight.id, position: indexRight.position, isCorrect: true))
                }
            }
        }
    }
    
}

