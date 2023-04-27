//
//  JobListTableViewController.swift
//  SeekAsiaAssignment
//
//  Created by Chuen Wai Liew on 25/04/2023.
//

import UIKit

class JobListTableViewController: UITableViewController {
    
    var jobList: [JobListModel] = JobListModel.getMockData()

    override func viewDidLoad() {
        super.viewDidLoad()

        tableView = UITableView()
        tableView.separatorStyle = .none
        tableView.register(JobTableViewCell.self, forCellReuseIdentifier: JobTableViewCell.identifier)
        tableView.delegate = self
        tableView.dataSource = self
        
        tableView.reloadData()
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return jobList.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: JobTableViewCell.identifier, for: indexPath) as? JobTableViewCell else {
            return UITableViewCell()
        }
        
        // To make sure the data is not null and cause index out of bounds crash
        guard jobList.count > indexPath.row else {
            return UITableViewCell()
        }
        
        let job = jobList[indexPath.row]
        cell.setupLabelValue(title: job.title, companyName: job.companyName, description: job.description)
        
        return cell
    }
}
