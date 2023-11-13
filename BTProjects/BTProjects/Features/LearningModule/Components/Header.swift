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
    @Binding var headerState: ViewState
    @Binding var currentQuiz: Int
    @Binding var totalQuiz: Int
    
    init(isMenu: Binding<Bool>, headerState: Binding<ViewState>) {
        _isMenu = isMenu
        _headerState = headerState
        _currentQuiz =  Binding.constant(0)
        _totalQuiz = Binding.constant(0)
    }
    
    init(isMenu: Binding<Bool>, headerState: Binding<ViewState>, currentQuiz: Binding<Int>, totalQuiz: Binding<Int>) {
            _isMenu = isMenu
            _headerState = headerState
            _currentQuiz = currentQuiz
            _totalQuiz = totalQuiz
        }
    
    
    var body: some View {
        HStack(spacing: 15){
            Button(action: {
                isMenu.toggle()
            }) {
                Image(systemName: "list.bullet")
                    .font(.Button)
            }
            .buttonStyle(CircularButtonStyle())
            
            if headerState == .quiz{
                ProgressBar(totalWords: $totalQuiz, step: $currentQuiz)
            } else {
               Spacer()
            }
            
            Button(action: {
                presentationMode.wrappedValue.dismiss()
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
