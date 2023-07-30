import SwiftUI
/*
 * Displays the courses and their grades as a row
 */
struct CourseRow: View {
    var course : Course
    var body: some View{
        HStack {
            Text(course.name)
        }
        Spacer()
       /* Text("\(String(format: "%.2f", course.grade))%")
            .frame(width: 125 )*/
        Text("\(finalGrade(sections:course))%").bold().frame(maxWidth: .infinity, alignment: .trailing)
        
    }
}
func finalGrade(sections : Course) -> String{
    var avg = 0.0
        for key in sections.assignmentList.keys{
            let adjustedWeight = Double(sections.weightList[key]!)/100
            //print(adjustedWeight)
            avg += adjustedWeight * sections.assignmentList[key]!
    }
    return ("\(avg)")
}
struct CourseRow_Previews : PreviewProvider {
    static var previews: some View {
        CourseRow(course: Course(name: "Class2", grade: 90.0, assignmentList: ["Work 1": 90.0, "Work 2" : 95.0], weightList: ["Work 1": 50.0, "Work 2" : 50.0]))
    }
}

