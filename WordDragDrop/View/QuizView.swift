//
//  QuizView.swift
//  WordDragDrop
//
//  Created by Sarah Uli Octavia on 16/10/23.
//

import SwiftUI

struct QuizView: View {
    @State var words: [Word] = words_
    @State var shuffledWords: [Word] = words_
    
    @State var progress: CGFloat = 0
    
    //animate wrong text dropped
    @State var animateWrongText: Bool = false
    @State var droppedCount: CGFloat = 0
    
    var rows: [GridItem] = [
        GridItem(.fixed(20), spacing: nil, alignment: .center)
    ]
    
    var body: some View {
        VStack{
            NavBar()
                .padding(.bottom,30)
            // MARK: dropped area
            LazyHGrid(rows: rows, spacing: 15, content: {
                ForEach($words){ $item in
                    VStack (alignment:.center) {
                        Text(item.value)
                            .font(.title)
                            .padding(.vertical, 5)
                            .padding(.horizontal, item.padding)
                            .background{
                                //if item is dropped
                                RoundedRectangle(cornerRadius: 6, style: .continuous)
                                    .stroke(item.isShowing ? .gray : .clear)
                            }
                            .opacity(item.isShowing ? 1:0 )
                        
                        Rectangle()
                            .foregroundColor(.clear)
                            .frame(width: 210, height: 10)
                            .background(Color(red: 0.39, green: 0.39, blue: 0.4))
                            .cornerRadius(100)
                        
                    }
                    .contentShape(Rectangle())
                    .onDrop(of: [.url], isTargeted: .constant(false)){
                        providers in
                        
                        if let first = providers.first{
                            let _ = first.loadObject(ofClass: URL.self) { value, error in
                                guard let url = value else {return}
                                if item.id == "\(url)"{
                                    withAnimation {
                                        droppedCount += 1
                                        let progress = (droppedCount/CGFloat(words.count))
                                        item.isShowing = true
                                        updateShuffledWords(word: item)
                                        self.progress = progress
                                    }
                                } else {
                                    animateView()
                                }
                            }
                        }
                        
                        return false
                    }
                    
                    
                }
            })
            .frame(width: (UIScreen.main.bounds.width-50))
            
            // MARK: drag area
            LazyHGrid(rows: rows, spacing: 10, content: {
                ForEach(shuffledWords){ item in
                    Text(item.value)
                        .font(.title)
                        .padding(.vertical, 5)
                        .padding(.horizontal, item.padding)
                        .background{
                            RoundedRectangle(cornerRadius: 6, style: .continuous)
                                .stroke(.gray)
                        }
                        .opacity(item.isShowing ? 0 : 1)
                        .background{
                            RoundedRectangle(cornerRadius: 6, style: .continuous)
                                .fill(item.isShowing ?  .gray.opacity(0.25): .clear)
                        }
                        .onDrag{
                            return .init(contentsOf: URL(string: item.id))!
                            
                        }
                }
                
                
            })
            .frame(width: (UIScreen.main.bounds.width-50))
            
            Spacer()
        }
        .padding(30)
        .onAppear{
            shuffledWords =  shuffledWords.shuffled()
        }
        .offset(x: animateWrongText ? -30 : 0)
        
    }
    // MARK: Custom NavBar
    @ViewBuilder
    func NavBar() -> some View {
        HStack(spacing:15){
            
            
            GeometryReader{ proxy in
                ZStack(alignment: .leading){
                    Capsule()
                        .fill(Color.orange2.opacity(0.25))
                    Capsule()
                        .fill(Color.orange3)
                        .frame(width: proxy.size.width * progress)
                }
            }
            .frame(height: 30)
            
            Button{
                
            }label: {
                Image(systemName: "questionmark.circle")
                    .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                    .foregroundColor(.gray)
            }
        }
    }
    
    // MARK: Updating Shuffled Words
    func updateShuffledWords(word: Word){
        for index in shuffledWords.indices{
            if shuffledWords[index].id == word.id{
                shuffledWords[index].isShowing = true
            }
        }
    }
    
    
    // MARK: Animating View When Wrong Text Dropped
    func animateView() {
        withAnimation(.interactiveSpring(response: 0.3, dampingFraction: 0.2, blendDuration:0.2)){
            animateWrongText = true
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.1){
            withAnimation(.interactiveSpring(response: 0.3, dampingFraction: 0.2, blendDuration:0.2)){
                animateWrongText = false
            }
        }
    }
}

#Preview {
    QuizView()
}
