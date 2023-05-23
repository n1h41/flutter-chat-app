import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../data/repositories/module.dart';
import 'logout.dart';

final logoutProvider = Provider<Logout>(
  (ref) {
    final repository = ref.watch(homeRepositoryProvider);
    return Logout(repository);
  },
);
