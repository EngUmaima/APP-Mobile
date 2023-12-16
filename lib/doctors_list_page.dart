import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'doctor.dart'; // Import the Doctor class

class DoctorListPage extends StatefulWidget {
  @override
  _DoctorListPageState createState() => _DoctorListPageState();
}

class _DoctorListPageState extends State<DoctorListPage> {
  late Stream<QuerySnapshot> doctorStream;

  @override
  void initState() async {
    super.initState();
    doctorStream = await FirebaseFirestore.instance.collection('doctor_list').snapshots();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Doctors List'),
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: doctorStream,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return CircularProgressIndicator();
          } else if (snapshot.hasError) {
            return Text('Error: ${snapshot.error}');
          } else if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
            return Text('No doctors found.');
          } else {
            return ListView.builder(
              itemCount: snapshot.data!.docs.length,
              itemBuilder: (context, index) {
                var doctorData = snapshot.data!.docs[index].data() as Map<String, dynamic>;
               
                 String firstName = doctorData['firstName'] as String? ?? ''; 
                 String lastName = doctorData['lastName'] as String? ?? '';
                 String speciality = doctorData['speciality'] as String? ?? '';
                 String workHours = doctorData['workHours'] as String? ?? '';
                 String about = doctorData['about'] as String? ?? '';
                 String photo = doctorData['photo'] as String? ?? '';
                 String number = doctorData['number'] as String? ?? '';

                  // Add other fields as needed
                
                return ListTile(
                      title: Text('$firstName $lastName'),
                      subtitle: Text(speciality),
                      // Display other fields as needed
                      trailing: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(workHours),
                          Text(number),
                        ],
                      ),
                      leading: CircleAvatar(
                        backgroundImage: NetworkImage(photo), // Assuming 'photo' is a URL
                        radius: 25, // Adjust the radius as needed
                      ),
                    );
                                  },
            );
          }
        },
      ),
    );
  }
}