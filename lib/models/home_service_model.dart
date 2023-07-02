class HomeServiceModel {
  final String imgPath;
  final String label;

  const HomeServiceModel({required this.imgPath, required this.label});

  static List<HomeServiceModel> generatedItem = [
    const HomeServiceModel(
        imgPath: 'assets/images/patient.png', label: 'Patients'),
    const HomeServiceModel(
        imgPath: 'assets/images/appointment.png', label: 'Appointments'),
    const HomeServiceModel(
        imgPath: 'assets/images/medical-team.png', label: 'Staff'),
    const HomeServiceModel(
        imgPath: 'assets/images/megaphone.png', label: 'Marketing'),
    const HomeServiceModel(
        imgPath: 'assets/images/whatsapp.png', label: 'Whatsapp'),
    const HomeServiceModel(
        imgPath: 'assets/images/clock.png', label: 'Timings'),
  ];
}
