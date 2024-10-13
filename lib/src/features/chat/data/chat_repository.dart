import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:language_learning_app/src/features/auth/domain/user_model.dart';
import 'package:language_learning_app/src/features/chat/domain/message.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../utils/firebase_providers.dart';
part 'chat_repository.g.dart';

class ChatRepository {
  final FirebaseAuth _auth;
  final FirebaseFirestore _firestore;
  const ChatRepository(
      {required FirebaseAuth firebaseAuth,
      required FirebaseFirestore firestore})
      : _firestore = firestore,
        _auth = firebaseAuth;

  User? get currentUser => _auth.currentUser;

  String getConversationID(String id) =>
      currentUser!.uid.hashCode <= id.hashCode
          ? '${currentUser!.uid}_$id'
          : '${id}_${currentUser!.uid}';

  Stream<List<Message>> getAllMessages(UserModel user) {
    final response = _firestore
        .collection('chats/${getConversationID(user.id!)}/messages/')
        .orderBy('sent', descending: true)
        .snapshots();
    return response.map(
        (event) => event.docs.map((e) => Message.fromDocument(e)).toList());
  }

  Stream<List<Message>> getGroupMessage(String classroomId) {
    final response = _firestore
        .collection('classrooms')
        .doc(classroomId)
        .collection('messages')
        .orderBy('sent', descending: true)
        .snapshots();
    return response.map(
        (event) => event.docs.map((e) => Message.fromDocument(e)).toList());
  }

  Future<void> sendGroupMessage(String classroomId, String msg) async {
    //message sending time (also used as id)
    final time = DateTime.now().millisecondsSinceEpoch.toString();

    //message to send
    final Message message = Message(
        toName: 'group',
        fromName: currentUser!.displayName ?? currentUser!.email!,
        toId: 'group',
        msg: msg,
        read: '',
        fromId: currentUser!.uid,
        sent: time);

    final ref = _firestore.collection('classrooms/$classroomId/messages/');

    await ref.doc(time).set(message.toDocument());
  }

  // for sending message
  Future<void> sendMessage(UserModel chatUser, String msg) async {
    //message sending time (also used as id)
    final time = DateTime.now().millisecondsSinceEpoch.toString();

    //message to send
    final Message message = Message(
        toName: chatUser.name ?? chatUser.email,
        fromName: currentUser!.displayName ?? currentUser!.email!,
        toId: chatUser.id!,
        msg: msg,
        read: '',
        fromId: currentUser!.uid,
        sent: time);

    final ref = _firestore
        .collection('chats/${getConversationID(chatUser.id!)}/messages/');

    await ref.doc(time).set(message.toDocument());
  }

  Future<void> updateMessageReadStatus(Message message) async {
    _firestore
        .collection('chats/${getConversationID(message.fromId)}/messages/')
        .doc(message.sent)
        .update({'read': DateTime.now().millisecondsSinceEpoch.toString()});
  }

  Stream<List<Message>> getLastMessage(UserModel user) {
    final response = _firestore
        .collection('chats/${getConversationID(user.id!)}/messages/')
        .orderBy('sent', descending: true)
        .limit(1)
        .snapshots();
    return response.map(
        (event) => event.docs.map((e) => Message.fromDocument(e)).toList());
  }
}

@riverpod
ChatRepository chatRepository(ChatRepositoryRef ref) {
  final firebaseAuth = ref.watch(firebaseAuthProvider);
  final firestore = ref.watch(firestoreProvider);

  return ChatRepository(firebaseAuth: firebaseAuth, firestore: firestore);
}

@riverpod
Stream<List<Message>> lastMessage(LastMessageRef ref, UserModel user) {
  return ref.read(chatRepositoryProvider).getLastMessage(user);
}

@riverpod
Stream<List<Message>> allMessages(AllMessagesRef ref, UserModel user) {
  return ref.read(chatRepositoryProvider).getAllMessages(user);
}

@riverpod
Stream<List<Message>> allGroupMessages(
    AllGroupMessagesRef ref, String classroomId) {
  return ref.read(chatRepositoryProvider).getGroupMessage(classroomId);
}
