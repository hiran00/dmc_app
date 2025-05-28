// Define the IncidentReport class
class IncidentReport {
  final String fullName;
  final String disasterType;
  final String description;
  final String location;

  IncidentReport({
    required this.fullName,
    required this.disasterType,
    required this.description,
    required this.location,
  });
}

// Create a global list for incidents
List<IncidentReport> reportedIncidents = [];

// Declare current user city
String? currentUserCity;

// Define updateUserCity function
void updateUserCity(String? city) {
  currentUserCity = city;
}

List<IncidentReport> getMatchingIncidents() {
  if (currentUserCity == null || currentUserCity!.isEmpty) {
    return [];
  }

  List<IncidentReport> matchingIncidents = [];
  for (var incident in reportedIncidents) {
    if (incident.location.toLowerCase() == currentUserCity!.toLowerCase()) {
      matchingIncidents.add(incident);
    }
  }
  return matchingIncidents;
}
