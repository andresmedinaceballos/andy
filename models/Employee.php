<?php
// models/Employee.php
class Employee {
    public $id;
    public $name;
    public $position;
    public $salary;

    public function __construct($id, $name, $position, $salary) {
        $this->id = $id;
        $this->name = $name;
        $this->position = $position;
        $this->salary = $salary;
    }
}
