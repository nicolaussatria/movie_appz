import 'package:movie_app/app_module.dart';
import 'package:movie_app/presentation/widgets/movie_detail/cast_widget.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:modular_test/modular_test.dart';

import '../../helpers/make_testable_widget.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  setUpAll(() {
    initModules(
      [AppModule()],
    );
  });
  testWidgets('cast widget screen test', (tester) async {
    await tester.pumpWidget(
      makeTestableWidget(child: CastWidget()),
    );
    await tester.pump();
    //expect(find.byType(ListView), findsOneWidget);
  });
}
