//
//  QuizBrain.swift
//  QuizApps
//
//  Created by Nguyễn Hữu Khánh on 19/03/2021.
//

import UIKit

struct QuizBrain {
    
    var questionNumber = 0
    var score = 0
    var done = false
    
    let quiz = [
        Question(photo: "binhnuoc", q: "Có hai bình rộng miệng đựng đầy nước. Làm sao để cho tất cả nước vào trong một cái chậu mà vẫn biết nước nào của bình nào (không được cho cả bình hay bất kỳ dụng cụ đựng nước nào vào chậu)?", a: ["đông đá hai bình", "cho phẩm vào một bình", "gọi người yêu hỏi", "gọi bình ra hỏi"], correctAnswer: "đông đá hai bình"),
        Question(photo: "quandui", q: "Quần rộng nhất là quần gì?", a: ["quần đùi", "quần tam giác", "quần dài", "quần đảo"], correctAnswer: "quần đảo"),
        Question(photo: "ngoctrai", q: "Con trai có gì quí nhất?", a: ["chiêm......bao", "tiền", "ngọc trai", "gọi người yêu ra hỏi"], correctAnswer: "gọi người yêu ra hỏi"),
        Question(photo: "cua", q: "Làm thế nào để con cua được chính chân?", a: ["Gắn thêm chân cho nó", "Mua 9 con cua,chi chân cho 8 con", "Luộc nó lên là chín", "Gọi điện cho người yêu hỏi"], correctAnswer: "Gọi điện cho người yêu hỏi"),
        Question(photo: "giadinh", q: "A gọi B bằng bác, B gọi C là ông nội , C kêu D là cậu, D kêu E là dì, E kêu F là chú, F gọi Z là con. Hỏi A gọi Z bằng gì?", a: ["Chịu biết del được", "gọi bằng...mồm", "niềm tin", "người yêu"], correctAnswer: "gọi bằng...mồm"),
        Question(photo: "monalisa", q: "Bức tranh nàng Mônalisa, người đẹp này không có gì?", a: ["Không có chân mày", "Không có dáy tai", "không có lông mũi", "không có được tôi"], correctAnswer: "không có được tôi"),
        Question(photo: "baquatao", q: "Có ba quả táo trên bàn và bạn lấy đi hai quả. Hỏi bạn còn bao nhiêu quả táo?", a: ["Một quả", "Hai quả", "Đem cho em hàng xóm hết", "Gọi điện hỏi người yêu"], correctAnswer: "Hai quả"),
        Question(photo: "emgai", q: "Bố mẹ có sáu người con trai, mỗi người con trai có một em gái. Hỏi gia đình đó có bao nhiêu người?", a: ["hỏi lắm thế, không biết", "9 người", "12 người", "14 người"], correctAnswer: "9 người"),
        Question(photo: "diem", q: "Nếu chỉ có một que diêm, trong một ngày mùa đông giá rét, bạn bước vào căn phòng có một cây đèn, một bếp dầu, và một bếp củi, bạn thắp gì trước tiên?", a: ["Bật đèn lên", "Đốt củi cho ấm", "thắp nhang", "thắp diêm, chứ đèn củi có thắp được đâu"], correctAnswer: "thắp diêm, chứ đèn củi có thắp được đâu"),
        Question(photo: "maybay", q: "Tôi chu du khắp thế giới mà tôi vẫn ở nguyên một chỗ, tôi là ai?", a: ["Con tem", "phi công", "chị hàng xóm", "tôi là tôi"], correctAnswer: "tôi là tôi"),
    ]
    
    
    func getQuestionText() -> String {
        return quiz[questionNumber].text
    }
    
    func getPhoto() -> String {
        return quiz[questionNumber].img
    }
    
    func getAnswer() -> [String] {
        return quiz[questionNumber].answears
    }
    
    func getProgress() -> Float {
        return Float(questionNumber) / Float(quiz.count)
    }
    
    func getScore() -> Int {
        return score
    }
    
    mutating func nextQuestion() {
        if questionNumber + 1 < quiz.count {
            questionNumber += 1
        } else {
            done = true
            questionNumber = 0
        }
    }
    
    mutating func checkAnswer(userAnswer: String) -> Bool {
        if userAnswer == quiz[questionNumber].rightAnswer {
            score += 1
            return true
        } else {
            return false
        }
    }
    
    func getDone() -> Bool {
        return done
    }
}
