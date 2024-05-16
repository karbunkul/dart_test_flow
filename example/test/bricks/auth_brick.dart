import '../app_context.dart';

final class AuthFlowBrick extends UnitBrickFlow {
  @override
  Future<void> flow(AppContext ctx) async {
    await AuthFlowBrick().flow(ctx);

    // await ctx.hasAuthorized();

    // если мы не авторизованы то должна быть видна кнопка Login
    final loginFinder = find.text('Login');
    expect(loginFinder, findsOne);

    // авторизуемся
    await ctx.tapAndPump(loginFinder);
    // проверяем что ушли с авторизации
    expect(loginFinder, findsNothing);
  }

  @override
  String get summary => 'User authorized';
}
