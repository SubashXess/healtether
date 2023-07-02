class AppointmentUserModel {
  final String name;
  final String age;
  final String gender;
  final String date;
  final String time;
  final String bookingType;

  const AppointmentUserModel(
      {required this.name,
      required this.age,
      required this.gender,
      required this.date,
      required this.time,
      required this.bookingType});

  static List<AppointmentUserModel> generatedItem = [
    const AppointmentUserModel(
        name: 'Somnath Mogul',
        age: '27',
        gender: 'Male',
        date: '03 July 2023',
        time: '10:15 AM',
        bookingType: 'Virtually'),
    const AppointmentUserModel(
        name: 'Sheetal Chopra',
        age: '26',
        gender: 'Female',
        date: '03 July 2023',
        time: '11:30 AM',
        bookingType: 'On Clinic'),
    const AppointmentUserModel(
        name: 'Pradeep Karan',
        age: '34',
        gender: 'Male',
        date: '03 July 2023',
        time: '5:15 PM',
        bookingType: 'Virtually'),
    const AppointmentUserModel(
        name: 'Amolika Malhotra',
        age: '23',
        gender: 'Female',
        date: '04 July 2023',
        time: '10:15 AM',
        bookingType: 'Virtually'),
    const AppointmentUserModel(
        name: 'Dhiraj Ghose',
        age: '25',
        gender: 'Male',
        date: '04 July 2023',
        time: '10:30 AM',
        bookingType: 'On Clinic'),
    const AppointmentUserModel(
        name: 'Arjun Chopra',
        age: '26',
        gender: 'Male',
        date: '04 July 2023',
        time: '11:30 AM',
        bookingType: 'On Clinic'),
    const AppointmentUserModel(
        name: 'Arpit Choudhury',
        age: '40',
        gender: 'Male',
        date: '05 July 2023',
        time: '10:15 AM',
        bookingType: 'Virtually'),
  ];
}
