//
//  ResultsViewController.swift
//  PersonalQuiz
//
//  Created by Alexey Efimov on 26.10.2020.
//

import UIKit

class ResultsViewController: UIViewController {
    
    @IBOutlet weak var yourAnimalLabel: UILabel!
    @IBOutlet weak var yourDescription: UILabel!
    
    var typeOfAnswers: [Answer]!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.hidesBackButton = true
        getYourResult()
    }

    private func showResult(with animal: AnimalType) {
        yourAnimalLabel.text = "Поздравляю! Ты - \(animal.rawValue)!"
        yourDescription.text = "\(animal.definition)"
    }
    
    private func getYourResult() {
        var typeAndCount: [AnimalType: Int] = [:]
        let typesOfAnimal = typeOfAnswers.map {
            $0.type
            
        }
        
        for animal in typesOfAnimal {
            typeAndCount[animal] = (typeAndCount[animal] ?? 0) + 1
        }
        
        let sortedTypes = typeAndCount.sorted {
            $0.value > $1.value
            
        }
        guard
            let preferAnimalIs = sortedTypes.first?.key else {
            
            return
            
        }
        
        showResult(with: preferAnimalIs)
    }
}

