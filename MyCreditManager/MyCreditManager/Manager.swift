//
//  Manager.swift
//  MyCreditManager
//
//  Created by 황윤경 on 2022/11/22.
//

import Foundation

class Manager {
    let listMessage = "원하는 기능을 입력해주세요\n1: 학생추가, 2: 학생삭제, 3: 성적추가(변경), 4: 성적삭제, 5: 평점보기, X: 종료"
    let errorMessage = "뭔가 입력이 잘못되었습니다. 1~5 사이의 숫자 혹은 X를 입력해주세요."
    let exitMessage = "프로그램을 종료합니다..."
    
    private var studentList: [String: StudentModel] = [:]
    
    /// 학생 추가 메서드
    func addStudent() {
        guard let studentName = inputProcessing(.addStudent) else { return }
        
        if !studentList.contains(where: { $0.key == studentName }) {
            studentList[studentName] = StudentModel(name: studentName)
            print("\(studentName) 학생을 추가했습니다.")
        } else {
            print("\(studentName)은 이미 존재하는 학생입니다. 추가하지 않습니다.")
        }
    }
    
    /// 학생 삭제 메서드
    func deleteStudent() {
        guard let studentName = inputProcessing(.deleteStudent) else { return }
        
        if isExist(student: studentName) {
            studentList.removeValue(forKey: studentName)
            print("\(studentName) 학생을 삭제하였습니다.")
        }
    }
    
    /// 성적 추가(변경) 메서드
    func addScore() {
        guard let subjectString = inputProcessing(.addScore) else { return }
        
        let subjectInfo = subjectString.split(separator: " ").map { String($0) }
        if subjectInfo.count != 3 || GradeType(rawValue: subjectInfo[2]) == nil {
            print(InputType.addScore.errorMessage)
            return
        }
        
        if isExist(student: subjectInfo[0]) {
            studentList[subjectInfo[0]]!.subjects[subjectInfo[1]] = SubjectModel(subject: subjectInfo[1],
                                                                                 grade: subjectInfo[2])
            print("\(subjectInfo[0]) 학생의 \(subjectInfo[1]) 과목이 \(subjectInfo[2])로 추가(변경)되었습니다.")
        }
    }
    
    /// 성적 삭제 메서드
    func deleteScore() {
        guard let subjectString = inputProcessing(.deleteScore) else { return }
        
        let subjectInfo = subjectString.split(separator: " ").map { String($0) }
        if subjectInfo.count != 2 {
            print(InputType.deleteScore.errorMessage)
            return
        }
        
        if isExist(student: subjectInfo[0]) {
            let result = studentList[subjectInfo[0]]!.subjects.removeValue(forKey: subjectInfo[1]) == nil
            print(result
                  ? "\(subjectInfo[1]) 과목을 찾지 못했습니다."
                  : "\(subjectInfo[0]) 학생의 \(subjectInfo[1]) 과목의 성적이 삭제되었습니다.")
        }
    }
    
    /// 평점 보기 메서드
    func printAverage() {
        guard let studentName = inputProcessing(.printAverage) else { return }
        
        if isExist(student: studentName) {
            var sum: Float = 0
            let cnt = Float(studentList[studentName]!.subjects.count)
            if cnt == 0 {
                print("과목이 존재하지 않습니다.")
                return
            }
            
            for subject in studentList[studentName]!.subjects {
                print("\(subject.value.subject):", subject.value.grade)
                sum += GradeType(rawValue: subject.value.grade)?.score ?? 0
            }
            print("평점 : \(sum / cnt)")
        }
    }
    
    /// 입력 예외를 처리하고 입력값을 반환하는 메서드
    private func inputProcessing(_ input: InputType) -> String? {
        print(input.preMessage)
        guard let value = readLine(), value != "" else {
            print(input.errorMessage)
            return nil
        }
        return value
    }
    
    /// 존재하는 학생인지 판단하는 메서드
    private func isExist(student: String) -> Bool {
        if !studentList.contains(where: { $0.key == student }) {
            print("\(student) 학생을 찾지 못했습니다.")
            return false
        } else {
            return true
        }
    }
}
