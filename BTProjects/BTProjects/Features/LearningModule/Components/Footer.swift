//
//  Footer.swift
//  BTProjects
//
//  Created by Sarah Uli Octavia on 13/11/23.
//

import SwiftUI

struct Footer: View {
    @Binding var footerState: ViewState
    @Binding var isDisabled: Bool
    var words: String
    var highlightWord: String
    
    init(footerState: Binding<ViewState>, isDisabled:Binding<Bool>, words: String, highlightWord: String) {
        _footerState = footerState
        _isDisabled = isDisabled
        self.words =  words
        self.highlightWord = highlightWord
    }
    
    init(footerState: Binding<ViewState>, isDisabled:Binding<Bool>) {
        _footerState = footerState
        _isDisabled = isDisabled
        words =  " "
        highlightWord = " "
    }
    
    var body: some View {
        
        HStack (spacing: 15 ){
            // MARK: Back Button
            Button(action: {
                
            }) {
                Image(systemName: "arrowshape.left.fill")
                    .font(.Button)
            }
            .buttonStyle(CircularButtonStyle())
            
            if footerState == .story{
                StoryText(words: words, highlightWord: highlightWord)
            } else {
                Spacer()
            }
            
            
            // MARK: Next Button
            if footerState != .summary{
                Button(action: {
                    
                }) {
                    Image(systemName: "arrowshape.right.fill")
                        .font(.Button)
                }
                .buttonStyle(CircularButtonStyle(disabled: isDisabled))
                
            } else {
                
                Button(action: {
                    // Your action here
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
        .frame(height: 105)
        
        
    }
}

//#Preview {
//    Footer()
//}
