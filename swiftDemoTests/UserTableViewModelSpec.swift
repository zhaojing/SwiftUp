import Quick
import Nimble
@testable import SwiftDemo

class UserTableViewModelSpec: QuickSpec {
    override func spec() {
        describe("tableViewModel") {
            context("network call back success") {
                let viewModel = UserTableViewModel()
                viewModel.getUsers(MockUserDataSuccessFetcher(), success: {}, error: {_ in})
                it("UserCount should equal 2") {
                    expect(viewModel.getUserCount()).to(equal(2))
                }
                it("getUserData index 0, age should equal 69") {
                    let user = viewModel.getUserData(IndexPath(row: 0, section: 0))
                    expect(user.age).to(equal(69))
                }
            }
            context("network call back fail") {
                let viewModel = UserTableViewModel()
                viewModel.getUsers(MockUserDataFailFetcher(), success: {}, error: {_ in})
                it("UserCount should equal 0") {
                    expect(viewModel.getUserCount()).to(equal(0))
                }
            }
        }
    }
}
