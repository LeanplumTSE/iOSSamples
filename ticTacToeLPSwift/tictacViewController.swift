//
//  tictacViewController.swift
//  ticTacToeSwift
//
//  Created by Sophie Saouma on 2/20/15.
//  Copyright (c) 2015 SSaouma. All rights reserved.
//

import UIKit
class tictacViewController: UIViewController {
    
    // Leanplum Variables
    // These variables can be changed from the content mangement tab in Leanplum.
    // The following comments below explain the purpose of the variables
    
    // Strings
    
    // play1 - player one's
    // play2 - player two's
    //
    // We kept it simple with the Xs and Os, but feel free to include
    // your own! Such as emojis or different lettrs!
    var play1 = LPVar.define("play1", withString: "X")
    var play2 = LPVar.define("play2", withString: "O")
    
    // HeaderGame - The title of the game (as seen in the view controller)
    var headerGame = LPVar.define("headerGame", withString: "Leanplum TicTacToe")
    
    // Dictionary
    // BoardTiles contains the float numbers to customize the colour purple through
    // RGB.You'll see the switch of colours on the board tiles when you click on
    // the (when you click on the 'Colour me Purple...' button.
    // You can alter the entries through the Leanplum content mangement page.
    var boardTiles2 = LPVar.define("boardTiles2", withDictionary: ["red":183.0,
        "green":0.0, "blue":151.0])
    
    @IBOutlet weak var buttonOne:UIButton!
    @IBOutlet weak var buttonTwo:UIButton!
    @IBOutlet weak var buttonThree:UIButton!
    @IBOutlet weak var buttonFour:UIButton!
    @IBOutlet weak var buttonFive:UIButton!
    @IBOutlet weak var buttonSix:UIButton!
    @IBOutlet weak var buttonSeven:UIButton!
    @IBOutlet weak var buttonEight:UIButton!
    @IBOutlet weak var buttonNine:UIButton!
    
    @IBOutlet weak var newButton:UIButton!
    
    @IBOutlet weak var changeColours:UIButton!
    
    @IBOutlet weak var titleGame:UILabel!
    @IBOutlet weak var player:UILabel!
    
    
    // Variable Set-Up
    //
    // purpleColour - int between 1 or 0:
    // Determines what shade of purple the board is currently coloured.
    // This variable changes whenever a user toggles on the 'Colour me Purple...'
    // UIButton.
    //
    // Player turn is incremented by one whenever a player marks the board. After
    // 9 turns, the board automatically calls a tie. If a player resets the board,
    // this number goes back to zero.
    var purpleColour = 0
    var playerTurn = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Leanplum onVariablesChangedAndNoDownloadsPending ensures that the
        // callback for images is done properly. We do recommend this particular
        // call for images and files.
        
        Leanplum.onVariablesChangedAndNoDownloadsPending({
            
            self.view.backgroundColor =
                UIColor(patternImage: UIImage(named: "Test.jpg")!);
            
        })
        Leanplum.onVariablesChanged({
            self.titleGame.text = self.headerGame.stringValue()
            self.play1.stringValue()
            self.play2.stringValue()
            
        })
        
        buttonOne.setTitle(" ", forState:
            UIControlState.Normal)
        buttonOne.backgroundColor = UIColor(red: CGFloat(151.0/255.0), green: CGFloat(0.0/255.0), blue: CGFloat(138.0/255.0), alpha: CGFloat(1.0))
        
        
        buttonTwo.setTitle(" ", forState:UIControlState.Normal)
        buttonTwo.backgroundColor = UIColor(red: CGFloat(151.0/255.0), green: CGFloat(0.0/255.0), blue: CGFloat(138.0/255.0), alpha: CGFloat(1.0))
        
        
        buttonThree.setTitle(" ", forState:UIControlState.Normal)
        buttonThree.backgroundColor = UIColor(red: CGFloat(151.0/255.0), green: CGFloat(0.0/255.0), blue: CGFloat(138.0/255.0), alpha: CGFloat(1.0))
        
        
        buttonFour.setTitle(" ", forState:UIControlState.Normal)
        buttonFour.backgroundColor = UIColor(red: CGFloat(151.0/255.0), green: CGFloat(0.0/255.0), blue: CGFloat(138.0/255.0), alpha: CGFloat(1.0))
        
        
        buttonFive.setTitle(" ", forState:UIControlState.Normal)
        buttonFive.backgroundColor = UIColor(red: CGFloat(151.0/255.0), green: CGFloat(0.0/255.0), blue: CGFloat(138.0/255.0), alpha: CGFloat(1.0))
       
        
        buttonSix.setTitle(" ", forState:UIControlState.Normal)
        buttonSix.backgroundColor = UIColor(red: CGFloat(151.0/255.0), green: CGFloat(0.0/255.0), blue: CGFloat(138.0/255.0), alpha: CGFloat(1.0))
        
        
        buttonSeven.setTitle(" ", forState:UIControlState.Normal)
        buttonSeven.backgroundColor = UIColor(red: CGFloat(151.0/255.0), green: CGFloat(0.0/255.0), blue: CGFloat(138.0/255.0), alpha: CGFloat(1.0))
        
        
        
