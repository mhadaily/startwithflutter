class WeatherInfo {
  final List<String> times;
  final List<String> temps;
  final List<String> days;

  WeatherInfo({
    this.times,
    this.temps,
    this.days,
  });

  factory WeatherInfo.fromJson(Map<String, dynamic> json) {
    return WeatherInfo(
      times: json['times'].cast<String>(),
      temps: json['temps'].cast<String>(),
      days: json['days'].cast<String>(),
    );
  }
}
