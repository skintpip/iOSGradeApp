/*
 👾Created by Darren Bryant | University of Texas ar Austin | BS ECE 24👾
 */
import SwiftUI
/*
 * This view allows users to add new courses to their course list 
 * Users shall include course name, initial assignment name, grade, and weight
 * Users can add course with only the course name and adjust assignments later
 */
struct CourseEditor : View {
    @Environment(\.dismiss) var dismiss
    @EnvironmentObject var data : Courses
    @State var courseName = ""
    @State var assignmentName = ""
    @State var grade = 0.0
    @State var assignmentList = [String : Double]()
    @State var weightList = [String : Double]()
    @State var weight = 0.0
    var body: some View{
        List{
            TextField("Course Name", text: $courseName)
            TextField("Assignment Name", text: $assignmentName)
            TextField("Input Grade", value: $grade, formatter: Formatter.lucNumberFormat)
            TextField("Input Weight", value: $weight, formatter: Formatter.lucNumberFormat)
            Button("Add Course"){
                if(courseName != ""){
                    assignmentList[assignmentName] = grade
                    weightList[assignmentName] = weight
                    @State var newCourse : Course = Course(name: courseName, grade: grade, assignmentList: assignmentList, weightList: weightList)
                    data.courseList.append(newCourse)
                    dismiss()
                } else{dismiss()}
            }
        }
    }
}
extension Formatter{
    static let lucNumberFormat: NumberFormatter = {
        let formatter = NumberFormatter()
        formatter.numberStyle = .none
        formatter.zeroSymbol = ""
        return formatter
    }()
}
struct CourseEditor_Previews: PreviewProvider{
    static var previews: some View{
        NavigationStack{
            CourseEditor()
                .environmentObject(Courses())
        }
    }
}
