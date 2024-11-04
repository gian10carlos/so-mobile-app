import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:so_mobile_app/config/__config__.dart';

import '../../widgets/__widgets__.dart';

class TransferScreen extends StatefulWidget {
  const TransferScreen({super.key});

  @override
  State<TransferScreen> createState() => _TransferScreenState();
}

class _TransferScreenState extends State<TransferScreen> {
  final dio = Dio(BaseOptions(baseUrl: Environment.apiUrl));

  TextEditingController dniController = TextEditingController();
  List<dynamic> searchResults = [];
  bool isLoading = false;

  Future<void> fetchDniMatches(String query) async {
    if (query.isEmpty) {
      setState(() {
        searchResults = [];
      });
      return;
    }

    setState(() {
      isLoading = true;
    });

    try {
      final response = await dio.post('/people/list', queryParameters: {
        "query": query,
      });

      if (response.statusCode == 201) {
        setState(() {
          searchResults = response.data;
        });
      } else {
        setState(() {
          searchResults = [];
        });
      }
    } catch (e) {
      setState(() {
        searchResults = [];
      });
      _showErrorSnackBar("Error: ${e.toString()}");
    } finally {
      setState(() {
        isLoading = false;
      });
    }
  }

  void _showErrorSnackBar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(35.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 20),
            CustomInputTextWidget(
                hintText: "DNI",
                color: Colors.black,
                obscureText: false,
                keyboardType: TextInputType.number,
                controller: dniController,
                onChange: (value) {
                  fetchDniMatches(value);
                  return null;
                }),
            const SizedBox(height: 20),
            if (isLoading)
              const Center(child: CircularProgressIndicator())
            else if (searchResults.isNotEmpty)
              Expanded(
                child: ListView.builder(
                  itemCount: searchResults.length,
                  itemBuilder: (context, index) {
                    final result = searchResults[index];
                    return ListTile(
                      title: Text(result['dni']),
                      onTap: () {
                        Navigator.pushNamed(context, "/amountmessage",
                            arguments: {
                              'dni': result['dni'],
                              'id': result['id']
                            });
                      },
                    );
                  },
                ),
              ),
          ],
        ),
      ),
      bottomNavigationBar: const CustomBottombarWidget(
        currentIndex: 0,
      ),
    );
  }
}
