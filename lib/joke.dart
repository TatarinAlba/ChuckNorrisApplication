import 'package:json_annotation/json_annotation.dart';

part 'joke.g.dart';

@JsonSerializable()
class Joke {
  String? value;

  Joke(this.value);

  String getJoke() {
    return value!;
  }

  factory Joke.fromJson(Map<String, dynamic> json) => _$JokeFromJson(json);


}