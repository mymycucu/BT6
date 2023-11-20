//
//  QuizViewModel.swift
//  BTProjects
//
//  Created by Sarah Uli Octavia on 16/11/23.
//

import Foundation

class QuizViewModel : ObservableObject {
    //MARK: save array of images
    @Published var leftImages: [String] = []
    @Published var rightImages: [String] = []
    
    //MARK: Get All Left & Right Images
    func getLeftImagesShuffled(question: Question) -> [String]{
        var allLeftImages: [String] = []
        if let answers = question.answers {
            for item in answers {
                if let illustration = (item as AnyObject).illustration {
                    allLeftImages.append(illustration ?? Constant.defaultIllustration)
                }
            }
        }
        allLeftImages = allLeftImages.shuffled()
        return allLeftImages
    }
    
    func getRightImagesShuffled(question: Question) -> [String]{
        var allRightImages: [String] = []
        if let answers = question.answers {
            for item in answers {
                if let illustration = (item as AnyObject).illustration1 {
                    allRightImages.append(illustration ?? Constant.defaultIllustration)
                }
            }
        }
        allRightImages = allRightImages.shuffled()
        return allRightImages
    }
    
    
    //MARK: Check Answers -> Bool
    func checkedAnswers(leftImage: String, rightImage: String, question: Question) -> Bool {
        
        if let answers = question.answers {
            for item in answers {
                if (item as AnyObject).illustration == leftImage && (item as AnyObject).illustration1 == rightImage {
                    
                    return true
                    
                }
            }
        }
        return false
    }

    func updateQuestionIsDone(question: Question){
        question.isDone = true
        do{
            try PersistenceController.shared.viewContext.save()
        }catch(let error){
            print(error)
        }
    }

}
