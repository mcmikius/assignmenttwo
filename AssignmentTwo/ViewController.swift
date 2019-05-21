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
    let basePrice = 24.0
    let discount = 0.06
    let startYear = 1826
    let finishYear = 2019
    
    let collectedMoney = 2400.00
    let grant = 700.0
    let livingExpenses = 1000.0
    let costIncrease = 0.03
    
    let number = Int(arc4random_uniform(1000))

    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        let comprasion = numberComparison(numberOne: numberOne, numberTwo: numberTwo)
        print(comprasion)
        
        let square = squareOfNumber(number: numberOne)
        print("Square of number \(numberOne) is \(square)")
        let cube = cubeOfNumber(number: numberOne)
        print("Square of number \(numberOne) is \(cube)")
        
        orderOfNumbers(number: numberOne)
        
        let dividers = numberDividers(number: numberOne)
        print("the number \(dividers.divNumber) has \(dividers.countDiv) dividers")
        
        let perfect = perfectNumber(number: numberOne)
        print("Is the number \(numberOne) perfect? It is \(perfect)")
        
        let currentStateOfAccount = stateOfAccount(basePrice: basePrice, discount: discount, startYear: startYear, finishYear: finishYear)
        print("Current account - \(currentStateOfAccount.currentStateOfAccount) USD from \(currentStateOfAccount.depositYears) years")
        
        let shouldBeMoney = sumOfMoney(grant: grant, livingExpenses: livingExpenses, costIncrease: costIncrease)
        print("The student must have \(shouldBeMoney) UAH")
        
        let months = monthsOfStudy(collectedMoney: collectedMoney, grant: grant, livingExpenses: livingExpenses, costIncrease: costIncrease)
        print("Student can live \(months) months")
        
        let newNumber = inverceNumber(number: number)
        print("Base number is \(number)")
        print("Inverse number is \(newNumber)")

    }
    
    //Задача 0. Вывести на экран наибольшее из двух чисел
    
    func numberComparison(numberOne: Int, numberTwo: Int) -> String{
        var result = ""
        if numberOne > numberTwo {
            result = "Number one is greater than number two. Number one is \(numberOne)"
        } else if numberOne < numberTwo {
            result = "Number two is greater than number one Number two is \(numberTwo)"
        } else {
            result = "Numbers is equale. Numbers are \(numberTwo)"
        }
        return result
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
    
    func orderOfNumbers(number: Int) -> Void {
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
        return
    }
    
    //Задача 3. Подсчитать общее количество делителей числа и вывести их
    
    func numberDividers(number: Int) -> (countDiv: Int, divNumber: Int) {
        var countDiv = 1
        let divNumber = number
        for i in 1...(divNumber) {
            if divNumber % i == 0 {
                print("\(i) is a divisor of the number \(divNumber)")
                countDiv += 1
            }
        }
        countDiv -= 1
        return (countDiv, divNumber)
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
    
    //Задача 1. Остров Манхэттен был приобретен поселенцами за $24 в 1826 г. Каково было бы в настоящее время состояние их счета, если бы эти 24 доллара были помещены тогда в банк под 6% годового дохода?
    
    func stateOfAccount(basePrice: Double, discount: Double, startYear: Int, finishYear: Int) -> (currentStateOfAccount: Double, depositYears: Int) {
        var basePrice = basePrice
        var years = 0
        for _ in startYear...finishYear {
            basePrice = basePrice + basePrice * discount
            years += 1
        }
        return (basePrice, years)
    }
    
    //Задача 2. Ежемесячная стипендия студента составляет 700 гривен, а расходы на проживание превышают ее и составляют 1000 грн. в месяц. Рост цен ежемесячно увеличивает расходы на 3%. Определить, какую нужно иметь сумму денег, чтобы прожить учебный год (10 месяцев), используя только эти деньги и стипендию.
    
    func sumOfMoney(grant: Double, livingExpenses: Double, costIncrease: Double) -> Double {
        var livingExpenses = livingExpenses
        var sum = livingExpenses
        for _ in 2...10 {
            livingExpenses = livingExpenses + (livingExpenses * costIncrease)
            sum += livingExpenses
        }
        let moneys = sum - (grant * 10)
        return moneys
    }
    
    //Задача 3. У студента имеются накопления 2400 грн. Ежемесячная стипендия составляет 700 гривен, а расходы на проживание превышают ее и составляют 1000 грн. в месяц. Рост цен ежемесячно увеличивает расходы на 3%. Определить, сколько месяцев сможет прожить студент, используя только накопления и стипендию.
    
    
    func monthsOfStudy(collectedMoney: Double, grant: Double, livingExpenses: Double, costIncrease: Double) -> Int {
        var monthlyIncome = 0.0
        var totalCost = 0.0
        var months = 0
        var livingExpenses = livingExpenses
        while livingExpenses <= collectedMoney && monthlyIncome - totalCost >= 0 {
            months += 1
            if months == 1 {
                totalCost = livingExpenses
                monthlyIncome = collectedMoney + grant
            } else {
                monthlyIncome += grant
                livingExpenses = livingExpenses + (livingExpenses * costIncrease)
                totalCost += livingExpenses
            }
            if monthlyIncome <= totalCost {
                months -= 1
            }
        }
        return months
    }
    
    //Задача 4. 2хзначную цело численную переменную типа 25, 41, 12. После выполнения вашей программы у вас в другой переменной должно лежать это же число только задом на перед 52, 14, 21
    //Пример: 1024 - 4201
    
    func inverceNumber(number: Int) -> Int {
        var number = number
        var inversNumber = 0
        while number > 0 {
            inversNumber = inversNumber * 10 + number % 10
            number = number / 10
        }
        return inversNumber
    }

}

