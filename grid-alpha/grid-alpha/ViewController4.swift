//
//  ViewController4.swift
//  grid-alpha
//
//  Created by Jacob Barth on 11/16/18.
//  Copyright © 2018 Jacob Barth. All rights reserved.
//

import UIKit
import Foundation

class ViewController4: UIViewController {
    //grid that gets randomized with values in num_array
    var grid = [String]()
    let num_array = ["1","2","3","4","5","6","7","8","9"]
    
    // Random rand = new Random();
    var rand_int = 0;
    var used_num = [Int]()
    
    //Generates random numbers, 9 is hard-coded for now
    /*func generator() -> Int {
     let rand_int = Int(arc4random_uniform(10))
     return rand_int;
     }*/
    //Sets the array with the index of rand_int with a int from num_array
    func setGrid() {
        var j = 0
        for _ in num_array {
            rand_int = Int(arc4random_uniform(9))
            var random_bool = true;
            while(random_bool) {
                if (used_num.contains(rand_int)) {
                    rand_int = Int(arc4random_uniform(9))
                    random_bool = true;
                } else {
                    used_num.append(rand_int);
                    let num = num_array[rand_int]
                    grid.append(num);
                    random_bool = false;
                    j+=1
                }
            }
        }
    }
    
    //Method finds the index of selected number then swaps the value there to other index
    //Might make playing in console different than intended
    func change(in0: String, in1: String) {
        //ArrayList is used to find the index, could be changed later with creativity
        let temp = in0
        var index1 = 0;
        var index2 = 0;
        var i = 0
        for _ in grid {
            if (in0 == grid[i]) {
                index1 = i
            } else if (in1 == grid[i]) {
                index2 = i
            }
            i+=1
        }
        grid.remove(at: index2)
        grid.insert(temp, at: index2)
        grid.remove(at: index1)
        grid.insert(in1, at: index1)
        
    }
    //checks to see if the array given is in the same order of num_array
    func check() -> Int {
        var count = 0
        var i = 0
        for _ in grid {
            
            if (grid[i] != num_array[i]) {
                return 0
            }
            else {
                count += 1
                if (count == 8) {
                    return 1
                }
            }
            i+=1
        }
        return 0;
    }
    
    func hideLabel() {
        Label0.isHidden = true
        Label1.isHidden = true
        Label2.isHidden = true
        Label3.isHidden = true
        Label4.isHidden = true
        Label5.isHidden = true
        Label6.isHidden = true
        Label7.isHidden = true
        Label8.isHidden = true
        
        Label0.text = ""
        Label1.text = ""
        Label2.text = ""
        Label3.text = ""
        Label4.text = ""
        Label5.text = ""
        Label6.text = ""
        Label7.text = ""
        Label8.text = ""
        
        butn0.isHidden = false
        butn1.isHidden = false
        butn2.isHidden = false
        butn3.isHidden = false
        butn4.isHidden = false
        butn5.isHidden = false
        butn6.isHidden = false
        butn7.isHidden = false
        butn8.isHidden = false
        
    }
    
    func title() {
        butn0.setTitle(grid[0], for: [])
        butn1.setTitle(grid[1], for: [])
        butn2.setTitle(grid[2], for: [])
        butn3.setTitle(grid[3], for: [])
        butn4.setTitle(grid[4], for: [])
        butn5.setTitle(grid[5], for: [])
        butn6.setTitle(grid[6], for: [])
        butn7.setTitle(grid[7], for: [])
        butn8.setTitle(grid[8], for: [])
       
        Label0.backgroundColor = normal_color
        Label2.backgroundColor = normal_color
        Label3.backgroundColor = normal_color
        Label4.backgroundColor = normal_color
        Label5.backgroundColor = normal_color
        Label6.backgroundColor = normal_color
        Label7.backgroundColor = normal_color
        Label8.backgroundColor = normal_color
        hideLabel()
        label_score_final.text = "Moves"
        Level_label.text = "Levels Completed"
        score.text = String(count/2)
        Level_num.text = String(level)
    }
    func printButn(label: String) {
        if (count%2 == 0) {
            current = label
        } else {
            current1 = label
            if (current == current1) {
                hideLabel()
            }
            else {
                change(in0: current, in1: current1)
            }
        }
        
        count+=1
        title()
        
        if (check() == 1) {
            level += 1
            reset()
        }
        
        
    }
    
