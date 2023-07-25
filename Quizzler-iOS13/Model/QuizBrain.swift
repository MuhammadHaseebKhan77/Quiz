//
//  QuizBrain.swift
//  Quizzler-iOS13
//
//  Created by Apple on 02/06/2023.
//  Copyright © 2023 The App Brewery. All rights reserved.
//

import Foundation
struct QuizBrain{
    let quiz=[
        Questions(q: "A slug's blood is green.", a: "True"),
        Questions(q: "Approximately one quarter of human bones are in the feet.", a: "True"),
        Questions(q: "The total surface area of two human lungs is approximately 70 square metres.", a: "True"),
        Questions(q: "In West Virginia, USA, if you accidentally hit an animal with your car, you are free to take it home to eat.", a: "True"),
        Questions(q: "In London, UK, if you happen to die in the House of Parliament, you are technically entitled to a state funeral, because the building is considered too sacred a place.", a: "False"),
        Questions(q: "It is illegal to pee in the Ocean in Portugal.", a: "True"),
        Questions(q: "You can lead a cow down stairs but not up stairs.", a: "False"),
        Questions(q: "Google was originally called 'Backrub'.", a: "True"),
        Questions(q: "Buzz Aldrin's mother's maiden name was 'Moon'.", a: "True"),
        Questions(q: "The loudest sound produced by any animal is 188 decibels. That animal is the African Elephant.", a: "False"),
        Questions(q: "No piece of square dry paper can be folded in half more than 7 times.", a: "False"),
        Questions(q: "Chocolate affects a dog's heart and nervous system; a few ounces are enough to kill a small dog.", a: "True")
        
        
    ]
    
    var questionNumber=0
    var Score=0
    
    mutating func checkAnswer(_ userAnswer:String)->Bool{
        if userAnswer==quiz[questionNumber].answer{
            Score=Score+1
            return true
        }else{
            return false
        }
    }
    
    func getScore()->Int{
        return Score
    }
    func getQuestionText()->String{
        return quiz[questionNumber].text
    }
    func getProgress()->Float{
        let progress=Float(questionNumber)/Float(quiz.count) //
        return progress
    }
    mutating func nextQuestion(){// this mutating keyword will change the property of the quiz brain function if we wnat to change the property of some function inside that function we use mutating in this scenerio mutating  will tell the computer that it will change the question number every time it gets answered
        
        if questionNumber+1<quiz.count{
            questionNumber=questionNumber+1
        }else{
            questionNumber=0
        }
    }
}