        buttonEight.setTitle(" ", forState:UIControlState.Normal)
        buttonEight.backgroundColor = UIColor(red: CGFloat(151.0/255.0), green: CGFloat(0.0/255.0), blue: CGFloat(138.0/255.0), alpha: CGFloat(1.0))
        
        
        buttonNine.setTitle(" ", forState:UIControlState.Normal)
        buttonNine.backgroundColor = UIColor(red: CGFloat(151.0/255.0), green: CGFloat(0.0/255.0), blue: CGFloat(138.0/255.0), alpha: CGFloat(1.0))
        
        
        titleGame.textColor = UIColor(red: CGFloat(255.0/255.0), green: CGFloat(20.0/255.0), blue: CGFloat(147.0/255.0), alpha:(1.0))
        
        
        
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // Whenever a player presses a button, then this just checks
    // whose turn it is and marks the board correctly. It also
    // checks if there is a winner or a tie.
    // If there is a tie, an alert message is show to the user and
    // the board is cleared.
    @IBAction func buttonPressed(sender: UIButton){
        
        if(playerTurn%2==0){
            sender.enabled = false
            sender.setTitleColor( UIColor.whiteColor(), forState: UIControlState.Normal)
            sender.setTitle(play1.stringValue(), forState:UIControlState.Normal)
            Leanplum.track("Player1 Played")
            player1Wins()
            
        }
        
        self.player1Wins()
        if(playerTurn%2==1){
            
            sender.enabled = false
            sender.setTitleColor( UIColor.whiteColor(), forState: UIControlState.Normal)
            sender.setTitle(play2.stringValue(), forState:UIControlState.Normal)
            Leanplum.track("Player2 Played")
            player2Wins()
            
            
        }
        
        playerTurn++
        
        
        if(playerTurn==9){
            
            Leanplum.track("Tie")
            var alertTie = UIAlertController(title: "Winner Is..", message: "😪 N O - O N E 😪", preferredStyle: UIAlertControllerStyle.Alert)
            alertTie.addAction(UIAlertAction(title: "New Game Loser?", style: UIAlertActionStyle.Default, handler: nil))
            self.presentViewController(alertTie, animated: true, completion: nil)
            clearGame()
            
        }
        
       
    }
    
