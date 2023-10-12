//
//  ContentView.swift
//  WordDragDrop
//
//  Created by Sarah Uli Octavia on 10/10/23.
//

import SwiftUI
import CoreData

struct ContentView: View {
    @Environment (\.managedObjectContext)
    private var viewContext
//    @FetchRequest(entity:Question.entity(),
//                  sortDescriptors: [])
//    private var items: FetchedResults<Question>
    
    @ObservedObject var data = QuestionViewModel()
    
    // MARK: Properties
    @State var progress: CGFloat = 0
    @State var words: [Word] = words_
    //    @State var questions: [Question]
    
    
    // MARK: Custom Grid Arrays
    //drag words
    @State var shuffledWords: [[Word]] = []
    //drop
    @State var rows: [[Word]] = []
    
    //animate wrong text dropped
    @State var animateWrongText: Bool = false
    @State var droppedCount: CGFloat = 0
    var body: some View {
        VStack(spacing:30){
            NavBar()
            HStack(spacing: 25){
                Rectangle()
                    .fill(Color.orange)
                    .frame(height: 250)
                    .cornerRadius(20)
                Rectangle()
                    .fill(Color.orange)
                    .frame(height: 250)
                    .cornerRadius(20)
//                LottieView(name: "cat-hat-lilac-rest", loopMode: .loop)
//                    .frame(height: 250)
            }
            .padding(30)
//            DropArea()
//                .padding(.vertical,30)
//            DragArea()
            
            List(data.question) { item in
                Text(item.questionType)
                    .font(.title)
                    .foregroundStyle(Color.primary1)
                
                ForEach(item.questionValue, id: \.hash){word in
                    Text(word as String)
                }
                
            }
            
            
            Button("Selesai") {
                print("Primary Button")
            }
            .buttonStyle(PrimaryActiveButtonStyle())
            Spacer()
        }
        .padding(30)
        .onAppear{
            if rows.isEmpty{
                words = words.shuffled()
                shuffledWords = generatingGrid()
                words = words_
                rows = generatingGrid()
            }
        }
        .offset(x: animateWrongText ? -30 : 0)
    }
    
    
//    private func loadData(){
//        guard let url = Bundle.main.url(forResource: "questions", withExtension: "json") else {
//            print("JSON File not found.")
//            return
//        }
//        
//        do {
//            let data = try Data(contentsOf: url) // Try to load data; this line can throw errors
//            let decoder = JSONDecoder()
//            let questions = try decoder.decode([Question].self, from: data) // Try to decode data; this line can throw errors
//            
//            for item in questions {
//                addQuestion(item: item)
//            }
//            saveContext()
//        } catch {
//            print("Error loading or decoding data: \(error.localizedDescription)")
//        }
//    }
//    
//    private func addQuestion(item: Question){
//        withAnimation {
//            if item.first(where: {$0.id == item}) == nil {
//                let newQuestion = Question(context: viewContext)
//                newQuestion.id = question.id
//                newQuestion.questionType = question.questionType
//                newQuestion.questionValue = question.questionValue
//                
//                saveContext()
//            }
//        }
//    }
//    
//    func saveContext() {
//        do {
//            try viewContext.save()
//        } catch {
//            print("Error saving context: \(error.localizedDescription)")
//        }
//    }
    
    // MARK: Drag Area
    @ViewBuilder
    func DragArea() -> some View{
        VStack(spacing: 12){
            ForEach(shuffledWords, id:\.self){ row in
                HStack(spacing: 10){
                    ForEach(row){ item in
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
                }
                if shuffledWords.last != row {
                    Divider()
                }
                
            }
        }
    }
    
    // MARK: Drop Area
    @ViewBuilder
    func DropArea() -> some View{
        VStack(spacing: 12){
            ForEach($rows, id:\.self){ $row in
                HStack(spacing: 10){
                    ForEach($row){ $item in
                        Text(item.value)
                            .font(.title)
                            .padding(.vertical, 5)
                            .padding(.horizontal, item.padding)
                            .opacity(item.isShowing ? 1:0 )
                            .background{
                                RoundedRectangle(cornerRadius: 6, style: .continuous)
                                    .fill(item.isShowing ? .clear : .gray.opacity(0.25))
                            }
                            .background{
                                //if item is dropped
                                RoundedRectangle(cornerRadius: 6, style: .continuous)
                                    .stroke(.gray)
                            }
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
                }
                if rows.last != row {
                    Divider()
                }
            }
        }
    }
    
    
    // MARK: Custom NavBar
    @ViewBuilder
    func NavBar() -> some View {
        HStack(spacing:15){
            
            Button{
                
            }label: {
                Image(systemName: "xmark")
                    .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                    .foregroundColor(.gray)
            }
            
            GeometryReader{ proxy in
                ZStack(alignment: .leading){
                    Capsule()
                        .fill(.gray.opacity(0.25))
                    Capsule()
                        .fill(.green)
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
    
    // MARK: Generating Custom Grid Columns
    func generatingGrid() -> [[Word]]{
        //Identifying each words width and updating into state var
        for item in words.enumerated(){
            let textSize = textSize(word: item.element)
            
            words[item.offset].textSize = textSize
        }
        
        var gridArray: [[Word]] = []
        var tempArray: [Word] = []
        
        //Current Width
        var currentWidth: CGFloat = 0
        // -30 -> Horizontal padding
        let totalScreenWidth: CGFloat = UIScreen.main.bounds.width - 30
        
        for word in words{
            currentWidth += word.textSize
            
            if currentWidth < totalScreenWidth {
                tempArray.append(word)
            }else{
                gridArray.append(tempArray)
                tempArray = []
                currentWidth = word.textSize
                tempArray.append(word)
            }
        }
        //check
        if !tempArray.isEmpty{
            gridArray.append(tempArray)
        }
        
        return gridArray
    }
    
    // MARK: Identifying Text Size
    func textSize (word: Word) -> CGFloat {
        let font = UIFont.systemFont(ofSize: word.fontSize)
        
        let attributes = [NSAttributedString.Key.font : font]
        
        let size = (word.value as NSString).size(withAttributes: attributes)
        
        //Horizontal padding
        return size.width + (word.padding * 2)
    }
    
    // MARK: Updating Shuffled Words
    func updateShuffledWords(word: Word){
        for index in shuffledWords.indices{
            for subIndex in shuffledWords[index].indices{
                if shuffledWords[index][subIndex].id == word.id{
                    shuffledWords[index][subIndex].isShowing = true
                }
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
    ContentView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
}
