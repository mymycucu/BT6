//
//  Header.swift
//  BTProjects
//
//  Created by Sarah Uli Octavia on 13/11/23.
//

import SwiftUI


struct Header: View {
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    @Binding var isMenu: Bool
    @Binding var isExitState: Bool
    var headerState: ViewState
    var currentQuiz: Int
    var totalQuiz: Int
    
    init(isMenu: Binding<Bool>, isExitState:Binding<Bool>, headerState: ViewState) {
        _isMenu = isMenu
        _isExitState = isExitState
        self.headerState = headerState
        self.currentQuiz =  0
        self.totalQuiz = 0
    }
    
    init(isMenu: Binding<Bool>, isExitState:Binding<Bool>, headerState: ViewState, currentQuiz: Int, totalQuiz: Int) {
        _isMenu = isMenu
        _isExitState = isExitState
        self.headerState = headerState
        self.currentQuiz = currentQuiz
        self.totalQuiz = totalQuiz
    }
    
    
    var body: some View {
        HStack(alignment: .center, spacing: 15){
            Button(action: {
                isMenu.toggle()
            }) {
                Image(systemName: "list.bullet")
                    .font(.Button)
            }
            .buttonStyle(CircularButtonStyle())
            
            if headerState == .quiz{
                ProgressBar(totalWords: totalQuiz, step: currentQuiz)
                    .frame(maxWidth: .infinity)
            } else {
                Spacer()
                    .frame(maxWidth: .infinity)
                
            }
            
            
            Button(action: {
                isExitState.toggle()
            }) {
                Image(systemName: "xmark")
                    .font(.Button)
            }
            .buttonStyle(CircularButtonStyle())
        }
    }
}

//#Preview {
//    Header(isMenu: .constant(false))
//}
