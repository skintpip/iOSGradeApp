/*
 👾Created by Darren Bryant | University of Texas ar Austin | BS ECE 24👾
 */
import SwiftUI
/*
 * Displays each assignment for each course
 */
struct AssignmentRow: View{
    @State var assignmentList = [String : Double]()
    var course: Course
    var key: String
    @State var test = ""
    var body: some View{
        VStack(alignment: .center){
          /*  NavigationLink(key){
                AssignmentView(course: course, key: key ).navigationTitle("Edit Assignment")
            }.bold()*/
            Text("\(key)").bold().frame(width: 130, height: 10, alignment: .center)
            Text("Weight: \(String(format: "%.0f", course.weightList[key]!))%").frame(width: 130, height: 10, alignment: .center)
            Text("Grade: \(String(format: "%.2f",course.assignmentList[key]!))%").frame(maxWidth: .infinity, maxHeight: 10, alignment: .center)
            //TextField("Test", text: $test).body.padding(.leading)
        }
    }
}
struct AssignmentRow_Previews : PreviewProvider {
    static var previews: some View {
        AssignmentRow(course: Course(name: "Class2", grade: 90.0, assignmentList: ["Work 1": 90.0, "Work 2" : 95.0], weightList: ["Work 1": 50.0, "Work 2" : 50.0]),key: "Assignment")
    }
}
