/*
 👾Created by Darren Bryant | University of Texas ar Austin | BS ECE 24👾
 */
import SwiftUI
/*
 * The first view that users will come across
 * Users can select individual courses to open a detailed view on assignment weights and grades
 * Users can swipe left on courses to delete them
 * Grades update automatically
 */
struct ContentView: View {
    @EnvironmentObject var courses : Courses
    var body: some View {
        List{
            ForEach(Array(courses.courseList.enumerated()),id: \.offset){  offset, course in
                NavigationLink
                {
                    GradeView(course: course,index: offset)
                        .navigationTitle(course.name)
                }label: {
                    CourseRow(course: course)
                }
            }.onDelete { indexSet in
                courses.courseList.remove(atOffsets: indexSet)
            }
        }.toolbar{
            ToolbarItem{
                NavigationLink ("Add Course"){
                    CourseEditor()
                }
            }
        }
        
    }
}
struct ContentView_Previews : PreviewProvider {
    static var previews: some View {
        ContentView().environmentObject(Courses())
    }
}
