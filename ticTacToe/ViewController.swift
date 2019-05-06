//
//  ViewController.swift
//  ticTacToe
//
//  Created by Victor Dang on 5/4/19.
//  Copyright © 2019 Victor Dang. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var winner: UILabel!;
    @IBOutlet weak var startBtn: UIButton!;
    @IBOutlet weak var cell1: UIButton!;            //top left
    @IBOutlet weak var cell2: UIButton!;
    @IBOutlet weak var cell3: UIButton!;
    @IBOutlet weak var cell4: UIButton!;
    @IBOutlet weak var cell5: UIButton!;
    @IBOutlet weak var cell6: UIButton!;
    @IBOutlet weak var cell7: UIButton!;
    @IBOutlet weak var cell8: UIButton!;
    @IBOutlet weak var cell9: UIButton!;            //bottom right
    
    var currentPlayer = 1
    var state = [0,0,0,0,0,0,0,0,0,0] // array that represents the board
    let winningCombos = [[0, 1, 2], [3, 4, 5], [6, 7, 8], [0, 3, 6], [1, 4, 7], [2, 5, 8], [0, 4, 8], [2, 4, 6]] // possible winning combinations on the board
    var gameActive = true
    
    //when a user presses a box , it fills it with a cross or circle depending on whose turn it is
    @IBAction func action(_ sender: AnyObject) {
    if(state[sender.tag-1] == 0){
        state[sender.tag-1] = currentPlayer
            if(currentPlayer == 1){
                sender.setImage(UIImage(named:"cross.png"), for: UIControlState())
                currentPlayer = 2
                }
            else{
                sender.setImage(UIImage(named:"circle.png"), for: UIControlState())
                currentPlayer = 1
            }
        }
        for combo in winningCombos{
            if state[combo[0]] != 0 && state[combo[0]] == state[combo[1]] && state[combo[1]] == state[combo[2]]{
                gameActive = false
                if(state[combo[0]] == 1){
                    winner.text = "Cross Wins!"
                    startBtn.isEnabled = true;
                    print("cross wins");
                    gameEnded();
                    for i in state{
                        print("state \(i) = \(state[i])")
                        state[i] = 0;
                    }
                }
                else{
                    winner.text = "Circle Wins!"
                    print("circle wins")
                    gameEnded();
                    for i in state{
                        print("state \(i) = \(state[i])")
                        state[i] = 0;
                    }
                }
        }
    }
        
        
        //logic for draw? i dont know why its not working
        
        /*
        gameActive = false
        
        for i in state
        {
            if i == 0
            {
                gameActive = true
                break
            }
        }
        
        if gameActive == false
        {
            winner.text = "IT WAS A DRAW"
        }
        
        
        */
        
}
    
    @IBAction func startGameBtnPress(sender: UIButton){
        //Game begins, start button greyed out till late
        startBtn.isEnabled = false;
        cell1.isEnabled = true;
        cell2.isEnabled = true;
        cell3.isEnabled = true;
        cell4.isEnabled = true;
        cell5.isEnabled = true;
        cell6.isEnabled = true;
        cell7.isEnabled = true;
        cell8.isEnabled = true;
        cell9.isEnabled = true;
        cell1.setImage(nil, for: UIControlState())
        cell2.setImage(nil, for: UIControlState())
        cell3.setImage(nil, for: UIControlState())
        cell4.setImage(nil, for: UIControlState())
        cell5.setImage(nil, for: UIControlState())
        cell6.setImage(nil, for: UIControlState())
        cell7.setImage(nil, for: UIControlState())
        cell8.setImage(nil, for: UIControlState())
        cell9.setImage(nil, for: UIControlState())
        state = [0,0,0,0,0,0,0,0,0,0];
        winner.text = "";
    }
    
    func gameEnded(){
        startBtn.isEnabled = true;
        gameActive = false;
        cell1.isEnabled = false;
        cell2.isEnabled = false;
        cell3.isEnabled = false;
        cell4.isEnabled = false;
        cell5.isEnabled = false;
        cell6.isEnabled = false;
        cell7.isEnabled = false;
        cell8.isEnabled = false;
        cell9.isEnabled = false;
    }
    
    override func viewDidLoad() {
        super.viewDidLoad();
        cell1.isEnabled = false;
        cell2.isEnabled = false;
        cell3.isEnabled = false;
        cell4.isEnabled = false;
        cell5.isEnabled = false;
        cell6.isEnabled = false;
        cell7.isEnabled = false;
        cell8.isEnabled = false;
        cell9.isEnabled = false;
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

