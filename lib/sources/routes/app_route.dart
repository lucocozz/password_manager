import 'package:auto_route/auto_route.dart';

import '../pages/create_master_password.dart';
import '../pages/unlock.dart';

@MaterialAutoRouter(routes: [
  MaterialRoute(page: CreateMasterPasswordPage),
  MaterialRoute(page: UnlockPage),
])
class $AppRoute {}
