/*
 👾Created by Darren Bryant | University of Texas ar Austin | BS ECE 24👾
 */
import SwiftUI
struct AssignmentView: View{
    @Environment(\.dismiss) var dismiss
    @EnvironmentObject var data : Courses
    @State var course : Course
    @State var key : String
    @State var index : Int
    @State var gradeInput = 0.0
    @State var weightInput = 0.0
    var body: some View{
        List{
            TextField("Grade: \(String(format: "%.2f", course.assignmentList[key]!))%", value: $gradeInput, formatter: Formatter.lucNumberFormat)
            TextField("Weight: \(String(format: "%.2f", course.weightList[key]!))%", value: $weightInput, formatter: Formatter.lucNumberFormat)
        }
        Button("Submit Changes"){
            data.courseList[index].assignmentList.updateValue(gradeInput, forKey: key)
            data.courseList[index].weightList.updateValue(weightInput, forKey: key)
            dismiss()
        }
        
        /*
         List{
         ForEach(data.assignmentGrades) {grade in
         HStack{
         Text("\(grade.assignment)")
         Spacer()
         Text("\(grade.grade)")
         }
         }
         Button("Calculate Average"){
         calculateAverage(data: data)
         }
         }*/
    }
}
    
struct Assignment_Previews: PreviewProvider{
    static var previews: some View{
        NavigationStack{
            AssignmentView(course: Course(name: "Test", grade: 90.0, assignmentList: ["Test":90], weightList: ["Test":100]), key: "Test", index: 0)
                .environmentObject(Courses())
        }
    }
}
