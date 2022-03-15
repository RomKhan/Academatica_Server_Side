//
//  LessonViewModel.swift
//  SmartMath
//
//  Created by Roman on 16.02.2022.
//

import SwiftUI
import Combine

class LessonViewModel: ObservableObject {
    @Published var model: ClassModel = ClassModel(id: "0", name: "classname", description: "desc", expReward: 100, imageUrl: nil, theoryUrl: URL(string: "https://google.com")!, problemNum: 10, topicName: "topicname", isComplete: false, isUnlocked: true)
    @Published var classId: String = ""
    var topicName: String = ""
    let colors = [
        Color(uiColor: UIColor(red: 162 / 255.0, green: 51 / 255.0, blue: 215 / 255.0, alpha: 1)),
        Color(uiColor: UIColor(red: 244 / 255.0, green: 124 / 255.0, blue: 244 / 255.0, alpha: 1)),
        Color(uiColor: UIColor(red: 162 / 255.0, green: 27 / 255.0, blue: 164 / 255.0, alpha: 1))
    ]
    
    private var cancellables = Set<AnyCancellable>()
    
    init(lesson: ClassModel, topicName: String) {
        model = lesson
        self.topicName = topicName
        
        CourseService.shared.$currentClass.sink { [weak self] newValue in
            if let newValue = newValue {
                self?.model = newValue
                self?.classId = newValue.id
            }
        }.store(in: &cancellables)
    }
}
