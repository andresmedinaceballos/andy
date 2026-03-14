<?php
// controllers/DepartmentController.php
require 'models/Department.php';
class DepartmentController {
    public function show($id) {
        // Fetch department data from the database (pseudo code)
        $department = new Department($id, 'IT');
        require 'views/department.php';
    }
}
