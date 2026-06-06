class GreetingHelper {
  static String getGreeting() {
    final hour = DateTime.now().toLocal().hour;

    if (hour < 12) {
      return 'Good Morning ☀️';
    } else if (hour < 17) {
      return 'Good Afternoon 🌤️';
    } else if (hour < 21) {
      return 'Good Evening 🌇';
    } else {
      return 'Good Night 🌙';
    }
  }
}
