

import 'package:clean_architecture/src/common/utils/date.dart';

import '../models/network/profile_response.dart';
import '../models/ui/profile.dart';
import 'base_mapper.dart';

class UserMapper extends Mapper<UserResponse, User> {
  @override
  User map(UserResponse data) {
    return User(
      id: data.id,
      username: data.username,
      dateJoined: data.dateJoined.toDate(),
      firstName: data.firstName,
      lastName: data.lastName,
      email: data.email,
      score: data.score,
      isMe: data.isMe,
    );
  }
}
