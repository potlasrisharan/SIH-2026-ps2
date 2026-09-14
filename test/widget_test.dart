import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mota_scholarship/main.dart';
import 'package:mota_scholarship/features/home/data/models/student_profile.dart';
import 'package:mota_scholarship/features/schemes/data/models/scholarship_scheme.dart';

void main() {
  test('Student profile has valid ST and DigiLocker verification', () {
    const student = StudentProfile.sample;
    expect(student.digiLockerVerified, isTrue);
    expect(student.dbtLinked, isTrue);
    expect(student.category, contains('ST'));
    expect(student.familyIncome, lessThanOrEqualTo(250000.0));
  });

  test('MoTA Schemes repository contains 5 official central schemes', () {
    final schemes = ScholarshipScheme.sampleSchemes;
    expect(schemes.length, 5);
    expect(schemes.any((s) => s.id == 'scheme-top-class'), isTrue);
    expect(schemes.any((s) => s.id == 'scheme-post-matric'), isTrue);
  });

  testWidgets('App renders main navigation and dashboard', (WidgetTester tester) async {
    await tester.pumpWidget(const ProviderScope(child: MotaScholarshipApp()));
    await tester.pumpAndSettle();

    expect(find.text('MINISTRY OF TRIBAL AFFAIRS'), findsOneWidget);
    expect(find.text('Ramesh Soren'), findsOneWidget);
    expect(find.text('100% VERIFIED'), findsOneWidget);
  });
}
