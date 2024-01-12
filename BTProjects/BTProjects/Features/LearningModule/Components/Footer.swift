//
//  Footer.swift
//  BTProjects
//
//  Created by Sarah Uli Octavia on 13/11/23.
//

import SwiftUI

struct Footer: View {
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    var footerState: ViewState
    @Binding var isDisabled: Bool
    @Binding var bookScene: Int
    @Binding var countVideoPlayed: Int
    var maxBookScene: Int
    var words: String = " "
    var highlightWord: String
    
    @State private var isAnimate:Bool = false
    @State private var offset: CGFloat = 100
    @State private var heightWord: CGFloat = 0
    @State private var maxHeightWord: CGFloat = 0
    @State private var scale: CGFloat = 0
        @State private var opacity: Double = 0
    
    init(footerState: ViewState,  bookScene:Binding<Int>, isDisabled:Binding<Bool>, words: String, highlightWord: String, maxBookScene: Int) {
        self.footerState = footerState
        _isDisabled = isDisabled
        _bookScene = bookScene
        _countVideoPlayed = .constant(1)
        self.words =  words
        self.highlightWord = highlightWord
        self.maxBookScene = maxBookScene
    }
    init(footerState: ViewState, isDisabled:Binding<Bool>, bookScene:Binding<Int>, maxBookScene: Int) {
        self.footerState = footerState
        _isDisabled = isDisabled
        _bookScene = bookScene
        _countVideoPlayed = .constant(1)
        words =  " "
        highlightWord = " "
        self.maxBookScene = maxBookScene
    }
    
    init(footerState: ViewState,bookScene:Binding<Int>, countVideoPlayed:Binding<Int>, maxBookScene: Int) {
        self.footerState = footerState
        _isDisabled = .constant(false)
        _bookScene = bookScene
        _countVideoPlayed = countVideoPlayed
        self.maxBookScene = maxBookScene
        words =  " "
        highlightWord = " "
        
    }
    
    var body: some View {
        
        HStack (alignment: .bottom, spacing: 15){
            // MARK: Back Button
            if footerState == .story{
                VStack{
                    Spacer()
                    Button(action: {
                        if(bookScene <= 1){
                            bookScene = 1
                        }else{
                            bookScene -= 1
                        }
                    }) {
                        Image(systemName: "arrowshape.left.fill")
                            .font(.Button)
                        
                    }
                    .buttonStyle(CircularButtonStyle(disabled: isDisabled))
                    .disabled(isDisabled)
                    .opacity(bookScene <= 1 ? 0 : 1)
                }
            } else {
                VStack{
                    Spacer()
                    Button(action: {
                        if(bookScene <= 1){
                            bookScene = 1
                        }else{
                            bookScene -= 1
                        }
                    }) {
                        Image(systemName: "arrowshape.left.fill")
                            .font(.Button)
                        
                    }
                    .buttonStyle(CircularButtonStyle())
                    .opacity(bookScene <= 1 ? 0 : 1)
                }
            }
            
            if footerState == .story{
                VStack(alignment: .leading){
                    Text(words)
                        .offset(y:offset)
                        .font(.Subhead1_Medium)
                        .lineLimit(nil)
                        .multilineTextAlignment(.leading)
                        .padding(.horizontal, 22)
                        .padding(.vertical, 18)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .frame(height: 105)
                        .background(
                            GeometryReader{ geo in
                                RoundedRectangle(cornerRadius: 12)
                                    .fill(Color(.systemGray6))
                                    .scaleEffect(y: scale)
                                    .offset(y: (1 - scale) * geo.size.height)
                                    .opacity(opacity)
                                    .onAppear{
                                        withAnimation(.easeInOut(duration: 0.5)){
                                            scale = 1
                                            opacity = 1
                                        }
                                    }
                            }
                        )
                        .cornerRadius(12)
                }
                .onAppear{
                    withAnimation(.spring(duration: 2)){
                        offset = 0
                        
                    }
                    
                }
            } else {
                Spacer()
                    .frame(maxWidth: .infinity)
            }
            
            
            // MARK: Next Button
            VStack{
                Spacer()
                if footerState != .summary{
                    
                    Button(action: {
                        if(bookScene >= maxBookScene-1){
                            presentationMode.wrappedValue.dismiss()
                        }else{
                            bookScene += 1
                        }
                    }) {
                        Image(systemName: "arrowshape.right.fill")
                            .font(.Button)
                    }
                    .buttonStyle(CircularButtonStyle(disabled: isDisabled))
                    .disabled(isDisabled)
                    
                    .opacity(bookScene >= maxBookScene ? 0 : 1)
                    
                }
                else {
                    
                    Button(action: {
                        if(bookScene >= maxBookScene){
                            bookScene = maxBookScene
                        }else{
                            bookScene += 1
                        }
                    }) {
                        HStack(alignment: .center){
                            Text("Lanjut Latihan")
                                .font(.Caption_Medium)
                            Image(systemName: "arrowshape.right.fill")
                                .font(.Button)
                        }
                    }
                    .buttonStyle(RoundedButtonStyle(disabled: isDisabled))
                    .disabled(isDisabled)
                    
                    
                }
                
            }
            
            
        }
        .frame(height: 105)
        
        
    }
}

//#Preview {
//    Footer(footerState: .story, bookScene: .constant(3), isDisabled: .constant(true), words: "Sarah", highlightWord: "tolong", maxBookScene: 6)
//}
