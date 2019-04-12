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
    
    let collectedMoney = 2400.00
    let grant = 700.0
    let livingExpenses = 1000.0
    let costIncrease = 0.03
    
    let number = Int(arc4random_uniform(1000))

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        let currentStateOfAccount = stateOfAccount(basePrice: basePrice, discount: discount, startYear: startYear, finishYear: finishYear)
        print("Current account - \(currentStateOfAccount.currentStateOfAccount) USD from \(currentStateOfAccount.depositYears) years")
        
        let shouldBeMoney = sumOfMoney(grant: grant, livingExpenses: livingExpenses, costIncrease: costIncrease)
        print("The student must have \(shouldBeMoney) UAH")
        
        monthsOfStudy(collectedMoney: collectedMoney, grant: grant, livingExpenses: livingExpenses, costIncrease: costIncrease)
        
        inverceNumber(number: number)
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
    
    
    func monthsOfStudy(collectedMoney: Double, grant: Double, livingExpenses: Double, costIncrease: Double) {
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
        print("Student can live \(months) months")
    }
    
    //Задача 4. 2хзначную цело численную переменную типа 25, 41, 12. После выполнения вашей программы у вас в другой переменной должно лежать это же число только задом на перед 52, 14, 21
    //Пример: 1024 - 4201
    func inverceNumber(number: Int) -> Int {
        var number = number
        print("Base number is \(number)")
        var inversNumber = 0
        while number > 0 {
            inversNumber = inversNumber * 10 + number % 10
            number = number / 10
        }
        print("Inverse number is \(inversNumber)")
        return inversNumber
    }

}

