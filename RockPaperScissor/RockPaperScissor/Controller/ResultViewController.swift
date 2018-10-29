//
//  ResultViewController.swift
//  Roshambo
//
//  Created by Marcos Matsuda on 27/10/2018.
//  Copyright © 2018 Marcos Matsuda. All rights reserved.
//

import UIKit

class ResultViewController: UIViewController {

    var resultText: String?
    var image: String?
    
    @IBOutlet weak var result: UILabel!
    @IBOutlet weak var imageResult: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        if let resultText = self.resultText {
            result.text = resultText
        }
        
        if let image = self.image {
            
        }
        
    }

    @IBAction func playAgain(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
