<?php
// controllers/EmployeeController.php
require 'models/Employee.php';
class EmployeeController {
    public function show($id) {
        // Fetch employee data from database (pseudo code)
        $employee = new Employee($id, 'John Doe', 'Developer', 60000);
        require 'views/employee.php';
    }
}
