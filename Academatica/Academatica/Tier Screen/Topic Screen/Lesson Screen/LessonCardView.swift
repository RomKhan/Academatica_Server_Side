//
//  LessonCardiew.swift
//  SmartMath
//
//  Created by Roman on 16.02.2022.
//

import SwiftUI
import ResizableSheet

struct LessonCardView: View {
    @StateObject var viewModel: LessonCardViewModel
    @Binding var practivceIsActive: Bool
    @Binding var practiceShow: Bool
    @Binding var showSheet: Bool
//    @Binding var startPractise: Bool
//    @Binding var state: ResizableSheetState
    private let height = UIScreen.main.bounds.height;
    var body: some View {
        VStack(alignment: .leading, spacing: height / 65) {
            Text("\(viewModel.topicName)".uppercased())
                .font(.system(size: height / 65, weight: .bold))
                .foregroundColor(Color(uiColor: UIColor(red: 89 / 255.0, green: 89 / 255.0, blue: 89 / 255.0, alpha: 1)))
                .padding(.top, height / 60)
                .lineLimit(1)
            Text(viewModel.model.name)
                .font(.system(size: height / 33.8, weight: .heavy))
                .lineLimit(1)
            Text(viewModel.model.descriptionId)
                .font(.system(size: height / 58))
                .foregroundColor(Color(uiColor: UIColor(red: 89 / 255.0, green: 89 / 255.0, blue: 89 / 255.0, alpha: 1)))
                .lineLimit(15)
            Button {
//                startPractise.toggle()
//                state = .hidden
//                practiceShow.toggle()
//                showSheet.toggle()
                practiceShow.toggle()
            } label: {
                Text("Начать практику")
                    .font(.system(size: height / 52, weight: .bold))
                    .foregroundColor(.white)
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(practivceIsActive ? viewModel.colors[0] : .gray)
                    .cornerRadius(height / 60)
                    .shadow(color: (practivceIsActive ? viewModel.colors[1] : .black).opacity(0.5), radius: 8, x: 0, y: 4)
                    .animation(.spring(), value: practivceIsActive)
            }
            .padding(.top, height / 25)
            .disabled(!practivceIsActive)
            Text("+\(viewModel.model.expRevards) EXP")
                .font(.system(size: height / 45, weight: .bold))
                .foregroundColor(practivceIsActive ? viewModel.colors[0] : .gray)
                .frame(maxWidth: .infinity)
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding(.horizontal, 20)
        .padding(.vertical, height / 60)
        .background(.ultraThinMaterial)
        .cornerRadius(height / 32)
    }
}

struct LessonCardiew_Previews: PreviewProvider {
    static var previews: some View {
        LessonCardView(
            viewModel: LessonCardViewModel(
                lesson: ClassModel(id: "1",
                                   TopicId: "1",
                                   TierId: "1",
                                   name: "Introduction",
                                   descriptionId: "What are natural numbers?",
                                   expRevards: 100,
                                   imageUrl: "",
                                   thearyUrl: "",
                                   problemNum: 10,
                                   status: 0),
                topicName: "Natural Numbers"),
            practivceIsActive: .constant(false),
            practiceShow: .constant(false),
            showSheet: .constant(false)
//            startPractise: .constant(false), state: .constant(ResizableSheetState.hidden)
        )
    }
}