    func reset() {
        grid.removeAll()
        used_num.removeAll()
        count = 0
//        hideLabel()
        setGrid()
        title()
    }
    func clear() {
        grid.removeAll()
        used_num.removeAll()
        setGrid()
        //        title()
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        //Loads initial view
        setGrid()
        title()
    }
    
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */
    
    
    //Game buttons
    @IBOutlet weak var butn0: UIButton!
    @IBOutlet weak var butn1: UIButton!
    @IBOutlet weak var butn2: UIButton!
    @IBOutlet weak var butn3: UIButton!
    @IBOutlet weak var butn4: UIButton!
    @IBOutlet weak var butn5: UIButton!
    @IBOutlet weak var butn6: UIButton!
    @IBOutlet weak var butn7: UIButton!
    @IBOutlet weak var butn8: UIButton!
   
    //Highlights selected then clears after move
    @IBOutlet weak var Label0: UILabel!
    @IBOutlet weak var Label1: UILabel!
    @IBOutlet weak var Label2: UILabel!
    @IBOutlet weak var Label3: UILabel!
    @IBOutlet weak var Label4: UILabel!
    @IBOutlet weak var Label5: UILabel!
    @IBOutlet weak var Label6: UILabel!
    @IBOutlet weak var Label7: UILabel!
    @IBOutlet weak var Label8: UILabel!
    //Score and final labels
    @IBOutlet weak var Level_label: UILabel!
    @IBOutlet weak var Level_num: UILabel!
    @IBOutlet weak var label_score_final: UILabel!
    @IBOutlet weak var score: UILabel!
    
    
    
    // var transition: UIViewControllerTransitioningDelegate?
    
    
    //Game view----------------------------
    //vars to store control from board
    var current = ""
    var current1 = ""
    var count = 0
    var level = 0
    let end_color = UIColor(red: 0.957, green: 0.928, blue: 0.845, alpha: 1.00)
    let normal_color = UIColor(red: 170.00/255.00, green: 170.00/255.00, blue: 170.00/255.00, alpha: 0.45)
    
    //Button functions to recieve taps, repalce with a table view for multiple squares later?
    @IBAction func butn_touch0(_ sender: Any) {
        printButn(label: (butn0.titleLabel?.text)!)
        if (count%2 == 1) {
            Label0.isHidden = false
        } else {
            hideLabel()
        }
    }
    @IBAction func butn_touch1(_ sender: Any) {
        printButn(label: (butn1.titleLabel?.text)!)
        if (count%2 == 1) {
            Label1.isHidden = false
        } else {
            hideLabel()
        }
    }
    @IBAction func butn_touch2(_ sender: Any) {
        printButn(label: (butn2.titleLabel?.text)!)
        if (count%2 == 1) {
            Label2.isHidden = false
        } else {
            hideLabel()
        }
    }
    @IBAction func butn_touch3(_ sender: Any) {
        printButn(label: (butn3.titleLabel?.text)!)
        if (count%2 == 1) {
            Label3.isHidden = false
        } else {
            hideLabel()
        }
    }
    @IBAction func butn_touch4(_ sender: Any) {
        printButn(label: (butn4.titleLabel?.text)!)
        if (count%2 == 1) {
            Label4.isHidden = false
        } else {
            hideLabel()
        }
    }
    @IBAction func butn_touch5(_ sender: Any) {
        printButn(label: (butn5.titleLabel?.text)!)
        if (count%2 == 1) {
            Label5.isHidden = false
        } else {
            hideLabel()
        }
    }
    @IBAction func butn_touch6(_ sender: Any) {
        printButn(label: (butn6.titleLabel?.text)!)
        if (count%2 == 1) {
            Label6.isHidden = false
        } else {
            hideLabel()
        }
    }
    @IBAction func butn_touch7(_ sender: Any) {
        printButn(label: (butn7.titleLabel?.text)!)
        if (count%2 == 1) {
            Label7.isHidden = false
        } else {
            hideLabel()
        }
    }
    @IBAction func butn_touch8(_ sender: Any) {
        printButn(label: (butn8.titleLabel?.text)!)
        if (count%2 == 1) {
            Label8.isHidden = false
        } else {
            hideLabel()
        }
    }
    
    
   
}

