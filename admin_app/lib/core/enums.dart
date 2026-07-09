enum AppEnvironment { dev, production }

enum ToastType { success, error }

enum LogLevel {
  shout(1200),
  severe(1000),
  warning(900),
  info(800),
  config(700),
  fine(500),
  finer(400),
  finest(300),
  all(0),
  off(2000);

  final int value;

  const LogLevel(this.value);
}
