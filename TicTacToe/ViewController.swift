//
//  ViewController.swift
//  TicTacToe
//
//  Created by silicon on 6/10/18.
//  Copyright © 2018 Foslipy. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        showTurn()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBOutlet weak var cTurnP1: UILabel!
    @IBOutlet weak var cTurnP2: UILabel!
    @IBOutlet weak var p1WinCnt: UILabel!
    @IBOutlet weak var p2WinCnt: UILabel!
    
    @IBAction func btnBox(_ sender: Any) {
        let buButton = sender as! UIButton
        playGame(buButton: buButton)
    }
    
    var btnOb = [UIButton]()
    var ActiveUser = 1
    var player1 = [Int]()
    var player2 = [Int]()
    var winCntP1 = 0
    var winCntP2 = 0
    
    func showTurn() {
        if ActiveUser == 1{
            cTurnP1.text = "Player 1"
            cTurnP2.text = " "
        }else if ActiveUser == 2{
            cTurnP2.text = "Player 2"
            cTurnP1.text = " "
        }
    }
    
    func playGame(buButton: UIButton) {
        if ActiveUser == 1{
            buButton.setTitle("X", for: UIControlState.normal)
            player1.append(buButton.tag)
            ActiveUser = 2
            showTurn()
        }else{
            buButton.setTitle("O", for: UIControlState.normal)
            player2.append(buButton.tag)
            ActiveUser = 1
            showTurn()
        }
        buButton.isEnabled = false
        btnOb.append(buButton)
        findWinner()
    }
    
    
    func resetBoard() {
        for btn in btnOb {
            btn.isEnabled = true
            btn.setTitle("", for: UIControlState.normal)
        }
        player2.removeAll()
        player1.removeAll()
        ActiveUser = 1
        showTurn()
    }
    
    @IBAction func clearWinCount(_ sender: Any) {
        winCntP2 = 0
        winCntP1 = 0
        p2WinCnt.text = String(winCntP2)
        p1WinCnt.text = String(winCntP1)
    }
    
    
    func findWinner(){
        var winner = -1
        if player1.contains(1) && player1.contains(2) && player1.contains(3){
            winner = 1
        }else if player2.contains(1) && player2.contains(2) && player2.contains(3){
            winner = 2
        }else if player1.contains(4) && player1.contains(5) && player1.contains(6){
            winner = 1
        }else if player2.contains(4) && player2.contains(5) && player2.contains(6){
            winner = 2
        }else if player2.contains(7) && player2.contains(8) && player2.contains(9){
            winner = 2
        }else if player1.contains(7) && player1.contains(8) && player1.contains(9){
            winner = 1
        }else if player2.contains(1) && player2.contains(4) && player2.contains(7){
            winner = 2
        }else if player1.contains(1) && player1.contains(4) && player1.contains(7){
            winner = 1
        }else if player2.contains(2) && player2.contains(5) && player2.contains(8){
            winner = 2
        }else if player1.contains(2) && player1.contains(5) && player1.contains(8){
            winner = 1
        }else if player2.contains(3) && player2.contains(6) && player2.contains(9){
            winner = 2
        }else if player1.contains(3) && player1.contains(6) && player1.contains(9){
            winner = 1
        }else if player2.contains(1) && player2.contains(5) && player2.contains(9){
            winner = 2
        }else if player1.contains(1) && player1.contains(5) && player1.contains(9){
            winner = 1
        }else if player2.contains(3) && player2.contains(5) && player2.contains(7){
            winner = 2
        }else if player1.contains(3) && player1.contains(5) && player1.contains(7){
            winner = 1
        }
        
        var msg = "Try agin."
        if winner == 1{
            msg = "Player 1 is winner."
            winCntP1 += 1
            p1WinCnt.text = String(winCntP1)
        }else if winner == 2{
            msg = "Player 2 is winner."
            winCntP2 += 1
            p2WinCnt.text = String(winCntP2)
        }
        if winner == 1 || winner == 2{
            let alert = UIAlertController(title: "Winner", message: msg, preferredStyle: UIAlertControllerStyle.alert)
            alert.addAction(UIAlertAction(title: "ok", style: UIAlertActionStyle.default, handler: nil))
            self.present(alert, animated: true, completion: nil)
            
        }else if (player1.count + player2.count) == 9{
            let alert = UIAlertController(title: "Tie", message: msg, preferredStyle: UIAlertControllerStyle.alert)
            alert.addAction(UIAlertAction(title: "ok", style: UIAlertActionStyle.default, handler: nil))
            self.present(alert, animated: true, completion: nil)
            
        }
    }
    
    @IBAction func clearBoard(_ sender: Any) {
        resetBoard()
    }
    
    
}

