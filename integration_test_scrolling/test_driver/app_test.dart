import 'package:flutter_driver/flutter_driver.dart';
import 'package:test/test.dart';

void main() {
  group('Scrollable App', () {
    FlutterDriver driver;

    setUpAll(() async {
      driver = await FlutterDriver.connect();
    });

    tearDownAll(() async {
      if (driver != null) {
        driver.close();
      }
    });

    test('verifies the list contains a specific item', () async {
      final listFinder = find.byValueKey('long_list');
      final itemFinder = find.byValueKey('item_50_text');

      final timeline = await driver.traceAction(() async {
        await driver.scrollUntilVisible(
          listFinder,
          itemFinder,
          dyScroll: -300.0
        );

        expect(
          await driver.getText(itemFinder),
          'Item 50'
        );
      });

      final summary = new TimelineSummary.summarize(timeline);

      summary.writeSummaryToFile('scrolling_summary', pretty: true);

      summary.writeTimelineToFile('scrolling_timeline', pretty: true);
    });
  });
}