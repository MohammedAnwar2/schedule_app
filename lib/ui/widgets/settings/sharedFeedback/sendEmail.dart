import 'dart:convert';

import 'package:http/http.dart' as http;

Future sendEmail({
  required String userProblem,
  required String message,
  required String type_of_problem,
  required String new_message_from,
  required String hello_company,
}) async {
  final serviceId = 'service_vug16nj';
  final templateId = 'template_hb9aegq';
  final userId = 'hU_sJtQP6fM9KQ92R';
  final url = Uri.parse("https://api.emailjs.com/api/v1.0/email/send");
  final response = await http.post(url,
      headers: {
        'origin': 'http://localhost',
        'Content-Type': 'application/json'
      },
      body: json.encode({
        'service_id': serviceId,
        'template_id': templateId,
        'user_id': userId,
        'template_params': {
          'user_problem': userProblem,
          'user_message': message,
          'type_of_problem': type_of_problem,
          'new_message_from': new_message_from,
          'hello_company': hello_company
        }
      }));
  print(response.body);
}

// Future sendEmail({
//   required String name,
//   required String email,
//   required String subject,
//   required String message,
// }) async {
//   final serviceId = 'service_vug16nj';
//   final templateId = 'template_hb9aegq';
//   final userId = 'hU_sJtQP6fM9KQ92R';
//   final url = Uri.parse("https://api.emailjs.com/api/v1.0/email/send");
//   final response = await http.post(url,
//       headers: {
//         'origin': 'http://localhost',
//         'Content-Type': 'application/json'
//       },
//       body: json.encode({
//         'service_id': serviceId,
//         'template_id': templateId,
//         'user_id': userId,
//         'template_params': {
//           'user_name': name,
//           'user_email': email,
//           'user_subject': subject,
//           'user_message': message,
//         }
//       }));
//   print(response.body);
// }
//