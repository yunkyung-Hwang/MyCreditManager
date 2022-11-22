//
//  StudentModel.swift
//  MyCreditManager
//
//  Created by 황윤경 on 2022/11/22.
//

import Foundation

struct StudentModel {
    var name: String
    var subjects: [String: SubjectModel]
    
    init(name: String) {
        self.name = name
        self.subjects = [:]
    }
}
