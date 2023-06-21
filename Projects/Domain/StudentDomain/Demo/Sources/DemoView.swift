import StudentDomainInterface
import BaseDomain
import Emdpoint
import SwiftUI
@testable import StudentDomain

struct DemoView: View {
    var body: some View {
        HStack {
            Text("ASDf")
                .onTapGesture {
                    let client = EmdpointClient<StudentEndpoint>()
                    Task {
                        do {
                            let response = try await client.request(.fetchStudentDetailByStudent(userID: "2f004cba-a22e-414a-9e52-afd54c762216"))
                            print(String(data: response.data, encoding: .utf8))
                        } catch {
                            print(error)
                        }
                    }
                }
        }
    }
}

struct DemoView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            DemoView()
        }
    }
}
