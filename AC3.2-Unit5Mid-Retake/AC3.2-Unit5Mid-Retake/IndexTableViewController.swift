//
//  IndexTableViewController.swift
//  AC3.2-Unit5-MidUnitAssesment
//
//  Created by Louis Tur on 12/22/16.
//  Copyright © 2016 C4Q. All rights reserved.
//

import UIKit

/*
 ******************************************************************
  
    ATTENTION AC3.2 STUDENTS
 
      DO NOT MODIFY THIS FILE! 😤
 
 ******************************************************************
 */

enum TestSections: String {
  case autoLayout = "AutoLayout"
  case coreData = "Core Data"
  
  static let sections: [String] = [TestSections.autoLayout,
                                   TestSections.coreData].map { $0.rawValue }
  
  static func numberOfTestSections() -> Int {
    return TestSections.sections.count
  }
}

class IndexTableViewController: UITableViewController {
  
  // Assesment View Controllers
  private let autoLayoutViewControllers: [CellTitled] = [DesignOneViewController(), DesignTwoViewController()]
  private let coreDataViewControllers: [CellTitled] = [ BooksTableViewController() ]
  
  let cellIdentifier: String = "IndexCellIdentifier"
  
  
  override func viewDidLoad() {
    super.viewDidLoad()
    self.tableView.register(UITableViewCell.self, forCellReuseIdentifier: cellIdentifier)
    self.title = "AC3.2 Mid Unit 5"
  }
  
  
  // MARK: - Table view data source
  override func numberOfSections(in tableView: UITableView) -> Int {
    return TestSections.numberOfTestSections()
  }
  
  override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    switch section {
    case 0:
      return autoLayoutViewControllers.count
    default:
      return coreDataViewControllers.count
    }
  }
  
  override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath)

    switch (indexPath.section, indexPath.row) {
    case (0, let row):
      cell.textLabel?.text = autoLayoutViewControllers[row].titleForCell
    case (1, 0):
      cell.textLabel?.text = coreDataViewControllers[0].titleForCell
    default:
      print("Add row")
    }
    
    return cell
  }
  
  override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
    return TestSections.sections[section]
  }
  
  override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    switch (indexPath.section, indexPath.row) {
    case (0, let row):
      let dtvc = autoLayoutViewControllers[row] as! UIViewController
      navigationController?.pushViewController(dtvc, animated: true)
    case (1, 0):
        let rtvc = BooksTableViewController()
        navigationController?.pushViewController(rtvc, animated: true)
    default:
      print("Add row")
    }
  }
}
