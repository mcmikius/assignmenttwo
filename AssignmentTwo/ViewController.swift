//
//  ViewController.swift
//  AssignmentTwo
//
//  Created by Michail Bondarenko on 4/10/19.
//  Copyright © 2019 Michail Bondarenko. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let numberOne = Int(arc4random_uniform(100))
    let numberTwo = Int(arc4random_uniform(100))

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        let comprasion = numberComparison(numberOne: numberOne, numberTwo: numberTwo)
        
        
        let square = squareOfNumber(number: numberOne)
        print("Square of number \(numberOne) is \(square)")
        let cube = cubeOfNumber(number: numberOne)
        print("Square of number \(numberOne) is \(cube)")
        
        orderOfNumbers(number: numberOne)
        numberDividers(number: numberOne)
        perfectNumber(number: numberOne)
    }
    
    //Задача 0. Вывести на экран наибольшее из двух чисел
    
    func numberComparison(numberOne: Int, numberTwo: Int) {
        if numberOne > numberTwo {
            print("Number one is greater than number two. Number one is \(numberOne)")
        } else if numberOne < numberTwo {
            print("Number two is greater than number one Number two is \(numberTwo)")
        } else {
            print("Numbers is equale. Numbers are \(numberTwo)")
        }
    }
    
    //Задача 1. Вывести на экран квадрат и куб числа
    func squareOfNumber(number: Int) -> Int {
        let result = number * number
        return result
    }
    
    func cubeOfNumber(number: Int) -> Int {
        let result = number * number * number
        return result
    }
    //Задача 2. Вывести на экран все числа до заданного и в обратном порядке до 0
    
    func orderOfNumbers(number: Int) {
        var enterNumber = number
        for i in 0...enterNumber {
            print(i)
        }
        while enterNumber > 0 {
            print("\(enterNumber)")
            enterNumber -= 1
        }
        if enterNumber == 0 {
            print("\(enterNumber)")
        }
    }
    
    //Задача 3. Подсчитать общее количество делителей числа и вывести их
    
    func numberDividers(number: Int) {
        var countDiv = 1
        let divNumber = number
        for i in 1...(divNumber) {
            if divNumber % i == 0 {
                print("\(i) is a divisor of the number \(divNumber)")
                countDiv += 1
            }
        }
        print("the number \(divNumber) has \(countDiv - 1) dividers")
    }
    
    //Задача 4. Проверить, является ли заданное число совершенным и найти их (делители)
    //1-е совершенное число — 6 имеет следующие собственные делители: 1, 2, 3; их сумма равна 6.
    //
    //2-е совершенное число — 28 имеет следующие собственные делители: 1, 2, 4, 7, 14; их сумма равна 28.
    //
    //3-е совершенное число — 496 имеет следующие собственные делители: 1, 2, 4, 8, 16, 31, 62, 124, 248; их сумма равна 496.
    //
    //4-е совершенное число — 8128 имеет следующие собственные делители: 1, 2, 4, 8, 16, 32, 64, 127, 254, 508, 1016, 2032, 4064; их сумма равна 8128.
    func perfectNumber(number: Int) -> Bool {
        var sum = 0
        for i in 1..<number {
            if number % i == 0 {
                sum += i
            }
        }
        if sum == number {
            print("Number \(number) is perfect")
        } else {
            print("Number \(number) is not perfect")
        }
        return sum == number
    }
    
}
