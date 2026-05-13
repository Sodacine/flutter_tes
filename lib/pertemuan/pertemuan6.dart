import 'package:flutter/material.dart';


void main() {
  runApp(const CheckboxPage());
}

class CheckboxPage extends StatelessWidget {
  const CheckboxPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Pertemuan 6',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const Pertemuan6Page(),
    );
  }
}

class Pertemuan6Page extends StatefulWidget {
  const Pertemuan6Page({super.key});

  @override
  State<Pertemuan6Page> createState() => _Pertemuan6PageState();
}

class _Pertemuan6PageState extends State<Pertemuan6Page> {
  final TextEditingController _namaController = TextEditingController();
  final TextEditingController _nimController = TextEditingController();
  final TextEditingController _kelasController = TextEditingController();

  final Map<String, bool> _hobbies = {
    'Membaca': false,
    'Menulis': false,
    'Olahraga': false,
    'Musik': false,
    'Traveling': false,
    'Gaming': false,
  };

  bool _isCheckedSyarat = false;

  String _namaError = '';
  String _nimError = '';
  String _kelasError = '';
  String _hobbyError = '';
  String _errorText = '';

  @override
  void dispose() {
    _namaController.dispose();
    _nimController.dispose();
    _kelasController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      appBar: AppBar(
        title: const Text('Form Pendaftaran'),
        centerTitle: true,
        backgroundColor: Colors.blue.shade700,
        foregroundColor: Colors.white,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              Card(
                elevation: 8,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    gradient: LinearGradient(
                      colors: [
                        Colors.blue.shade700,
                        Colors.blue.shade400,
                      ],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                  ),
                  child: const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Icon(
                        Icons.app_registration,
                        color: Colors.white,
                        size: 42,
                      ),
                      SizedBox(height: 12),
                      Text(
                        'Formulir Pendaftaran',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 6),
                      Text(
                        'Silakan isi data diri dengan lengkap',
                        style: TextStyle(
                          color: Colors.white70,
                          fontSize: 14,
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              const SizedBox(height: 20),

              // Data diri
              Card(
                elevation: 6,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Container(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Container(
                            width: 4,
                            height: 24,
                            decoration: BoxDecoration(
                              color: Colors.blue.shade600,
                              borderRadius: BorderRadius.circular(2),
                            ),
                          ),
                          const SizedBox(width: 12),
                          Text(
                            'Data Pribadi',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.grey.shade800,
                            ),
                          ),
                        ],
                      ),

                      const SizedBox(height: 20),

                      // Field Nama
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          color: Colors.grey.shade50,
                        ),
                        child: TextField(
                          controller: _namaController,
                          decoration: InputDecoration(
                            labelText: 'Nama',
                            hintText: 'Masukkan nama lengkap',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                              borderSide: BorderSide.none,
                            ),
                            filled: true,
                            fillColor: Colors.white,
                            errorText:
                                _namaError.isNotEmpty ? _namaError : null,
                            prefixIcon: Icon(
                              Icons.person,
                              color: Colors.blue.shade600,
                            ),
                            labelStyle: TextStyle(
                              color: Colors.grey.shade700,
                            ),
                          ),
                        ),
                      ),

                      const SizedBox(height: 16),

                      // Field NIM
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          color: Colors.grey.shade50,
                        ),
                        child: TextField(
                          controller: _nimController,
                          decoration: InputDecoration(
                            labelText: 'NIM',
                            hintText: 'Masukkan NIM Anda',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                              borderSide: BorderSide.none,
                            ),
                            filled: true,
                            fillColor: Colors.white,
                            errorText: _nimError.isNotEmpty ? _nimError : null,
                            prefixIcon: Icon(
                              Icons.numbers,
                              color: Colors.blue.shade600,
                            ),
                            labelStyle: TextStyle(
                              color: Colors.grey.shade700,
                            ),
                          ),
                          keyboardType: TextInputType.number,
                        ),
                      ),

                      const SizedBox(height: 16),

                      // Field Kelas
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          color: Colors.grey.shade50,
                        ),
                        child: TextField(
                          controller: _kelasController,
                          decoration: InputDecoration(
                            labelText: 'Kelas',
                            hintText: 'Contoh: 01SIFP001',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                              borderSide: BorderSide.none,
                            ),
                            filled: true,
                            fillColor: Colors.white,
                            errorText:
                                _kelasError.isNotEmpty ? _kelasError : null,
                            prefixIcon: Icon(
                              Icons.class_,
                              color: Colors.blue.shade600,
                            ),
                            labelStyle: TextStyle(
                              color: Colors.grey.shade700,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              const SizedBox(height: 20),

              // Hobi Section
              Card(
                elevation: 8,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Container(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Container(
                            width: 4,
                            height: 24,
                            decoration: BoxDecoration(
                              color: Colors.orange.shade600,
                              borderRadius: BorderRadius.circular(2),
                            ),
                          ),
                          const SizedBox(width: 12),
                          Text(
                            'Hobi',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.grey.shade800,
                            ),
                          ),
                          const SizedBox(width: 8),
                          Text(
                            '(Pilih minimal 1)',
                            style: TextStyle(
                              fontSize: 12,
                              color: Colors.grey.shade500,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 16),
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16),
                          color: Colors.grey.shade50,
                        ),
                        child: GridView.count(
                          shrinkWrap: true,
                          crossAxisCount: 2,
                          physics: const NeverScrollableScrollPhysics(),
                          childAspectRatio: 3,
                          children: _hobbies.keys.map((hobby) {
                            return CheckboxListTile(
                              title: Text(
                                hobby,
                                style: const TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              value: _hobbies[hobby],
                              onChanged: (bool? value) {
                                setState(() {
                                  _hobbies[hobby] = value ?? false;
                                  if (_hobbies.values
                                      .any((selected) => selected)) {
                                    _hobbyError = '';
                                  }
                                });
                              },
                              activeColor: Colors.orange.shade600,
                              checkColor: Colors.white,
                              contentPadding:
                                  const EdgeInsets.symmetric(horizontal: 8),
                              dense: false,
                              controlAffinity:
                                  ListTileControlAffinity.leading,
                            );
                          }).toList(),
                        ),
                      ),
                      if (_hobbyError.isNotEmpty)
                        Padding(
                          padding: const EdgeInsets.only(left: 16, top: 8),
                          child: Row(
                            children: [
                              const Icon(
                                Icons.warning,
                                size: 16,
                                color: Colors.red,
                              ),
                              const SizedBox(width: 4),
                              Text(
                                _hobbyError,
                                style: const TextStyle(
                                  color: Colors.red,
                                  fontSize: 12,
                                ),
                              ),
                            ],
                          ),
                        ),
                    ],
                  ),
                ),
              ),

              const SizedBox(height: 20),

              // Syarat dan ketentuan
              Card(
                elevation: 4,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  child: Column(
                    children: [
                      CheckboxListTile(
                        title: const Text(
                          'Saya menyetujui syarat dan ketentuan yang berlaku',
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        value: _isCheckedSyarat,
                        onChanged: (bool? value) {
                          setState(() {
                            _isCheckedSyarat = value ?? false;
                            if (_isCheckedSyarat) {
                              _errorText = '';
                            }
                          });
                        },
                        activeColor: Colors.green,
                        checkColor: Colors.white,
                        controlAffinity: ListTileControlAffinity.leading,
                        contentPadding: EdgeInsets.zero,
                      ),
                      if (_errorText.isNotEmpty)
                        Padding(
                          padding: const EdgeInsets.only(left: 16, bottom: 8),
                          child: Row(
                            children: [
                              const Icon(
                                Icons.warning,
                                size: 16,
                                color: Colors.red,
                              ),
                              const SizedBox(width: 4),
                              Text(
                                _errorText,
                                style: const TextStyle(
                                  color: Colors.red,
                                  fontSize: 12,
                                ),
                              ),
                            ],
                          ),
                        ),
                    ],
                  ),
                ),
              ),

              const SizedBox(height: 24),

              // Submit Button
              Container(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    _validateAndSubmit(context);
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue.shade700,
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    elevation: 4,
                  ),
                  child: const Padding(
                    padding: EdgeInsets.symmetric(vertical: 14),
                    child: Text(
                      'DAFTAR SEKARANG',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 1.5,
                      ),
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 16),
            ],
          ),
        ),
      ),
    );
  }

  void _validateAndSubmit(BuildContext context) {
    setState(() {
      // Reset errors
      _namaError = '';
      _nimError = '';
      _kelasError = '';
      _hobbyError = '';
      _errorText = '';

      // Validate Nama
      if (_namaController.text.trim().isEmpty) {
        _namaError = 'Nama tidak boleh kosong';
      }

      // Validate NIM
      if (_nimController.text.trim().isEmpty) {
        _nimError = 'NIM tidak boleh kosong';
      } else if (_nimController.text.trim().length < 8) {
        _nimError = 'NIM minimal 8 karakter';
      }

      // Validate Kelas
      if (_kelasController.text.trim().isEmpty) {
        _kelasError = 'Kelas tidak boleh kosong';
      }

      // Validate Hobby (minimal 1 dipilih)
      if (!_hobbies.values.any((selected) => selected)) {
        _hobbyError = 'Pilih minimal 1 hobi';
      }

      // Validate Checkbox
      if (!_isCheckedSyarat) {
        _errorText = 'Anda harus menyetujui syarat dan ketentuan';
      }
    });

    if (_namaError.isEmpty &&
        _nimError.isEmpty &&
        _kelasError.isEmpty &&
        _hobbyError.isEmpty &&
        _errorText.isEmpty) {
      final selectedHobbies = _hobbies.entries
          .where((entry) => entry.value)
          .map((entry) => entry.key)
          .join(', ');

      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          title: const Text('Pendaftaran Berhasil'),
          content: Text(
            'Nama: ${_namaController.text}\n'
            'NIM: ${_nimController.text}\n'
            'Kelas: ${_kelasController.text}\n'
            'Hobi: $selectedHobbies',
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('OK'),
            ),
          ],
        ),
      );
    }
  }
}