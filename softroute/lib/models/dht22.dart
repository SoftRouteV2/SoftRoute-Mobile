/*public class Dht22 {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @NotBlank
    @Column(name = "temperature")
    private String temperature;

    @NotNull
    @Column(name = "humidity")
    private String humidity;
}
*/

class Dht22 {
  final int id;
  final String temperature;
  final String humidity;

  Dht22({
    required this.id,
    required this.temperature,
    required this.humidity,
  });

  factory Dht22.fromJson(Map<String, dynamic> json) {
    return Dht22(
      id: json['id'],
      temperature: json['temperature'],
      humidity: json['humidity'],
    );
  }

  //create none value shipment

  factory Dht22.none() {
    return Dht22(
      id: 0,
      temperature: '',
      humidity: '',
    );
  }
}