    // If the colour button is pressed, then the tiles
    // on the board are then changed to a different colour purple.
    // Snazzy!
    @IBAction func colourButtonPressed(sender: UIButton){
        
        if(purpleColour==0){
            
            buttonOne.backgroundColor = UIColor(red: CGFloat(151.0/255.0), green: CGFloat(0.0/255.0), blue: CGFloat(138.0/255.0), alpha: CGFloat(1.0))
            buttonTwo.backgroundColor = UIColor(red: CGFloat(151.0/255.0), green: CGFloat(0.0/255.0), blue: CGFloat(138.0/255.0), alpha: CGFloat(1.0))
            buttonThree.backgroundColor = UIColor(red: CGFloat(151.0/255.0), green: CGFloat(0.0/255.0), blue: CGFloat(138.0/255.0), alpha: CGFloat(1.0))
            
            buttonFour.backgroundColor = UIColor(red: CGFloat(151.0/255.0), green: CGFloat(0.0/255.0), blue: CGFloat(138.0/255.0), alpha: CGFloat(1.0))
            buttonFive.backgroundColor = UIColor(red: CGFloat(151.0/255.0), green: CGFloat(0.0/255.0), blue: CGFloat(138.0/255.0), alpha: CGFloat(1.0))
            buttonSix.backgroundColor = UIColor(red: CGFloat(151.0/255.0), green: CGFloat(0.0/255.0), blue: CGFloat(138.0/255.0), alpha: CGFloat(1.0))
            
            buttonSeven.backgroundColor = UIColor(red: CGFloat(151.0/255.0), green: CGFloat(0.0/255.0), blue: CGFloat(138.0/255.0), alpha: CGFloat(1.0))
            buttonEight.backgroundColor = UIColor(red: CGFloat(151.0/255.0), green: CGFloat(0.0/255.0), blue: CGFloat(138.0/255.0), alpha: CGFloat(1.0))
            buttonNine.backgroundColor = UIColor(red: CGFloat(151.0/255.0), green: CGFloat(0.0/255.0), blue: CGFloat(138.0/255.0), alpha: CGFloat(1.0))
            purpleColour = 1;
        }
        
        // This colour purple is special. The previous shade of purple can only be
        // changed through the code. This shade of purple can be changed through the
        // Leanplum dashboard. Go ahead and change the keys for red, blue, green! :)
            
        else{
           buttonOne.backgroundColor = UIColor(red: CGFloat(CGFloat(boardTiles2.objectForKey("red").floatValue)/255.0), green: CGFloat(CGFloat(boardTiles2.objectForKey("green").floatValue)/255.0), blue: CGFloat(CGFloat(boardTiles2.objectForKey("blue").floatValue)/255.0), alpha: CGFloat(1.0))
            buttonTwo.backgroundColor = UIColor(red: CGFloat(CGFloat(boardTiles2.objectForKey("red").floatValue)/255.0), green: CGFloat(CGFloat(boardTiles2.objectForKey("green").floatValue)/255.0), blue: CGFloat(CGFloat(boardTiles2.objectForKey("blue").floatValue)/255.0), alpha: CGFloat(1.0))
            buttonThree.backgroundColor = UIColor(red: CGFloat(CGFloat(boardTiles2.objectForKey("red").floatValue)/255.0), green: CGFloat(CGFloat(boardTiles2.objectForKey("green").floatValue)/255.0), blue: CGFloat(CGFloat(boardTiles2.objectForKey("blue").floatValue)/255.0), alpha: CGFloat(1.0))
            
            buttonFour.backgroundColor = UIColor(red: CGFloat(CGFloat(boardTiles2.objectForKey("red").floatValue)/255.0), green: CGFloat(CGFloat(boardTiles2.objectForKey("green").floatValue)/255.0), blue: CGFloat(CGFloat(boardTiles2.objectForKey("blue").floatValue)/255.0), alpha: CGFloat(1.0))
            buttonFive.backgroundColor = UIColor(red: CGFloat(CGFloat(boardTiles2.objectForKey("red").floatValue)/255.0), green: CGFloat(CGFloat(boardTiles2.objectForKey("green").floatValue)/255.0), blue: CGFloat(CGFloat(boardTiles2.objectForKey("blue").floatValue)/255.0), alpha: CGFloat(1.0))
            buttonSix.backgroundColor = UIColor(red: CGFloat(CGFloat(boardTiles2.objectForKey("red").floatValue)/255.0), green: CGFloat(CGFloat(boardTiles2.objectForKey("green").floatValue)/255.0), blue: CGFloat(CGFloat(boardTiles2.objectForKey("blue").floatValue)/255.0), alpha: CGFloat(1.0))
            
            buttonSeven.backgroundColor = UIColor(red: CGFloat(CGFloat(boardTiles2.objectForKey("red").floatValue)/255.0), green: CGFloat(CGFloat(boardTiles2.objectForKey("green").floatValue)/255.0), blue: CGFloat(CGFloat(boardTiles2.objectForKey("blue").floatValue)/255.0), alpha: CGFloat(1.0))
            buttonEight.backgroundColor = UIColor(red: CGFloat(CGFloat(boardTiles2.objectForKey("red").floatValue)/255.0), green: CGFloat(CGFloat(boardTiles2.objectForKey("green").floatValue)/255.0), blue: CGFloat(CGFloat(boardTiles2.objectForKey("blue").floatValue)/255.0), alpha: CGFloat(1.0))
            buttonNine.backgroundColor = UIColor(red: CGFloat(CGFloat(boardTiles2.objectForKey("red").floatValue)/255.0), green: CGFloat(CGFloat(boardTiles2.objectForKey("green").floatValue)/255.0), blue: CGFloat(CGFloat(boardTiles2.objectForKey("blue").floatValue)/255.0), alpha: CGFloat(1.0))
            purpleColour = 0
            
        }
        
    }
    //Clears the Gameboard and resets the Player count to zero
    func clearGame(){
        
        buttonOne.setTitle(" ", forState:UIControlState.Normal)
        buttonOne.enabled = true;
        
        buttonTwo.setTitle(" ", forState:UIControlState.Normal)
        buttonTwo.enabled = true;
        
        buttonThree.setTitle(" ", forState:UIControlState.Normal)
        buttonThree.enabled = true;
        
        buttonFour.setTitle(" ", forState:UIControlState.Normal)
        buttonFour.enabled = true;
        
        buttonFive.setTitle(" ", forState:UIControlState.Normal)
        buttonFive.enabled = true;
        
        buttonSix.setTitle(" ", forState:UIControlState.Normal)
        buttonSix.enabled = true;
        
        buttonSeven.setTitle(" ", forState:UIControlState.Normal)
        buttonSeven.enabled = true;
        
        buttonEight.setTitle(" ", forState:UIControlState.Normal)
        buttonEight.enabled = true;
        
        buttonNine.setTitle(" ", forState:UIControlState.Normal)
        buttonNine.enabled = true;
        
        playerTurn = 0
        
    }
    

