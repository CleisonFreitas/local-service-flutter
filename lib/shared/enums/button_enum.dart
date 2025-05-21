enum ButtonEnum {
  primary('Primary'),
  secondary('Secondary');

  final String option;
  const ButtonEnum(this.option);

  String get label => option;
}
