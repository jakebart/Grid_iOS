//
//  control.swift
//  grid-alpha
//
//  Created by Jacob Barth on 10/31/18.
//  Copyright © 2018 Jacob Barth. All rights reserved.
//

import Foundation
import UIKit
//This class will be used for user and library will hold most of the methods w/ graphics


public class control {
    
    
    //grid that gets randomized with values in num_array
    var grid = [Int]()
    let num_array = [1,2,3,4,5,6,7,8,9]
    
   // Random rand = new Random();
    var rand_int = 0;
    var used_num = [Int]()
    
    //Generates random numbers, 9 is hard-coded for now
    func generator() -> Int {
        let rand_int = Int(arc4random_uniform(10))
        return rand_int;
    }
    //Sets the array with the index of rand_int with a int from num_array
    func setGrid() {
    var rand_int = 0
    for _ in num_array {
        rand_int = Int(arc4random_uniform(10))
        var random_bool = 1;
        while(random_bool != 0) {
            if (used_num.contains(rand_int)) {
                rand_int = Int(arc4random_uniform(10))
                random_bool = 0;
            } else {
                used_num.append(rand_int);
                grid.append(num_array[rand_int]);
                random_bool = 1;
                }
            }
        }
    }
    
    //Again for playing in this class in the console
    func setup() {
        self.setGrid();
        //printGrid();
    }
    //Method finds the index of selected number then swaps the value there to other index
    //Might make playing in console different than intended
    func change(in0: Int, in1: Int) {
    //ArrayList is used to find the index, could be changed later with creativity
        let temp = in0
        var index1 = 0;
        var index2 = 0;
        
        for spot in grid {
            if (in0 == grid[spot]) {
                index1 = grid[spot]
            } else if (in1 == grid[spot]) {
                index2 = grid[spot]
            }
        }
        grid.remove(at: index2)
        grid.insert(temp, at: index2)
        grid.remove(at: index1)
        grid.insert(in1, at: index1)

    }
    //checks to see if the array given is in the same order of num_array
    func check() -> Int {
            var count = 0
            for spot in grid {
                if (grid[spot] != num_array[spot]) {
                    return 0
                }
                else {
                    count += 1
                    if (count == 8) {
                        return 1
                    }
                }
            
            }
            return 0;
        }
}

