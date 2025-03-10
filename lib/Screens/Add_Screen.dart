import 'package:flutter/material.dart';

class AddScreen extends StatefulWidget {
  @override
  _AddInternshipScreenState createState() => _AddInternshipScreenState();
}

class _AddInternshipScreenState extends State<AddScreen> {
  final _formKey = GlobalKey<FormState>();
  String title = '';
  String location = '';
  String Internship = 'Internship';
  String type = 'On-site';
  String duration = '';
  String whatYouWillBeDoing = '';
  String whatWeAreLookingFor = '';
  String preferredQualifications = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(20.0),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 50),
                Text(
                  "Add New Internship",
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF2252A1),
                  ),
                ),
                Text(
                  "This page allows companies to add new internship opportunities to the application, "
                      "enabling students to register for these internships.",
                  style: TextStyle(
                    fontSize: 13,
                    color: Colors.grey,
                  ),
                ),
                SizedBox(height: 20),
                buildTextField("Internship Title", Icons.work, (value) => title = value!),
                buildTextField("Location", Icons.location_on, (value) => location = value!),
                buildDropdownField("Internship", Icons.style_rounded, ["Internship"], (value) => type = value!),
                buildDropdownField("Internship Type", Icons.business, ["On-site", "Remote", "hybrid"], (value) => type = value!),
                buildTextField("Duration (e.g., 3 months)", Icons.access_time, (value) => duration = value!),
                buildTextField("What You Will Be Doing", Icons.description, (value) => whatYouWillBeDoing = value!, maxLines: 3),
                buildTextField("What We Are Looking For", Icons.description_outlined, (value) => whatWeAreLookingFor = value!, maxLines: 3),
                buildTextField("Preferred Qualifications", Icons.description, (value) => preferredQualifications = value!, maxLines: 3),
                SizedBox(height: 20),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: _submitForm,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xFF2252A1),
                      padding: EdgeInsets.symmetric(vertical: 15),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    child: Text("Submit", style: TextStyle(fontSize: 18, color: Colors.white)),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget buildTextField(String label, IconData icon, Function(String?) onSaved, {int maxLines = 1}) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12.0),
      child: TextFormField(
        decoration: InputDecoration(
          hintText: label,
          hintStyle: TextStyle(color: Colors.grey),
          prefixIcon: Icon(icon, color: Colors.blue),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: BorderSide(color: Colors.blue, width: 2),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(color: Colors.blue, width: 2),
          ),
          filled: true,
          fillColor: Colors.transparent,
        ),
        maxLines: maxLines,
        validator: (value) => value!.isEmpty ? "Enter $label" : null,
        onSaved: onSaved,
      ),
    );
  }

  Widget buildDropdownField(String label, IconData icon, List<String> options, Function(String?) onChanged) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 15.0),
      child: DropdownButtonFormField<String>(
        value: options.first,
        decoration: InputDecoration(
          hintText: label,
          hintStyle: TextStyle(color: Colors.grey),
          prefixIcon: Icon(icon, color: Colors.blue),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
            borderSide: BorderSide(color: Colors.blue, width: 2),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: BorderSide(color: Colors.blue, width: 2),
          ),
          filled: true,
          fillColor: Colors.transparent,
        ),
        items: options.map((type) {
          return DropdownMenuItem(value: type, child: Text(type));
        }).toList(),
        onChanged: onChanged,
      ),
    );
  }

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Internship Added Successfully!")),
      );
    }
  }
}
