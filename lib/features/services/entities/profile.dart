class Profile {
  final String name;
  final String bio;
  final String skills;

  Profile({required this.name, required this.bio, required this.skills});

  static Profile create(String name, String bio, String skills) {
    return Profile(name: name, bio: bio, skills: skills);
  }
}