    // Determines if Player 1 wins
    // Also shows an alert message if player 1 wins.
    func player1Wins(){
        
        //Top Row, Horizontal
        if(buttonOne.titleForState(UIControlState.Normal)==play1.stringValue() &&
            buttonTwo.titleForState(UIControlState.Normal)==play1.stringValue() &&
            buttonThree.titleForState(UIControlState.Normal)==play1.stringValue()){
                Leanplum.track("Player1 won")
                var alertOne = UIAlertController(title: "Winner Is..", message: play1.stringValue(), preferredStyle: UIAlertControllerStyle.Alert)
                alertOne.addAction(UIAlertAction(title: "New Game?", style: UIAlertActionStyle.Default, handler: nil))
                
                self.presentViewController(alertOne, animated: true, completion: nil)
                
                clearGame()
                
        }
        
        //Middle Row, Horizontal
        if(buttonFour.titleForState(UIControlState.Normal)==play1.stringValue() &&
            buttonFive.titleForState(UIControlState.Normal)==play1.stringValue() &&
            buttonSix.titleForState(UIControlState.Normal)==play1.stringValue()){
               
                Leanplum.track("Player1 won")
                var alertOne = UIAlertController(title: "Winner Is..", message: play1.stringValue(), preferredStyle: UIAlertControllerStyle.Alert)
                alertOne.addAction(UIAlertAction(title: "New Game?", style: UIAlertActionStyle.Default, handler: nil))
                
                self.presentViewController(alertOne, animated: true, completion: nil)
                
                clearGame()
                
        }
        
        //Bottom Row, Horizontal
        if(buttonSeven.titleForState(UIControlState.Normal)==play1.stringValue() &&
            buttonEight.titleForState(UIControlState.Normal)==play1.stringValue() &&
            buttonNine.titleForState(UIControlState.Normal)==play1.stringValue()){
                
                Leanplum.track("Player1 won")
                var alertOne = UIAlertController(title: "Winner Is..", message: play1.stringValue(), preferredStyle: UIAlertControllerStyle.Alert)
                alertOne.addAction(UIAlertAction(title: "New Game?", style: UIAlertActionStyle.Default, handler: nil))
                
                self.presentViewController(alertOne, animated: true, completion: nil)
                
                clearGame()
                
        }
        
        //Left, Vertical
        if(buttonOne.titleForState(UIControlState.Normal)==play1.stringValue() &&
            buttonFour.titleForState(UIControlState.Normal)==play1.stringValue() &&
            buttonSeven.titleForState(UIControlState.Normal)==play1.stringValue()){
                
                Leanplum.track("Player1 won")
                var alertOne = UIAlertController(title: "Winner Is..", message: play1.stringValue(), preferredStyle: UIAlertControllerStyle.Alert)
                alertOne.addAction(UIAlertAction(title: "New Game?", style: UIAlertActionStyle.Default, handler: nil))
                
                self.presentViewController(alertOne, animated: true, completion: nil)
                
                clearGame()
                
        }
        
        //Middle, Vertical
        if(buttonTwo.titleForState(UIControlState.Normal)==play1.stringValue() &&
            buttonFive.titleForState(UIControlState.Normal)==play1.stringValue() &&
            buttonEight.titleForState(UIControlState.Normal)==play1.stringValue()){
                
                Leanplum.track("Player1 won")
                var alertOne = UIAlertController(title: "Winner Is..", message: play1.stringValue(), preferredStyle: UIAlertControllerStyle.Alert)
                alertOne.addAction(UIAlertAction(title: "New Game?", style: UIAlertActionStyle.Default, handler: nil))
                
                self.presentViewController(alertOne, animated: true, completion: nil)
                
                clearGame()
                
        }
        
        
        //Right, Vertical
        if(buttonThree.titleForState(UIControlState.Normal)==play1.stringValue() &&
            buttonSix.titleForState(UIControlState.Normal)==play1.stringValue() &&
            buttonNine.titleForState(UIControlState.Normal)==play1.stringValue()){
                
                Leanplum.track("Player1 won")
                var alertOne = UIAlertController(title: "Winner Is..", message: play1.stringValue(), preferredStyle: UIAlertControllerStyle.Alert)
                alertOne.addAction(UIAlertAction(title: "New Game?", style: UIAlertActionStyle.Default, handler: nil))
                
                self.presentViewController(alertOne, animated: true, completion: nil)
                
                clearGame()
                
        }
        
        
        //Left to Right Diagonal
        if(buttonOne.titleForState(UIControlState.Normal)==play1.stringValue() &&
            buttonFive.titleForState(UIControlState.Normal)==play1.stringValue() &&
            buttonNine.titleForState(UIControlState.Normal)==play1.stringValue()){
                
                Leanplum.track("Player1 won")
                var alertOne = UIAlertController(title: "Winner Is..", message: play1.stringValue(), preferredStyle: UIAlertControllerStyle.Alert)
                alertOne.addAction(UIAlertAction(title: "New Game?", style: UIAlertActionStyle.Default, handler: nil))
                
                self.presentViewController(alertOne, animated: true, completion: nil)
                
                clearGame()
                
        }
        
        
        //Right to Left diagonal
        if(buttonThree.titleForState(UIControlState.Normal)==play1.stringValue() &&
            buttonFive.titleForState(UIControlState.Normal)==play1.stringValue() &&
            buttonSeven.titleForState(UIControlState.Normal)==play1.stringValue()){
                
                Leanplum.track("Player1 won")
                var alertOne = UIAlertController(title: "Winner Is..", message: play1.stringValue(), preferredStyle: UIAlertControllerStyle.Alert)
                alertOne.addAction(UIAlertAction(title: "New Game?", style: UIAlertActionStyle.Default, handler: nil))
                
                self.presentViewController(alertOne, animated: true, completion: nil)
                
                clearGame()
                
        }
    }
    
