class Profile {
  final int? id;
  final String name;
  final String bio;
  final String skills;
  final int? servicesAmount; // Amount of services done.
  final String? urlImage;

  Profile({
    required this.name,
    required this.bio,
    required this.skills,
    this.id,
    this.servicesAmount = 0,
    this.urlImage = 'assets/images/workers/worker-image.webp',
  });

  static Profile create(String name, String bio, String skills) {
    return Profile(name: name, bio: bio, skills: skills);
  }
}
