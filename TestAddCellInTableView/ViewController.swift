//
//  ViewController.swift
//  TestAddCellInTableView
//
//  Created by bomi.chen on 2020/7/1.
//  Copyright © 2020 bomi.chen. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    
    @IBAction func addCell1ButtonDidTouchUpInside() {
        self.tableView.beginUpdates()
        self.tableView.insertRows(at: [IndexPath(row: self.cell1arr.count, section: 0)], with: .fade)
        cell1arr.append(CellConfig(color: .black, cellHeight: 40))
        self.tableView.endUpdates()
    }
    
    @IBAction func addCell2ButtonDidTouchUpInside() {
        self.tableView.beginUpdates()
        self.tableView.insertRows(at: [IndexPath(row: self.cell2arr.count, section: 1)], with: .fade)
        cell2arr.append(CellConfig(color: .lightGray, cellHeight: 40))
        self.tableView.endUpdates()
    }
    
    @IBAction func dissmissCell1ButtonDidTouchUpInside() {
        self.tableView.beginUpdates()
        if cell1arr.count > 1 {
            self.tableView.deleteRows(at: [IndexPath(row: self.cell1arr.count - 1, section: 0)], with: .fade)
            cell1arr.removeLast()
        }
        self.tableView.endUpdates()
    }
    
    @IBAction func dissmissCell2ButtonDidTouchUpInside() {
        self.tableView.beginUpdates()
        if cell2arr.count > 1 {
            self.tableView.deleteRows(at: [IndexPath(row: self.cell2arr.count - 1, section: 1)], with: .fade)
            cell2arr.removeLast()
        }
        self.tableView.endUpdates()
    }
    
    var cell1arr: [CellConfig] = [CellConfig(color: .green, cellHeight: 30),
                                  CellConfig(color: .green, cellHeight: 60),
                                  CellConfig(color: .green, cellHeight: 90),]
    var cell2arr: [CellConfig] = [CellConfig(color: .blue, cellHeight: 30)]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.register(UINib(nibName: "ExpandableTableViewCell", bundle: nil), forCellReuseIdentifier: "ExpandableTableViewCell")
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return section == 0 ? self.cell1arr.count : self.cell2arr.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "ExpandableTableViewCell", for: indexPath) as? ExpandableTableViewCell else { return UITableViewCell() }
        
        cell.squareView.backgroundColor = indexPath.section != 0 ? self.cell2arr[indexPath.row].color : self.cell1arr[indexPath.row].color
        cell.addButton.isHidden = indexPath.row != 0 ? true : false
        
        return cell
    }
}

