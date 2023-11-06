//
//  ListOfPageView.swift
//  BTProjects
//
//  Created by Dary Ramadhan on 06/11/23.
//

import SwiftUI

struct ListOfPageView: View {
    
    @State var customAlert = false
    
    //    private let columns: [GridItem] = [
    //            GridItem(.fixed(254), spacing: 24, alignment: .center),
    //            GridItem(.fixed(254), spacing: 24, alignment: .center)
    //        ]
    
    var body: some View {
        //        VStack() {
        //            Text("Halo")
        //
        //        }
        //        .padding(600)
        //        .background(
        //                LinearGradient(colors: [.PB600,.PB500], startPoint: .top, endPoint: .bottom)
        //                    .edgesIgnoringSafeArea(.all)
        //
        //        )
        ZStack {
            VStack(spacing: 25) {
                Button(action: {
                    withAnimation{
                        customAlert.toggle()
                    }
                }, label: {
                    Text("Munculkan Overlay")
                })
            }
            if customAlert {
                CustomListView(show: $customAlert)
            }
        }
        .edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
        
    }
}

struct CustomListView: View {
    
    @Binding var show : Bool
    @State var story1 = "story-1"
    @State var story2 = "story-2"
    
    @State var isSelect = 1
    
    var body: some View {
        ZStack (alignment: Alignment(horizontal: .trailing, vertical: .top), content: {
            
            ScrollView(.vertical, showsIndicators: false) {
                VStack(spacing: 20) {
                    Text("Stories")
                        .font(.Heading2_Semibold)
                        .foregroundColor(.white)
                    
                    VStack(spacing: 32) {
                        HStack (spacing: 32) {
                            Button(action: {
                                isSelect = 1
                            }, label: {
                                ThumbnailPage(isSelect: $isSelect, order: 1)
                            })
                            
                            Button(action: {
                                isSelect = 2
                            }, label: {
                                ThumbnailPage(isSelect: $isSelect, order: 2)
                            })
                        }
                        HStack (spacing: 32) {
                            Rectangle()
                                .frame(width: 316, height: 230)
                                .cornerRadius(12)
                            Rectangle()
                                .frame(width: 316, height: 230)
                                .cornerRadius(12)
                        }
                    }
                    

                    Text("Question")
                        .font(.Heading2_Semibold)
                        .foregroundColor(.white)
                    
//                    VStack(spacing: 32) {
//                        HStack (spacing: 32) {
//                            ZStack {
//                                ThumbnailPage()
//                            }
//                            
//                            Image(story2)
//                                .frame(width: 316, height: 230)
//                                .cornerRadius(12)
//                        }
//                        HStack (spacing: 32) {
//                            Rectangle()
//                                .frame(width: 316, height: 230)
//                                .cornerRadius(12)
//                            Rectangle()
//                                .frame(width: 316, height: 230)
//                                .cornerRadius(12)
//                        }
//                    }
        
                    
                }
                .padding(.vertical, 25)
                .padding(.horizontal, 30)
                .cornerRadius(25)
            }
            //Main Content
            
            
            Button(action: {
                
                withAnimation{
                    show.toggle()
                }
                
            }, label: {
                Image(systemName: "xmark.circle")
                    .font(.system(size: 40, weight: .bold))
                    .foregroundColor(.white)
            })
            .padding()
        })
        
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .padding(.top, 43)
        .background(
            Color.primary.opacity(0.7)
        )
        
    }
}

#Preview {
    ListOfPageView()
}
