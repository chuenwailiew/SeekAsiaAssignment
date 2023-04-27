//
//  JobListModel.swift
//  SeekAsiaAssignment
//
//  Created by Chuen Wai Liew on 25/04/2023.
//

import Foundation

struct JobListModel {
    var title: String
    var companyName: String
    var description: String
    var hasApplied: Bool
}

extension JobListModel {
    static func getMockData() -> [JobListModel] {
        var jobList: [JobListModel] = []
        
        for num in 0..<20 {
            let index = num+1
            let job = JobListModel(title: "Job title \(index)", companyName: "Company name \(index)", description: "This is a very brief description of the role's day-to-day responsibilities for job \(index).", hasApplied: (index % 10 == 0))
            jobList.append(job)
        }
        
        return jobList
    }
}
