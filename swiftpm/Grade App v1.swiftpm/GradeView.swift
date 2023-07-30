/*
 👾Created by Darren Bryant | University of Texas ar Austin | BS ECE 24👾
 */
import SwiftUI
/*
 * This view displays the individual assignments for a selected course along with grade, weight, and final course grade
 * Option to add a new assignment
 * If user taps an assignment, a view opens allowing them to adjust the weight and grade for the assignment
 * Users can swipe left to delete assignments
 */
struct GradeView: View{
    //@State var average = 0
    @EnvironmentObject var data : Courses
    @State var course : Course
    @State var assignmentList = [String : Double]()
    @State var index : Int
    @State var test = 0.0
    var body: some View{
        VStack(){
            HStack(alignment: .center, spacing: 25){
                VStack{
                    Text("Current Grade:").frame(width: 200, height: 50, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/).bold().font(.title)
                    Text("\(finalGrade(sections:course))%").frame(width: 120, height: 10, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/).font(.title)
                }
               // Divider()
               /* VStack{
                    Text("Target Grade").frame(width: 120, height: 10, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                    TextField("\(String(format: "%.2f", test))%", value: $test, formatter: Formatter.lucNumberFormat).body.padding(.leading).frame(width: 120, height: 10, alignment: .center)
                }*/
            }.padding()
            Divider()
            List{
                ForEach(Array(course.assignmentList.keys),id: \.self){ key in 
                    NavigationLink{
                        AssignmentView(course: course, key: key, index : index).navigationTitle("Edit Assignment")
                        
                    }label:{
                        AssignmentRow(assignmentList: assignmentList, course: course, key: key)
                    }
            }.onDelete(perform: deleteAssignment)
            }.body.frame(width: 400, height: 500, alignment: .center)
           
       }.toolbar{
           ToolbarItem{
               NavigationLink("Add Assignment"){
                   AssignmentEditor(course: course, index: index)
               }
           }
       }
    
       
        
    }
     func deleteAssignment(at offsets: IndexSet){
        let key = Array(course.assignmentList.keys)[offsets.first!]
         self.data.courseList[index].assignmentList.removeValue(forKey: key)
    }
}

struct Grades_Previews: PreviewProvider {
    static var previews: some View {
        GradeView(course: Course(name: "Test", grade: 90.0, assignmentList: ["Test":90], weightList: ["Test":100]), index: 0).environmentObject(Courses())
    }
}
