enum Gender { Male, Female, Other }

extension GenderExtension on Gender {
  String toMap() {
    switch (this) {
      case Gender.Male:
        return 'Male';
      case Gender.Female:
        return 'Female';
      case Gender.Other:
        return 'Other';
    }
  }

  static Gender fromMap(String gender) {
    switch (gender) {
      case 'Male':
        return Gender.Male;
      case 'Female':
        return Gender.Female;
      case 'Other':
        return Gender.Other;
      default:
        throw ArgumentError('Invalid gender value');
    }
  }
}

enum userType { student, professional, other }
