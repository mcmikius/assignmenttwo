//
//  ViewController.swift
//  AssignmentTwo
//
//  Created by Michail Bondarenko on 4/10/19.
//  Copyright © 2019 Michail Bondarenko. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let basePrice = 24.0
    let discount = 0.06
    let startYear = 1826
    let finishYear = 2019

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        stateOfAccount(basePrice: basePrice, discount: discount, startYear: startYear, finishYear: finishYear)
        
        sumOfMoney()
        monthsOfStudy()
        inverceNumber()
    }
    
    
    //Задача 1. Остров Манхэттен был приобретен поселенцами за $24 в 1826 г. Каково было бы в настоящее время состояние их счета, если бы эти 24 доллара были помещены тогда в банк под 6% годового дохода?
    
    func stateOfAccount(basePrice: Double, discount: Double, startYear: Int, finishYear: Int) -> (Double, Int) {
        var basePrice = basePrice
        var i = 0
        for _ in startYear...finishYear {
            basePrice = basePrice + basePrice * discount
            i += 1
        }
        print("Current account - \(Int(basePrice)) USD from \(i) years")
        return (basePrice, i)
    }
    
    //Задача 2. Ежемесячная стипендия студента составляет 700 гривен, а расходы на проживание превышают ее и составляют 1000 грн. в месяц. Рост цен ежемесячно увеличивает расходы на 3%. Определить, какую нужно иметь сумму денег, чтобы прожить учебный год (10 месяцев), используя только эти деньги и стипендию.
    let grant = 700.0
    var livingExpenses = 1000.0
    let costIncrease = 0.03
    func sumOfMoney() {
        var sum = livingExpenses
        for _ in 2...10 {
            livingExpenses = livingExpenses + (livingExpenses * costIncrease)
            sum += livingExpenses
        }
        print("Total costs \(sum)")
        print("The student must have \(sum - (grant * 10)) UAH")
    }
    
    //Задача 3. У студента имеются накопления 2400 грн. Ежемесячная стипендия составляет 700 гривен, а расходы на проживание превышают ее и составляют 1000 грн. в месяц. Рост цен ежемесячно увеличивает расходы на 3%. Определить, сколько месяцев сможет прожить студент, используя только накопления и стипендию.
    var collectedMoney = 2400.00
    let scholarship = 700.0
    var monthlyIncome = 0.0
    var livingCost = 1000.0
    var totalCost = 0.0
    let increase = 0.03
    var months = 0
    func monthsOfStudy() {
        while livingCost <= collectedMoney && monthlyIncome - totalCost >= 0 {
            months += 1
            if months == 1 {
                totalCost = livingCost
                monthlyIncome = collectedMoney + scholarship
            } else {
                monthlyIncome += scholarship
                livingCost = livingCost + (livingCost * increase)
                totalCost += livingCost
            }
            if monthlyIncome <= totalCost {
                months -= 1
            }
        }
        print("Student can live \(months) months")
    }
    
    //Задача 4. 2хзначную цело численную переменную типа 25, 41, 12. После выполнения вашей программы у вас в другой переменной должно лежать это же число только задом на перед 52, 14, 21
    //Пример: 1024 - 4201
    var number = Int(arc4random_uniform(1000))
    func inverceNumber() {
        print("Base number is \(number)")
        var inversNumber = 0
        while number > 0 {
            inversNumber = inversNumber * 10 + number % 10
            number = number / 10
        }
        print("Inverse number is \(inversNumber)")
    }

}

