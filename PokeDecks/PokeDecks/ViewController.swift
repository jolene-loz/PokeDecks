//
//  ViewController.swift
//  PokeDecks
//
//  Created by J. Lozano on 11/6/18.
//  Copyright © 2018 J. Lozano. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    var pokemon = Pokemon()
    var pokeArray = ["Bulbasur",
                    "Pikachu",
                    "Charmander",
                    "JigglyPuff",
                    "Snorlax"]
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
        pokemon.getPokemon(){
            self.tableView.reloadData()
        }
    }
}

extension ViewController: UITableViewDataSource, UITableViewDelegate{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return pokemon.pokeArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        cell.textLabel?.text = pokemon.pokeArray[indexPath.row].name
        return cell
        
    }
    

    
}

