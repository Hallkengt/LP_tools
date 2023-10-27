import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(const MaterialApp(
    home: ThesaurusScreen(),
  ));
}

class ThesaurusScreen extends StatefulWidget {
  const ThesaurusScreen({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _ThesaurusScreenState createState() => _ThesaurusScreenState();
}

class _ThesaurusScreenState extends State<ThesaurusScreen> {
  String _inputWord = '';
  List<String> _synonyms = [];
  List<String> _antonyms = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sinónimos y Antónimos'),
        backgroundColor: Colors.black,
      ),
      backgroundColor: Colors.blueGrey,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            TextField(
              onChanged: (text) {
                setState(() {
                  _inputWord = text;
                });
              },
              decoration: const InputDecoration(
                hintText: 'Ingrese una palabra',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () {
                _getThesaurusData(_inputWord);
              },
              child: const Text('Obtener Sinónimos y Antónimos'),
            ),
            if (_synonyms.isNotEmpty || _antonyms.isNotEmpty)
              const Padding(
                padding: EdgeInsets.only(top: 16.0),
                child: Text(
                  'Resultados:',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            if (_synonyms.isNotEmpty)
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Sinónimos:',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  for (final synonym in _synonyms)
                    Text(synonym),
                ],
              ),
            if (_antonyms.isNotEmpty)
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Antónimos:',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  for (final antonym in _antonyms)
                    Text(antonym),
                ],
              ),
          ],
        ),
      ),
    );
  }

  Future<void> _getThesaurusData(String word) async {
    if (word.isEmpty) {
      return;
    }

    final response = await http.get(
        Uri.parse('https://api.datamuse.com/words?rel_syn=$word&rel_ant=$word'));

    if (response.statusCode == 200) {
      final data = json.decode(response.body) as List;
      final synonyms = data
          .where((entry) => entry['score'] >= 200) // Filter synonyms based on a score threshold
          .map((entry) => entry['word'].toString())
          .toList();
      final antonyms = data
          .where((entry) => entry['score'] <= -200) // Filter antonyms based on a score threshold
          .map((entry) => entry['word'].toString())
          .toList();

      setState(() {
        _synonyms = synonyms;
        _antonyms = antonyms;
      });
    } else {
      // ignore: avoid_print
      print('Error al obtener sinónimos y antónimos');
    }
  }
}
