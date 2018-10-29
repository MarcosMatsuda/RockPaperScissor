//
//  PlayViewController.swift
//  Roshambo
//
//  Created by Marcos Matsuda on 27/10/2018.
//  Copyright © 2018 Marcos Matsuda. All rights reserved.
//

import UIKit

class PlayViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func paper(_ sender: Any) {
        
        var message = (label: "", image: "")
        
        let player1 = "paper"
        let player2 = enemyMovement()
        
        print(player2)
        
        if player1 == player2 {
            message.label = "Empatou"
            message.image = "itsATie"
        }else if player1 == "paper" && player2 == "scissor" {
            message.label = "Perdeu"
            message.image = "ScissorsCutPaper"
        } else {
            message.label = "Ganhou"
            message.image = "PaperCoversRock"
        }
        
        let controller: ResultViewController
        controller = storyboard?.instantiateViewController(withIdentifier: "ResultViewController") as! ResultViewController
        
        controller.resultText = message.label
        controller.image = message.image
        present(controller, animated: true, completion: nil)
        
    }
    
    @IBAction func rock(_ sender: Any) {
        
        var message:(String, String)
        let player1 = "rock"
        let player2 = enemyMovement()
        
        //draw verify
        if player1 == player2 {
            message = (label: "Empatou", image: "itsATie")
        }else if player1 == "rock" && player2 == "paper" {
            //perdi
            message = (label: "Perdeu", image: "PaperCoversRock")
        }else {
            //ganhei
            message = (label: "Ganhou", image: "RockCrushesScissors")
        }
    }
    
    @IBAction func scissor(_ sender: Any) {
        
        var message:(String, String)
        let player1 = "scissor"
        let player2 = enemyMovement()
        
        //draw verify
        if player1 == player2 {
            message = (label: "Empatou", image: "itsATie")
        }else if player1 == "scissor" && player2 == "rock" {
            //perdi
            message = (label: "Perdeu", image: "RockCrushesScissors")
        }else {
            //ganhei
            message = (label: "Ganhou", image: "ScissorsCutPaper")
        }
    }
    
    private func enemyMovement() -> String{
        
        let number: Int = Int.random(in: 0 ..< 3)
        let enemyAction: String
        
        switch number {
            
            case 0:
               enemyAction = "paper"
            case 1:
                enemyAction = "rock"
            
        default:
            enemyAction = "scissor"
        }
        
        return enemyAction
    }
    

    
    
}
