//
//  QuizViewModel.swift
//  BTProjects
//
//  Created by Sarah Uli Octavia on 16/11/23.
//

import Foundation

class quizViewModel : ObservableObject {
    //MARK: save array of images
    @Published var leftImages: [String] = []
    @Published var rightImages: [String] = []
    
    //MARK: Get All Left & Right Images
    func getLeftImages(question: Quest) -> [String]{
        var allLeftImages: [String] = []
        for item in question.answers {
            allLeftImages.append(item.illustration)
        }
        return allLeftImages
    }
    
    func getRightImages(question: Quest) -> [String]{
        var allRightImages: [String] = []
        for item in question.answers {
            allRightImages.append(item.illustration2)
        }
        return allRightImages
    }
    
    
    //MARK: Check Answers -> Bool
    func checkedAnswers(leftImage: String, rightImage: String, question: Quest) -> Bool {
        
        for item in question.answers {
            if item.illustration == leftImage && item.illustration2 == rightImage {
                
                return true
                
            }
        }
        return false
        
    }
}
