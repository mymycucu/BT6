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
            HStack(spacing: 10) {
                if (index == 0){
                    Circle()
                        .fill(Color.purple.opacity(0))
                        .frame(width: 10)
                    Circle()
                        .fill(Color.purple.opacity(0))
                        .frame(width: 30)
                }
                if (index == 1){
                    Circle()
                        .fill(Color.purple.opacity(0))
                        .frame(width: 10)
                }
                
                ForEach(0..<categories.count, id: \.self) { i in
                    if (i > index-3 && i < index+3){
                        Button(action: {
                            self.index = i
                        }) {
                            Circle()
                                .fill(index == i ? Color.purple : Color.purple.opacity(0.5))
                                .frame(width: index == i ? 50 : i == index-1 || i == index+1  ? 30 : 10)
                                .animation(.easeInOut, value: index)
                        }
                    }
                }
                
                if (index == categories.count - 2){
                    Circle()
                        .fill(Color.purple.opacity(0))
                        .frame(width: 10)
                }
                if (index == categories.count - 1){
                    Circle()
                        .fill(Color.purple.opacity(0))
                        .frame(width: 30)
                    Circle()
                        .fill(Color.purple.opacity(0))
                        .frame(width: 10)
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
        
        let categoryLingkungan = Category(context: PersistenceController.shared.viewContext)
        categoryLingkungan.name = "Lingkungan"
        
        let categorySekolah = Category(context: PersistenceController.shared.viewContext)
        categorySekolah.name = "Sekolah"
        
        let categories = Category(context: PersistenceController.shared.viewContext)
        categories.name = "test"
        
       return [categoryRumah, categorySekolah, categoryLingkungan, categories]
    }())
}




    


