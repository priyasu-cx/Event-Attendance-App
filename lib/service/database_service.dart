import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';

import '../logic/models/user_details.dart';

///this class is responsible to handle all the database
///related functions and service

class DataBaseService {
  final CollectionReference _volunteersCollection =
      FirebaseFirestore.instance.collection('volunteers');
  final CollectionReference _attendeeCollection =
      FirebaseFirestore.instance.collection('attendees');

  final CollectionReference _devfestAttendeeCollection =
  FirebaseFirestore.instance.collection('devfest-attendee');

  Stream<UserModel?> streamAttendee(String docID) {
    return _devfestAttendeeCollection
        .doc(docID)
        .snapshots()
        .map((snap) {
      return UserModel.fromMap(snap.data() as Map<String,dynamic>?);
    });
  }

  Stream<int?> streamEntry() {
    return _devfestAttendeeCollection
        .where('isAttending', isEqualTo: true)
        .snapshots()
        .map((snap) {
      return snap.size;
    });
  }

  Stream<int?> streamLunch() {
    return _devfestAttendeeCollection
        .where('hasFood', isEqualTo: true)
        .snapshots()
        .map((snap) {
      return snap.size;
    });
  }

  Stream<int?> streamSwag() {
    return _devfestAttendeeCollection
        .where('hasSwag', isEqualTo: true)
        .snapshots()
        .map((snap) {
      return snap.size;
    });
  }

  Future<String> fetchDocID(String regID) async {
    var data = await _attendeeCollection
        .where("regID", isEqualTo: regID)
        .limit(1)
        .get();

    var id = data.docs[0].id;

    return id;
  }

  ///Update Entry status
  ///
  ///
  updateEntry(String uuid) async {
    try {
      await _devfestAttendeeCollection
          .doc(uuid)
          .update({"isAttending": true});
    } catch (err) {
      if (kDebugMode) {
        print(err);
      }
    }
  }

  ///Update Food status
  ///
  ///
  updateFood(String uuid) async {
    try {
      await _devfestAttendeeCollection
          .doc(uuid)
          .update({"hasFood": true});
    } catch (err) {
      if (kDebugMode) {
        print(err);
      }
    }
  }

  ///Update Food status
  ///
  ///
  updateSwag(String uuid) async {
    try {
      await FirebaseFirestore.instance
          .collection('devfest-attendee')
          .doc(uuid)
          .update({"hasSwag": true});
    } catch (err) {
      if (kDebugMode) {
        print(err);
      }
    }
  }


  Future<bool> verifyVolunteer(String emailID) async {
    ///fetch the volunteer list
    ///
    ///

    var doc = await _volunteersCollection.doc(emailID).get();

    return doc.exists;
  }
}
