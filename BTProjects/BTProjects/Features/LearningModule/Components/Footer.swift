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
    var maxBookScene: Int
    var words: String
    var highlightWord: String
    
    init(footerState: ViewState, isDisabled:Binding<Bool>, bookScene:Binding<Int>, words: String, highlightWord: String, maxBookScene: Int) {
        self.footerState = footerState
        _isDisabled = isDisabled
        _bookScene = bookScene
        self.words =  words
        self.highlightWord = highlightWord
        self.maxBookScene = maxBookScene
    }
    
    init(footerState: ViewState, isDisabled:Binding<Bool>, bookScene:Binding<Int>, maxBookScene: Int) {
        self.footerState = footerState
        _isDisabled = isDisabled
        _bookScene = bookScene
        self.maxBookScene = maxBookScene
        words =  " "
        highlightWord = " "
        
    }
    
    var body: some View {
        
        HStack (spacing: 15 ){
            // MARK: Back Button
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
            
            if footerState == .story{
                VStack(alignment: .leading){
                    // the database needs to insert \n so it will be more neat
                    if words.split(separator: " ").count < 11 || words.count < 75 {
                        Spacer()
                    }
//                    if words.split(separator: "\n").count <= 1 {
//                        Spacer()
//                    }
                    StoryText(words: words, highlightWord: highlightWord)
                    
                }
            } else {
                Spacer()
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
                    .buttonStyle(RoundedButtonStyle())
                }
            }
            
            
        }
        .frame(height: 105)
        
        
    }
}

//#Preview {
//    Footer()
//}
