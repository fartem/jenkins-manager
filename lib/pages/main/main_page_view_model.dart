import 'package:stacked/stacked.dart';

import '../../components/settings/api/settings.dart';

class MainPageViewModel extends FutureViewModel {
  final Settings settings;

  MainPageViewModel({required this.settings});

  @override
  Future futureToRun() => settings.init();
}
