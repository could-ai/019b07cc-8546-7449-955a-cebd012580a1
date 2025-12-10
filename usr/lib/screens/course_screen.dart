import 'package:flutter/material.dart';

class CourseScreen extends StatelessWidget {
  const CourseScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final Map<String, dynamic> course = 
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;

    return Scaffold(
      appBar: AppBar(
        title: Text(course['title']),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.all(24),
              color: Colors.grey[100],
              width: double.infinity,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    course['title'],
                    style: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Professor: ${course['professor']}',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.grey[700],
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Course Content',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 16),
                  _buildSection('General', [
                    {'icon': Icons.campaign, 'title': 'Announcements', 'type': 'forum'},
                    {'icon': Icons.description, 'title': 'Syllabus', 'type': 'pdf'},
                  ]),
                  _buildSection('Topic 1: Introduction', [
                    {'icon': Icons.slideshow, 'title': 'Lecture Slides', 'type': 'ppt'},
                    {'icon': Icons.play_circle, 'title': 'Video Lecture', 'type': 'video'},
                    {'icon': Icons.quiz, 'title': 'Quiz 1', 'type': 'quiz'},
                  ]),
                  _buildSection('Topic 2: Core Concepts', [
                    {'icon': Icons.book, 'title': 'Required Reading', 'type': 'pdf'},
                    {'icon': Icons.assignment, 'title': 'Assignment 1', 'type': 'assign'},
                  ]),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSection(String title, List<Map<String, dynamic>> items) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
          decoration: BoxDecoration(
            color: Colors.grey[200],
            borderRadius: BorderRadius.circular(4),
          ),
          child: Text(
            title,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
        ),
        const SizedBox(height: 8),
        ...items.map((item) => ListTile(
          leading: Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: _getColorForType(item['type']),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Icon(
              item['icon'] as IconData,
              color: Colors.white,
              size: 20,
            ),
          ),
          title: Text(item['title'] as String),
          trailing: const Icon(Icons.chevron_right, color: Colors.grey),
          onTap: () {},
        )),
        const SizedBox(height: 24),
      ],
    );
  }

  Color _getColorForType(String type) {
    switch (type) {
      case 'pdf': return Colors.red;
      case 'ppt': return Colors.orange;
      case 'video': return Colors.blue;
      case 'quiz': return Colors.green;
      case 'assign': return Colors.purple;
      case 'forum': return Colors.teal;
      default: return Colors.grey;
    }
  }
}
