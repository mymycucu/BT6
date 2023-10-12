//
//  Question.swift
//  WordDragDrop
//
//  Created by Sarah Uli Octavia on 11/10/23.
//

import Foundation
import SwiftUI

//enum QuestionType : String {
//    case word = "word"
//    case sentence = "sentence"
//}

struct Question : Codable, Identifiable{
    
    enum CodingKeys: CodingKey {
        case questionValue
        case questionType
    }
    let id = UUID()
    var questionValue : [String]
    var questionType : String
    
//    init(from decoder: Decoder) throws {
//        let container = try decoder.container(keyedBy: CodingKeys.self)
//        
//        // Decode properties based on their types
//        questionValue = try container.decode([String].self, forKey: .questionValue)
//        questionType = try container.decode(String.self, forKey: .questionType)
//    }
//    
//    func encode(to encoder: Encoder) throws {
//        var container = encoder.container(keyedBy: CodingKeys.self)
//        
//        // Encode properties based on their types
//        try container.encode(id, forKey: .id)
//        try container.encode(questionValue, forKey: .questionValue)
//        try container.encode(questionType, forKey: .questionType)
//    }
}

//extension Question{
//    init?(from strings : [String]){
//        self = .init(id: UUID(), questionValue: strings as  [NSString], questionType: QuestionType.sentence.rawValue)
//    }
//}




class QuestionViewModel: ObservableObject {
    @Published var question = [Question]()
    
    init() {
        loadData()
    }
    
//    func loadData() {
//        guard let url = Bundle.main.url(forResource: "questions", withExtension: "json")
//            else {
//                print("json file not found")
//                return
//            }
//        
//        let data = try? Data(contentsOf: url)
//        let question = try? JSONDecoder().decode([Question].self, from: data!)
//        
//        self.question = question!
//    }
    
    func loadData(){
        if let url = Bundle.main.url(forResource: "questions", withExtension: "json") {
            do {
                let data = try Data(contentsOf: url) // Try to load data; this line can throw errors
                print(String(data: data, encoding: .utf8)!)
                let decoder = JSONDecoder()
                let question = try decoder.decode([Question].self, from: data) // Try to decode data; this line can throw errors
                self.question = question
                
    //            for item in questions {
    //                addQuestion(item: item)
    //            }
    //            saveContext()
            } catch {
                print("Error loading or decoding data: \(error.localizedDescription)")
            }
            
        } else {
            print("JSON File not found.")
            return
        }
    }
    
//    func addQuestion(item: Question){
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
}
