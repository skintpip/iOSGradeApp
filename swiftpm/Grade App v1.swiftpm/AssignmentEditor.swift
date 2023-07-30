/*
 👾Created by Darren Bryant | University of Texas ar Austin | BS ECE 24👾
 */
import SwiftUI
/*
 * This view allows users to add new assignments to their courses
 * Options include assignment name, grade, and weight
 */
struct AssignmentEditor: View {
    @Environment(\.dismiss) var dismiss
    @State var inputedAssignment = ""
    @State var inputedGrade = 0.0
    @State var inputedWeight = 0.0
    @State var course : Course
    @State var index : Int
    @EnvironmentObject var data : Courses
    var body: some View{
        List{
                TextField("Assignment Name", text: $inputedAssignment)
                TextField("Grade", value: $inputedGrade, formatter: Formatter.lucNumberFormat)
                TextField("Weight", value:$inputedWeight, formatter: Formatter.lucNumberFormat)
        }.toolbar{
            ToolbarItem{
                Button("Add"){
                    if(inputedAssignment != "" && inputedGrade != 0 && inputedWeight != 0){
                        data.courseList[index].assignmentList.updateValue(inputedGrade, forKey: inputedAssignment)
                        data.courseList[index].weightList[inputedAssignment] = inputedWeight
                        dismiss()
                    }else{dismiss()}
                }
            }
        
        }
    }
}

struct AssignmentEditor_Previews: PreviewProvider{
    static var previews: some View{
        NavigationStack{
            AssignmentEditor(course: Course(name: "Test", grade: 90.0, assignmentList: ["Test":90], weightList: ["Test":100]), index: 0)
                .environmentObject(Courses())
        }
    }
}
