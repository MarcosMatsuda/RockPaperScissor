//
//  PlayViewController.swift
//  Roshambo
//
//  Created by Marcos Matsuda on 27/10/2018.
//  Copyright © 2018 Marcos Matsuda. All rights reserved.
//

import UIKit

class PlayViewController: UIViewController {
    
    var message = (label: "", image: "")

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func paper(_ sender: Any) {
        
        let player1 = "paper"
        let player2 = enemyMovement()
        
        if player1 == player2 {
            self.message.label = "Empatou"
            self.message.image = "itsATie"
        }else if player1 == "paper" && player2 == "scissor" {
            self.message.label = "Perdeu"
            self.message.image = "ScissorsCutPaper"
        } else {
            self.message.label = "Ganhou"
            self.message.image = "PaperCoversRock"
        }
        
        let controller: ResultViewController
        controller = storyboard?.instantiateViewController(withIdentifier: "ResultViewController") as! ResultViewController
        
        controller.resultText = self.message.label
        controller.imageOfResult = self.message.image
        present(controller, animated: true, completion: nil)
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        let player2 = enemyMovement()
        
        if segue.identifier == "RockSegue" {
        
            let player1 = "rock"

            if player1 == player2 {
                self.message.label = "Empatou"
                self.message.image = "itsATie"
            }else if player1 == "rock" && player2 == "paper" {
                self.message.label = "Perdeu"
                self.message.image = "PaperCoversRock"
            } else {
                self.message.label = "Ganhou"
                self.message.image = "RockCrushesScissors"
            }

            let controller = segue.destination as? ResultViewController
            controller?.imageOfResult = self.message.image
            controller?.resultText = self.message.label
            
        }else if segue.identifier == "ScissorSegue" {
            let player1 = "rock"
            if player1 == player2 {
                self.message.label = "Empatou"
                self.message.image = "itsATie"
            }else if player1 == "scissor" && player2 == "rock" {
                self.message.label = "Perdeu"
                self.message.image = "RockCrushesScissors"
            } else {
                self.message.label = "Ganhou"
                self.message.image = "ScissorsCutPaper"
            }
            
            let controller = segue.destination as? ResultViewController
            controller?.imageOfResult = self.message.image
            controller?.resultText = self.message.label
        }
    }
    
    @IBAction func scissor(_ sender: Any) {        
        performSegue(withIdentifier: "ScissorSegue", sender: self)
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
