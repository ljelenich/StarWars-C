//
//  FilmViewController.swift
//  StarWars-C
//
//  Created by LAURA JELENICH on 10/1/20.
//

import UIKit

class FilmViewController: UIViewController {
    
    //MARK: - Outlets
    @IBOutlet weak var backgroundImage: UIImageView!
    @IBOutlet weak var searchNumberTextField: UITextField!
    @IBOutlet weak var submitButton: UIButton!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var producerLabel: UILabel!
    @IBOutlet weak var openingCrawlLabel: UILabel!
    
    //MARK: - Properties
    var film: LAJFilm?
    
    //MARK: - Lifecycle Functions
    override func viewDidLoad() {
        super.viewDidLoad()
        customViews()
    }
    
    //MARK: - Actions
    @IBAction func submitButtonPressed(_ sender: Any) {
        fetchFilm()
    }
    
    //MARK: - Helper Functions
    func customViews() {
        submitButton.layer.cornerRadius = 5
        submitButton.layer.borderWidth = 2
        submitButton.layer.borderColor = UIColor.white.cgColor
    }
    
    func updateViews() {
        guard let film = film else { return }
        self.titleLabel.text = film.title
        self.producerLabel.text = "Produced by: \(film.producer)"
        self.openingCrawlLabel.text = film.openingCrawl
        print(film.title, film.producer, film.openingCrawl)
    }
    
    func fetchFilm() {
        guard let id = searchNumberTextField.text else { return }
        LAJFilmController.fetchFilm(forSearchTerm: id) { (film) in
            DispatchQueue.main.async {
                self.film = film
                self.updateViews()
            }
        }
    }
}
