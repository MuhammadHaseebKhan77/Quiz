//
//  ViewController.swift
//  Quizzler-iOS13
//
//  Created by Angela Yu on 12/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var progressBar: UIProgressView!
    @IBOutlet weak var questionLabel: UILabel!
    
    @IBOutlet weak var scoreLabel: UILabel!
    
    @IBOutlet weak var falseButton: UIButton!
    @IBOutlet weak var trueButton: UIButton! //
    var quizBrain=QuizBrain()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // questionLabel.text=quiz[questionNumber] this will only update one time when our view will load but we need to update it every time button is pressed so we will create the function call every time
        updateUI()
        
    }
        @IBAction func answerButtonPressed(_ sender: UIButton) {
            let userAnswer=sender.currentTitle!// ture or false
            let userGotItRight=quizBrain.checkAnswer(userAnswer)
            if userGotItRight{
                sender.backgroundColor=UIColor.green
            }else{
                sender.backgroundColor=UIColor.red
            }
            quizBrain.nextQuestion()
            
            Timer.scheduledTimer(timeInterval: 0.2, target: self, selector: #selector(updateUI), userInfo: nil, repeats: false)
            
        }
        @objc func updateUI(){
            questionLabel.text=quizBrain.getQuestionText()
            progressBar.progress=quizBrain.getProgress()
            scoreLabel.text="Score \(quizBrain.getScore())"
            trueButton.backgroundColor=UIColor.clear
            falseButton.backgroundColor=UIColor.clear
            //   progressBar.progress=Float(questionNumber+1)/Float(quiz.count)//we add to questionnumber because at start question number is 0 and 0 divide by anything is zero so we added 1 to it now when the question 1 apear the progress bar will start to move and it will also move all the way
        }
    }
    

