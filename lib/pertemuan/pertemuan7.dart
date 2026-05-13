import 'package:flutter/material.dart';

class RadioButtonPage extends StatefulWidget {
  const RadioButtonPage({super.key});

  @override
  State<RadioButtonPage> createState() => _RadioButtonPageState();
}

class _RadioButtonPageState extends State<RadioButtonPage> {
  final _formKey = GlobalKey<FormState>();

  final namaController = TextEditingController();
  final umurController = TextEditingController();

  String? gender;
  String? pekerjaan;
  String? tipeKerja;

  bool focusNama = false;
  bool focusUmur = false;

  final List<Map<String, dynamic>> jobList = [
    {"title": "Programmer", "icon": Icons.code, "color": Colors.green},
    {"title": "Designer", "icon": Icons.design_services, "color": Colors.purple},
    {"title": "Guru", "icon": Icons.school, "color": Colors.orange},
    {"title": "Admin", "icon": Icons.admin_panel_settings, "color": Colors.blue},
  ];

  final List<Map<String, dynamic>> tipeList = [
    {"title": "Full Time", "icon": Icons.work, "color": Colors.teal},
    {"title": "Part Time", "icon": Icons.access_time, "color": Colors.amber},
    {"title": "Freelance", "icon": Icons.laptop, "color": Colors.deepPurple},
    {"title": "Kontrak", "icon": Icons.assignment, "color": Colors.red},
  ];

  void submit() {
    if (_formKey.currentState!.validate() &&
        gender != null &&
        pekerjaan != null &&
        tipeKerja != null) {
      showDialog(
        context: context,
        builder: (_) => Dialog(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Icon(Icons.check_circle,
                    color: Colors.teal, size: 60),
                const SizedBox(height: 10),
                const Text(
                  "DATA BERHASIL",
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.teal),
                ),
                const SizedBox(height: 20),

                resultCard(Icons.person, "Nama", namaController.text),
                resultCard(Icons.cake, "Umur", umurController.text),
                resultCard(Icons.people, "Gender", gender!),
                resultCard(Icons.work, "Pekerjaan", pekerjaan!),
                resultCard(Icons.badge, "Tipe Kerja", tipeKerja!),

                const SizedBox(height: 12),
                ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                    reset();
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.teal,
                  ),
                  child: const Text("OK"),
                )
              ],
            ),
          ),
        ),
      );
    }
  }

  Widget resultCard(IconData icon, String label, String value) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 6),
      child: ListTile(
        leading: Icon(icon, color: Colors.teal),
        title: Text(label),
        subtitle: Text(value),
      ),
    );
  }

  void reset() {
    namaController.clear();
    umurController.clear();
    setState(() {
      gender = null;
      pekerjaan = null;
      tipeKerja = null;
    });
  }

  Widget inputCard({
    required IconData icon,
    required String title,
    required Widget child,
  }) {
    return Card(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(18)),
      elevation: 4,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Row(
              children: [
                CircleAvatar(
                  backgroundColor: Colors.teal.withOpacity(0.1),
                  child: Icon(icon, color: Colors.teal),
                ),
                const SizedBox(width: 10),
                Text(title,
                    style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 15)),
              ],
            ),
            const SizedBox(height: 12),
            child
          ],
        ),
      ),
    );
  }

  Widget animatedInput({
    required TextEditingController controller,
    required String hint,
    required bool isFocus,
    required Function(bool) onFocus,
    IconData? icon,
  }) {
    return Focus(
      onFocusChange: onFocus,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 250),
        child: TextFormField(
          controller: controller,
          decoration: InputDecoration(
            hintText: hint,
            prefixIcon: icon != null ? Icon(icon) : null,
            filled: true,
            fillColor: Colors.white,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(14),
            ),
          ),
          validator: (v) =>
              v!.isEmpty ? "Tidak boleh kosong" : null,
        ),
      ),
    );
  }

  Widget genderCard(String text, IconData icon, Color color) {
    final selected = gender == text;

    return Expanded(
      child: GestureDetector(
        onTap: () => setState(() => gender = text),
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          padding: const EdgeInsets.all(14),
          decoration: BoxDecoration(
            color: selected ? color : Colors.white,
            borderRadius: BorderRadius.circular(14),
            border: Border.all(color: color),
          ),
          child: Column(
            children: [
              Icon(icon,
                  color: selected ? Colors.white : color),
              const SizedBox(height: 5),
              Text(text,
                  style: TextStyle(
                      color:
                          selected ? Colors.white : color))
            ],
          ),
        ),
      ),
    );
  }

  Widget radioCard(List<Map<String, dynamic>> list,
      String? groupValue, Function(String) onChanged) {
    return Column(
      children: list.map((item) {
        final selected = groupValue == item['title'];

        return Padding(
          padding: const EdgeInsets.only(bottom: 10),
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 300),
            decoration: BoxDecoration(
              color: selected
                  ? (item['color'] as Color).withOpacity(0.15)
                  : Colors.white,
              borderRadius: BorderRadius.circular(16),
              border: Border.all(
                color: selected
                    ? item['color']
                    : Colors.grey.shade300,
                width: 2,
              ),
            ),
            child: RadioListTile(
              value: item['title'],
              groupValue: groupValue,
              activeColor: item['color'],
              onChanged: (value) =>
                  onChanged(value.toString()),
              secondary: CircleAvatar(
                backgroundColor:
                    (item['color'] as Color).withOpacity(0.15),
                child: Icon(item['icon'],
                    color: item['color']),
              ),
              title: Text(item['title']),
            ),
          ),
        );
      }).toList(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Pertemuan 7"),
        backgroundColor: Colors.teal,
      ),
      backgroundColor: Colors.grey[100],
      body: Form(
        key: _formKey,
        child: ListView(
          padding: const EdgeInsets.all(16),
          children: [
            inputCard(
              icon: Icons.person,
              title: "Nama",
              child: animatedInput(
                controller: namaController,
                hint: "Masukkan nama",
                isFocus: focusNama,
                onFocus: (v) => setState(() => focusNama = v),
              ),
            ),

            const SizedBox(height: 12),

            inputCard(
              icon: Icons.cake,
              title: "Umur",
              child: animatedInput(
                controller: umurController,
                hint: "Masukkan umur",
                icon: Icons.numbers,
                isFocus: focusUmur,
                onFocus: (v) => setState(() => focusUmur = v),
              ),
            ),

            const SizedBox(height: 12),

            inputCard(
              icon: Icons.people,
              title: "Jenis Kelamin",
              child: Row(
                children: [
                  genderCard("Laki-laki", Icons.male, Colors.blue),
                  const SizedBox(width: 10),
                  genderCard("Perempuan", Icons.female, Colors.pink),
                ],
              ),
            ),

            const SizedBox(height: 12),

            inputCard(
              icon: Icons.work,
              title: "Pekerjaan",
              child: radioCard(jobList, pekerjaan,
                  (value) => setState(() => pekerjaan = value)),
            ),

            const SizedBox(height: 12),

            inputCard(
              icon: Icons.badge,
              title: "Tipe Pekerjaan",
              child: radioCard(tipeList, tipeKerja,
                  (value) => setState(() => tipeKerja = value)),
            ),

            const SizedBox(height: 20),

            ElevatedButton(
              onPressed: submit,
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.teal,
                padding:
                    const EdgeInsets.symmetric(vertical: 14),
              ),
              child: const Text("Submit"),
            ),

            const SizedBox(height: 10),

            OutlinedButton(
              onPressed: reset,
              child: const Text("Reset"),
            )
          ],
        ),
      ),
    );
  }
}