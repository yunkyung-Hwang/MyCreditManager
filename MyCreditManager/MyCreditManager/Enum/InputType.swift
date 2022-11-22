//
//  InputType.swift
//  MyCreditManager
//
//  Created by 황윤경 on 2022/11/21.
//

import Foundation

enum InputType {
    case addStudent
    case deleteStudent
    case addScore
    case deleteScore
    case printAverage
}

extension InputType {
    var preMessage: String {
        switch self {
        case .addStudent:
            return "추가할 학생의 이름을 입력해주세요"
        case .deleteStudent:
            return "삭제할 학생의 이름을 입력해주세요"
        case .addScore:
            return "성적을 추가할 학생의 이름, 과목 이름, 성적(A+, A, F 등)을 띄어쓰기로 구분하여 차례로 작성해주세요.\n입력예) Mickey Swift A+\n만약에 학생의 성적 중 해당 과목이 존재하면 기존 점수가 갱신됩니다."
        case .deleteScore:
            return "성적을 삭제할 학생의 이름, 과목 이름을 띄어쓰기로 구분하여 차례로 작성해주세요.\n입력예) Mickey Swift"
        case .printAverage:
            return "평점을 알고싶은 학생의 이름을 입력해주세요"
        }
    }
    
    var errorMessage: String {
        switch self {
        case .addStudent, .deleteStudent, .addScore, .deleteScore, .printAverage:
            return "입력이 잘못되었습니다. 다시 확인해주세요."
        }
    }
}
