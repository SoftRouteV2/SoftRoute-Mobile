class Employee {
  final int employeeId;
  final int dni;
  final String employeeName;
  final String password;
  final String email;

  Employee({
    required this.employeeId,
    required this.dni,
    required this.employeeName,
    required this.password,
    required this.email,
  });

  factory Employee.fromJson(Map<String, dynamic> json) {
    return Employee(
      employeeId: json['employeeId'],
      dni: json['dni'],
      employeeName: json['employeeName'],
      password: json['password'],
      email: json['email'],
    );
  }
}
