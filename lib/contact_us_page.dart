import 'package:flutter/material.dart';
/*import 'package:google_maps_flutter/google_maps_flutter.dart';*/

class ContactUsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:  Center(
          child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
           Text('📞', style: TextStyle(fontSize: 24)), // Phone emoji
            SizedBox(width: 9), //  spacing between the text and the emoji
            Text(
              'Contact Us',
              style: TextStyle(fontSize: 26),
            ),
            Spacer(),
          ],
        ),
      ),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextFormField(
              decoration: InputDecoration(labelText: 'First Name'),
            ),
            TextFormField(
              decoration: InputDecoration(labelText: 'Last Name'),
            ),
            TextFormField(
              decoration: InputDecoration(labelText: 'Email'),
            ),
            TextFormField(
              decoration: InputDecoration(labelText: 'Your Message'),
              maxLines: 3,
            ),
            SizedBox(height: 20), // Space between fields and button
            ElevatedButton(
              onPressed: () {
                // Send message logic here
              },
              child: Text('Send Message'),
            ),
             Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                /*Container(
                  height: 200, // Adjust the height of the map container
                   child: GoogleMap(
                        initialCameraPosition: CameraPosition(
                          target: LatLng(33.6129797, -7.5300644), // Initial map location (replace with your hospital's coordinates)
                          zoom: 14, // Zoom level
                        ),
                        markers: Set<Marker>.of([
                            Marker(
                              markerId: MarkerId('hospital'),
                              position: LatLng(33.6129797, -7.5300644), // Marker position (replace with your hospital's coordinates)
                              infoWindow: InfoWindow(title: 'Your Hospital'),
                            ),
                          ]),
                   ),
                  //color: Colors.grey, // Placeholder color for the map
                ),*/
                 SizedBox(height: 10),
                Text(
                  'Address: 279, Bd chefchaouni, Aïn sebaâ ,Casablanca',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 13),
                Text('Phone Number: 0666778899',
                style: TextStyle(fontWeight: FontWeight.bold),
                ),
                
              ],
             ),
          ],
        ),
      ),
       );
  }
}