//
//  Question.swift
//  WordDragDrop
//
//  Created by Sarah Uli Octavia on 11/10/23.
//

import Foundation
import SwiftUI
import CoreData

struct Question : Codable, Identifiable{
    
    enum CodingKeys: CodingKey {
        case questionValue
        case questionType
    }
    var id = UUID()
    var questionValue : [String]
    var questionType : String
    
}


class QuestionViewModel: ObservableObject {
    static let shared = QuestionViewModel()
    let viewContext = PersistenceController.shared.container.viewContext
    @Published var question = [Question]()
    @Published var questionsList : [QuestionEntity] = []
    
    init() {
        loadData()
    }
    
    func loadData(){
        if let url = Bundle.main.url(forResource: "questions", withExtension: "json") {
            do {
                let data = try Data(contentsOf: url) // Try to load data
                let decoder = JSONDecoder()
                let question = try decoder.decode([Question].self, from: data) // Try to decode data
                self.question = question
                
                for item in question {
                    addQuestion(item: item)
                }
                saveContext()
            } catch {
                print("Error loading or decoding data: \(error.localizedDescription)")
            }
            
        } else {
            print("JSON File not found.")
            return
        }
    }
    
    
    func fetchQuestionsFromCoreData() {
        let request = NSFetchRequest<QuestionEntity>(entityName: "QuestionEntity")
        request.predicate = NSPredicate(value: true)
        withAnimation(Animation.default) {
            do{
                questionsList = try viewContext.fetch(request)
            }
            catch let error{
                print("Error fetching questions from Core Data: \(error.localizedDescription)")
            }
        }
    }
    
    func addQuestionToCoreData(value: [String], type: String) {
        let newQuestion = QuestionEntity(context: viewContext)
        newQuestion.questionValue = value
        newQuestion.questionType = type
        
        
        withAnimation(Animation.default) {
            do{
                try viewContext.save()
            }
            catch{
                print(error.localizedDescription)
            }
        }
        
        fetchQuestionsFromCoreData()
    }
    
    func addQuestion(item : Question) {
        withAnimation(Animation.default){
            if !questionsList.contains(where: { $0.questionValue == item.questionValue && $0.questionType == item.questionType }) {
                // Create a new QuestionEntity and set its properties
                let newQuestionEntity = QuestionEntity(context: viewContext)
                newQuestionEntity.questionValue = item.questionValue
                newQuestionEntity.questionType = item.questionType

                saveContext() // Save the updated list to Core Data
            }
        }
    }
    
    func saveContext() {
        do {
            try viewContext.save()
        } catch {
            print("Error saving context: \(error.localizedDescription)")
        }
    }
}
