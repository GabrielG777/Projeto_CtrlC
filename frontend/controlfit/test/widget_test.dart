import 'package:controlfit/main.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('Login screen shows Control Fit branding', (tester) async {
    await tester.pumpWidget(const CtrlFitApp());

    expect(find.text('Control Fit'), findsOneWidget);
    expect(find.text('Entrar'), findsOneWidget);
    expect(find.text('Criar conta'), findsOneWidget);
    expect(find.text('Esqueceu sua senha?'), findsOneWidget);
  });
}