    func player2Wins(){
        
        //Top Row, Horizontal
        if(buttonOne.titleForState(UIControlState.Normal)==play2.stringValue() &&
            buttonTwo.titleForState(UIControlState.Normal)==play2.stringValue() &&
            buttonThree.titleForState(UIControlState.Normal)==play2.stringValue()){
                
                Leanplum.track("Player2 won")
                var alertOne = UIAlertController(title: "Winner Is..", message: play2.stringValue(), preferredStyle: UIAlertControllerStyle.Alert)
                alertOne.addAction(UIAlertAction(title: "New Game?", style: UIAlertActionStyle.Default, handler: nil))
                
                self.presentViewController(alertOne, animated: true, completion: nil)
                
                clearGame()
                
        }
        
        //Middle Row, Horizontal
        if(buttonFour.titleForState(UIControlState.Normal)==play2.stringValue() &&
            buttonFive.titleForState(UIControlState.Normal)==play2.stringValue() &&
            buttonSix.titleForState(UIControlState.Normal)==play2.stringValue()){
                
                Leanplum.track("Player2 won")
                var alertOne = UIAlertController(title: "Winner Is..", message: play2.stringValue(), preferredStyle: UIAlertControllerStyle.Alert)
                alertOne.addAction(UIAlertAction(title: "New Game?", style: UIAlertActionStyle.Default, handler: nil))
                
                self.presentViewController(alertOne, animated: true, completion: nil)
                
                clearGame()
                
        }
        
        //Bottom Row, Horizontal
        if(buttonSeven.titleForState(UIControlState.Normal)==play2.stringValue() &&
            buttonEight.titleForState(UIControlState.Normal)==play2.stringValue() &&
            buttonNine.titleForState(UIControlState.Normal)==play2.stringValue()){
                
                Leanplum.track("Player2 won")
                var alertOne = UIAlertController(title: "Winner Is..", message: play2.stringValue(), preferredStyle: UIAlertControllerStyle.Alert)
                alertOne.addAction(UIAlertAction(title: "New Game?", style: UIAlertActionStyle.Default, handler: nil))
                
                self.presentViewController(alertOne, animated: true, completion: nil)
                
                clearGame()
                
        }
        
        //Left, Vertical
        if(buttonOne.titleForState(UIControlState.Normal)==play2.stringValue() &&
            buttonFour.titleForState(UIControlState.Normal)==play2.stringValue() &&
            buttonSeven.titleForState(UIControlState.Normal)==play2.stringValue()){
                
                Leanplum.track("Player2 won")
                var alertOne = UIAlertController(title: "Winner Is..", message: play2.stringValue(), preferredStyle: UIAlertControllerStyle.Alert)
                alertOne.addAction(UIAlertAction(title: "New Game?", style: UIAlertActionStyle.Default, handler: nil))
                
                self.presentViewController(alertOne, animated: true, completion: nil)
                
                clearGame()
                
        }
        
        //Middle, Vertical
        if(buttonTwo.titleForState(UIControlState.Normal)==play2.stringValue() &&
            buttonFive.titleForState(UIControlState.Normal)==play2.stringValue() &&
            buttonEight.titleForState(UIControlState.Normal)==play2.stringValue()){
                
                Leanplum.track("Player2 won")
                var alertOne = UIAlertController(title: "Winner Is..", message: play2.stringValue(), preferredStyle: UIAlertControllerStyle.Alert)
                alertOne.addAction(UIAlertAction(title: "New Game?", style: UIAlertActionStyle.Default, handler: nil))
                
                self.presentViewController(alertOne, animated: true, completion: nil)
                
                clearGame()
                
        }
        
        
        //Right, Vertical
        if(buttonThree.titleForState(UIControlState.Normal)==play2.stringValue() &&
            buttonSix.titleForState(UIControlState.Normal)==play2.stringValue() &&
            buttonNine.titleForState(UIControlState.Normal)==play2.stringValue()){
                
                Leanplum.track("Player2 won")
                var alertOne = UIAlertController(title: "Winner Is..", message: play2.stringValue(), preferredStyle: UIAlertControllerStyle.Alert)
                alertOne.addAction(UIAlertAction(title: "New Game?", style: UIAlertActionStyle.Default, handler: nil))
                
                self.presentViewController(alertOne, animated: true, completion: nil)
                
                clearGame()
                
        }
        
        
        //Left to Right Diagonal
        if(buttonOne.titleForState(UIControlState.Normal)==play2.stringValue() &&
            buttonFive.titleForState(UIControlState.Normal)==play2.stringValue() &&
            buttonNine.titleForState(UIControlState.Normal)==play2.stringValue()){
                
                Leanplum.track("Player2 won")
                var alertOne = UIAlertController(title: "Winner Is..", message: play2.stringValue(), preferredStyle: UIAlertControllerStyle.Alert)
                alertOne.addAction(UIAlertAction(title: "New Game?", style: UIAlertActionStyle.Default, handler: nil))
                
                self.presentViewController(alertOne, animated: true, completion: nil)
                
                clearGame()
                
        }
        
        
        //Right to Left diagonal
        if(buttonThree.titleForState(UIControlState.Normal)==play2.stringValue() &&
            buttonFive.titleForState(UIControlState.Normal)==play2.stringValue() &&
            buttonSeven.titleForState(UIControlState.Normal)==play2.stringValue()){
                
                Leanplum.track("Player2 won")
                var alertOne = UIAlertController(title: "Winner Is..", message: play2.stringValue(), preferredStyle: UIAlertControllerStyle.Alert)
                alertOne.addAction(UIAlertAction(title: "New Game?", style: UIAlertActionStyle.Default, handler: nil))
                
                self.presentViewController(alertOne, animated: true, completion: nil)
                
                clearGame()
                
        }
        
    }
    
    //New Game Feature
    @IBAction func newGamePressed(sender: UIButton){
        
        clearGame()
        
    }
    
    
}
