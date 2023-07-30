import SwiftUI
class Courses : ObservableObject {
    @Published var courseList = [Course(name: "Senior Design", grade: 100.0, assignmentList: ["Check Ins": 80.0, "Project" : 90.0, "Peer Grades": 100.0], weightList: ["Check Ins" : 20.0, "Project" : 50.0, "Peer Grades" : 30.0])]
}
struct Course : Identifiable {
    var name: String
    var grade = 0.0
    var id = UUID()
    var assignmentList : Dictionary<String, Double>
    var weightList : Dictionary<String, Double>
}
