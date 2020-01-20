//
//  ViewController.swift
//  Tic
//
//  Created by Mayo Olojo on 1/17/20.
//  Copyright © 2020 Mayo Olojo. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    //varables
    @IBOutlet weak var TITLE: UILabel!
    //collection of buttons
    @IBOutlet var rowTwo: [UIButton]!
    @IBOutlet var rowOne: [UIButton]!
    @IBOutlet var rowThree: [UIButton]!
    @IBOutlet var colOne: [UIButton]!
    @IBOutlet var colTwo: [UIButton]!
    @IBOutlet var colThree: [UIButton]!
    @IBOutlet var diag1: [UIButton]!
    @IBOutlet var diag2: [UIButton]!
    //varables
    var buttons: [[UIButton]]!
    var isPlayerOneTurn = true
    var gameWon = false
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        TITLE.text = "Player One Turn"
        
     
    }
  
    
   

    @IBAction func buttonPressed(_ sender: UIButton) {
        print("button pressed \(sender.tag)")
        if isPlayerOneTurn == true{
            //TITLE.text = "Player One Turn"
            sender.setImage(UIImage(named: "Cross"), for: .normal)
            sender.isUserInteractionEnabled = false
            sender.tag = 1
            TITLE.text = "Player Two Turn"
            if Won(){
                EndGame()
            }
            
        }else{
            sender.setImage(UIImage(named: "Nought"), for: .normal)
            sender.isUserInteractionEnabled = false
            sender.tag = 2
            TITLE.text = "Player One Turn"
            if Won(){
                EndGame()
            }
        }
        isPlayerOneTurn = !isPlayerOneTurn
        
    }
    
    @IBAction func RestartTap(_ sender: UIButton) {
        for button in rowOne{
            button.setImage(nil, for: .normal)
            button.isUserInteractionEnabled = true
            button.tag = 0
        }
        for button in rowTwo{
            button.setImage(nil, for: .normal)
            button.isUserInteractionEnabled = true
            button.tag = 0
        }
        for button in rowThree{
            button.setImage(nil, for: .normal)
            button.isUserInteractionEnabled = true
            button.tag = 0
        }
        TITLE.text = "Player One Turn"
    }
    
    func RowWin(rowArray:Array<UIButton>){
        var score = 0
        for button in rowArray{
            if button.tag == 0{
                score = -100
            }else{
                score = score + button.tag
            }
        }
        if score == 3{
            TITLE.text = "Player One Wins!"
            gameWon = true
        } else if score == 6{
            TITLE.text = "Player Two Wins"
            gameWon = true
        }
    }
    
    //this function checks to see if a row,col, or diag is completed
    func Won() -> Bool{
        gameWon = false
        RowWin(rowArray: rowOne)
        RowWin(rowArray: rowTwo)
        RowWin(rowArray: rowThree)
        RowWin(rowArray: colOne)
        RowWin(rowArray: colTwo)
        RowWin(rowArray: colThree)
        RowWin(rowArray: diag1)
        RowWin(rowArray: diag2)
        return gameWon
    }
    
    //this function locks the buttons from moves
    func EndGame(){
        for button in rowOne{
            button.isUserInteractionEnabled = false
        }
        for button in rowTwo{
            button.isUserInteractionEnabled = false
        }
        for button in rowThree{
            button.isUserInteractionEnabled = false
        }
    }
}

