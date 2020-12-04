import 'package:get_it/get_it.dart';
import 'package:text_reg/services/math_game.dart';
import 'package:text_reg/services/word_game.dart';
import 'package:text_reg/services/process_canvas.dart';

GetIt locator = GetIt.instance;

setupServiceLocator() {
  locator.registerLazySingleton<ProcessCanvasService>(
      () => ProcessCanvasService());
  locator.registerLazySingleton<MathGame>(() => MathGame());
  locator.registerLazySingleton<WordGame>(() => WordGame());
}
