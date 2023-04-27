//
//  JobTableViewCell.swift
//  SeekAsiaAssignment
//
//  Created by Chuen Wai Liew on 25/04/2023.
//

import UIKit
import SnapKit

class JobTableViewCell: UITableViewCell {
    static let identifier = "JobTableViewCell"
    
    private let containerView = UIView()
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.preferredFont(forTextStyle: .title2)
        label.numberOfLines = 1
        
        return label
    }()
    
    private let companyNameLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.preferredFont(forTextStyle: .subheadline)
        label.numberOfLines = 1
        
        return label
    }()
    
    private let descriptionLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 15)
        label.numberOfLines = 0
        
        return label
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupView()
        setupLayout()
    }
    
    private func setupView() {
        contentView.backgroundColor = UIColor.lightGray
        contentView.addSubview(containerView)
        
        containerView.backgroundColor = UIColor.CardBackground
        containerView.addSubview(titleLabel)
        containerView.addSubview(companyNameLabel)
        containerView.addSubview(descriptionLabel)
    }
    
    private func setupLayout() {
        containerView.snp.makeConstraints {
            $0.top.left.right.equalToSuperview().inset(12)
            $0.bottom.equalToSuperview().offset(-4)
        }
        containerView.layer.cornerRadius = 4
        containerView.layer.masksToBounds = true
        
        titleLabel.snp.makeConstraints {
            $0.top.left.right.equalToSuperview().inset(12)
        }
        
        companyNameLabel.snp.makeConstraints {
            $0.top.equalTo(titleLabel.snp.bottom).offset(10)
            $0.left.right.equalToSuperview().inset(12)
        }
        
        descriptionLabel.snp.makeConstraints {
            $0.top.equalTo(companyNameLabel.snp.bottom).offset(18)
            $0.left.right.bottom.equalToSuperview().inset(12)
        }
    }
    
    func setupLabelValue(title: String, companyName: String, description: String) {
        titleLabel.text = title
        companyNameLabel.text = companyName
        descriptionLabel.text = description
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
