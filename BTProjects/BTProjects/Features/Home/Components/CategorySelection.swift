//
//  CategorySelection.swift
//  BTProjects
//
//  Created by Hilmy Noerfatih on 10/11/23.
//

import SwiftUI



struct CategorySelection: View {
    @Binding var index: Int
    var categories : [Category]
    var body: some View {
        VStack{
            HStack(spacing: 20) {
                if (index == 0){
                    Circle()
                        .fill(Color.purple.opacity(0))
                        .frame(width: 42)
                    Circle()
                        .fill(Color.purple.opacity(0))
                        .frame(width: 68)
                }
                if (index == 1){
                    Circle()
                        .fill(Color.purple.opacity(0))
                        .frame(width: 42)
                }
                
                ForEach(0..<categories.count, id: \.self) { i in
                    if (i > index-3 && i < index+3){
                        Button(action: {
                            self.index = i
                        }) {
                            Image(categories[i].illustration ?? Constant.defaultIllustration)
                                .resizable()
                                .scaledToFit()
                                .frame(width: index == i ? 84 : i == index-1 || i == index+1  ? 68 : 42)
                                .animation(.easeInOut, value: index)
                        }
                    }
                }
                
                if (index == categories.count - 2){
                    Circle()
                        .fill(Color.purple.opacity(0))
                        .frame(width: 42)
                }
                if (index == categories.count - 1){
                    Circle()
                        .fill(Color.purple.opacity(0))
                        .frame(width: 68)
                    Circle()
                        .fill(Color.purple.opacity(0))
                        .frame(width: 42)
                }
                
            }
            if (!categories.isEmpty){
                Text(categories[index].name ?? "Category").foregroundStyle(Color.Gray6).bold()
            }
        }
    }
}

#Preview {
    CategorySelection(index: .constant(1), categories: {
        let categoryRumah = Category(context: PersistenceController.shared.viewContext)
        categoryRumah.name = "Rumah"
        categoryRumah.illustration = "home_cat_rumah"
        
        let categoryLingkungan = Category(context: PersistenceController.shared.viewContext)
        categoryLingkungan.name = "Lingkungan"
        categoryLingkungan.illustration = "home_cat_lingkungan"
        
        let categorySekolah = Category(context: PersistenceController.shared.viewContext)
        categorySekolah.name = "Sekolah"
        categorySekolah.illustration = "home_cat_sekolah"
        
        let categories = Category(context: PersistenceController.shared.viewContext)
        categories.name = "test"
        
       return [categoryRumah, categorySekolah, categoryLingkungan, categories]
    }())
}




    


