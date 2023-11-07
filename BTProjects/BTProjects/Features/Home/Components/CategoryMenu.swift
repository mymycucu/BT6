//
//  CategoryMenu.swift
//  BTProjects
//
//  Created by Sarah Uli Octavia on 06/11/23.
//

import SwiftUI

struct CategoryMenu: View {
    let categories = [Category(colors: .red),Category(colors: .cyan),Category(colors: .yellow),
                      Category(colors: .orange),Category(colors: .blue),Category(colors: .purple),
                      Category(colors: .green),]
    @Binding var category: Category?
    @State private var selectedCategoryIndex = 0 // Index of the initially selected category'
    
    var body: some View {
//        ScrollViewReader { scrollView in
//            ScrollView(.horizontal, showsIndicators: false) {
//                HStack(spacing: 20) {
//                    Spacer(minLength: UIScreen.main.bounds.width / 2)
//                    ForEach(categories.indices, id: \.self) { index in
//                        CategoryButton(item: categories[index])
//                            .id(index) // Set an ID for the button
//                    }
//                    .scrollTransition(.interactive, axis: .horizontal) { content, phase in
//                        content
//                            .scaleEffect (
//                                x: phase.isIdentity ? 1.0 : 0,
//                                y: phase.isIdentity ? 1.0 : 0)
//                    }
//                }
//                .scrollTargetLayout()
//            }
//            .onAppear {
//                scrollToMiddle(scrollView: scrollView)
//            }
//            .frame(width: 480, height: 90)
//            .scrollPosition(id: $category)
//            .contentMargins(.horizontal, 2, for: .scrollContent)
//            //            .scrollClipDisabled()
//            .scrollTargetBehavior(.viewAligned)
//        }
                VStack{
                    GeometryReader {geometry in
                        let size = geometry.size.width
                        let padding = (size - 85) / 2
        
                        ScrollView(.horizontal, showsIndicators: false){
                            HStack(alignment:.center){
                                ForEach(categories, id: \.id) { item in
                                    CategoryButton(item: item, action: {
                                                        category = item
                                                    })
        
        
                                }
                                .scrollTransition(.interactive, axis: .horizontal) { content, phase in
                                    content
                                        .scaleEffect (
                                            x: phase.isIdentity ? 1.0 : 0.6,
                                            y: phase.isIdentity ? 1.0 : 0.6)
                                }
        
                            }
                            .scrollTargetLayout()
                        }
                        .scrollPosition(id: $category)
                        .contentMargins(.horizontal, 2, for: .scrollContent)
                        .safeAreaPadding(.horizontal,padding)
                        .scrollTargetBehavior(.viewAligned)
        
                    }
                    .frame(width: 460, height: 90)
                    .onTapGesture {
                            // To end editing or dismiss keyboard if needed
                            UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
                        }
                }
        
    }
    
    func scrollToMiddle(scrollView: ScrollViewProxy) {
        // Scroll to the middle of the ScrollView
        let middleIndex = selectedCategoryIndex
        withAnimation {
            scrollView.scrollTo(middleIndex, anchor: .center)
        }
    }
}

#Preview {
    CategoryMenu(category: .constant(nil))
}
