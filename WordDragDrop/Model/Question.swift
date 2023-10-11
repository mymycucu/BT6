//
//  Question.swift
//  WordDragDrop
//
//  Created by Sarah Uli Octavia on 11/10/23.
//

import Foundation

//enum QuestionType : String {
//    case word = "word"
//    case sentence = "sentence"
//}

struct Question : Codable, Identifiable{
    var id: UUID
    var questionValue : [String]
    var questionType : String
    
//    enum CodingKeys: String, CodingKey {
//        case id
//        case questionValue
//        case questionType
//    }
//    
//    init(from decoder: Decoder) throws {
//        let container = try decoder.container(keyedBy: CodingKeys.self)
//        
//        // Decode properties based on their types
//        id = try container.decode(UUID.self, forKey: .id)
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


class ReadJson: ObservableObject {
    @Published var question = [Question]()
    
    init() {
        loadData()
    }
    
    func loadData(){
        guard let url = Bundle.main.url(forResource: "questions", withExtension: "json")
        else {
            print("JSON File not found.")
            return
        }
        let data = try? Data(contentsOf: url)
        let question = try? JSONDecoder().decode([Question].self, from: data!)
        self.question = question!
    }
}
