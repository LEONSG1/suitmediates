import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class ThirdPage extends StatelessWidget {
  const ThirdPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Third Page'),
        centerTitle: true,
        backgroundColor: Colors.blue,
      ),
      body: const UserList(),
    );
  }
}

class UserList extends StatefulWidget {
  const UserList({Key? key}) : super(key: key);

  @override
  _UserListState createState() => _UserListState();
}

class _UserListState extends State<UserList> {
  List<dynamic> userList = [];
  int page = 1;
  int perPage = 10;
  bool isLoading = false;

  @override
  void initState() {
    super.initState();
    fetchUsers();
  }

  Future<void> fetchUsers() async {
    if (!mounted) {
      return;
    }

    setState(() {
      isLoading = true;
    });

    final response = await http.get(
      Uri.parse('https://reqres.in/api/users?page=$page&per_page=$perPage'),
    );

    if (response.statusCode == 200) {
      final jsonData = json.decode(response.body);
      if (!mounted) {
        return;
      }
      setState(() {
        userList.addAll(jsonData['data']);
        isLoading = false;
      });
    } else {
      throw Exception('Failed to load users');
    }
  }

  @override
  Widget build(BuildContext context) {
    return userList.isEmpty
        ? Center(
            child: isLoading
                ? const CircularProgressIndicator()
                : const Text('No users available'),
          )
        : ListView.builder(
            itemCount: userList.length,
            itemBuilder: (context, index) {
              final user = userList[index];
              return ListTile(
                title: Text('${user['first_name']} ${user['last_name']}'),
                subtitle: Text('${user['email']}'),
                leading: CircleAvatar(
                  backgroundImage: NetworkImage('${user['avatar']}'),
                ),
                onTap: () {
                  Navigator.of(context)
                      .pop('${user['first_name']} ${user['last_name']}');
                },
              );
            },
          );
  }
}
