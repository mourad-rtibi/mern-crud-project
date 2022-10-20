import BaseRouter from "./base.routes.js";
import EmployeeCtl from "./../controllers/employee.controller.js";

export default BaseRouter([
  { method: "GET", path: "/", func: new EmployeeCtl().listAllEmployess },
  { method: "POST", path: "/", func: new EmployeeCtl().createEmployee },
  {
    method: "PUT",
    path: "/update/:id",
    func: new EmployeeCtl().updateEmployee,
  },
  { method: "DELETE", path: "/drop/:id", func: new EmployeeCtl().dropEmployee },
  { method: "GET", path: "/list/:id", func: new EmployeeCtl().listByUserId },
  {
    method: "GET",
    path: "/search/:name",
    func: new EmployeeCtl().seachEmployee,
  },
]);
