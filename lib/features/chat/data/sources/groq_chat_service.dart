import 'dart:convert';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;

class ChatMessage {
  final String role;
  final String content;
  final DateTime timestamp;

  const ChatMessage({
    required this.role,
    required this.content,
    required this.timestamp,
  });
}

class GroqChatService {
  static const String _endpoint = 'https://api.groq.com/openai/v1/chat/completions';
  static const String _model = 'llama-3.3-70b-versatile';

  static const String _systemPrompt = '''
You are JAGO, the official AI Virtual Assistant for the Ministry of Tribal Affairs (MoTA), Government of India, integrated into the Unified Scholarship Digital Public Infrastructure (Problem Statement ID 26238).
Your mission is to provide accurate, authoritative, and compassionate guidance to Scheduled Tribe (ST) students regarding central scholarships, DigiLocker credentials, and DBT disbursements.

STUDENT PROFILE CONTEXT (Current Authenticated User):
- Full Name: Ramesh Soren
- Social Category: Scheduled Tribe (ST) - Santhal Tribe
- Domicile: Dumka, Jharkhand
- Current Institute: National Institute of Technology (NIT) Jamshedpur
- Academic Program: B.Tech Computer Science & Engineering (3rd Year, Semester 5 & 6)
- Annual Family Income: ₹1,80,000 (Verified by Revenue Dept, Dumka, below ₹6.0L ceiling)
- Aadhaar / DBT Seeding: APBS active, mapped to State Bank of India (SBI *******4521)
- Active Application: "Top Class Education for ST Students" (Application ID: MOTA-2026-ST-890241)
- Sanctioned Grant: ₹84,500 (Tuition: ₹62,000 direct to NIT Jamshedpur; Maintenance/Living Stipend: ₹18,000; Books/Stationery Grant: ₹4,500)
- DBT Disbursal Status: COMPLETED. Electronic mandate executed under PFMS UTR: PFMS2026091178219082.
- DigiLocker Vault: 5 Pre-verified credentials (ST Caste Certificate JH-ST-2023-982173, Family Income Certificate JH-INC-2026-04192, NIT Jamshedpur B.Tech Enrollment, SBI Bank Account, Class 12 CBSE Marksheet).

SCHEME KNOWLEDGE BASE (5 MoTA Schemes across 3 Disconnected Portals):
1. Top Class Education for ST Students: 100% Central Sector Scheme administered via SFMP (Canara Bank). Covers full tuition, ₹3,000/month living expense, ₹5,000/year books grant, and ₹45,000 one-time computer grant in 250+ notified institutes of excellence (IITs, NITs, IIMs, AIIMS, NLUs).
2. Post-Matric Scholarship for ST Students (PMS-ST): Centrally Sponsored Scheme (75% MoTA, 25% State) via National Scholarship Portal (NSP). For Class 11 through Post-Graduate programs.
3. National Fellowship for Higher Education of ST Students (NFST): 100% Central Sector Scheme via SFMP (Canara Bank). ₹31,000 - ₹35,000/month stipend for M.Phil / Ph.D. scholars in Indian universities.
4. National Overseas Scholarship (NOS): 100% Central Sector Scheme via standalone MoTA NOS Portal. Covers full tuition, £9,900 or \$15,400 annual living allowance for Master's/Ph.D. in top 500 QS world ranked universities.
5. Pre-Matric Scholarship for ST Students: Centrally Sponsored Scheme (75:25) via NSP for Classes 9 & 10.

STATUTORY RULES & CONCURRENCY POLICY:
- Single-Scheme Rule (GFR Rule 230(1) & MoTA Policy): A student can only avail ONE scholarship/fellowship scheme at any given time. If Ramesh asks why he cannot receive PMS-ST or apply for another scheme, explain clearly that he is currently availing Top Class Education, and dual-scholarship availing is strictly prohibited by central audit and PFMS Aadhaar de-duplication.
- Unreached ST Students (UDISE+ & APAAR): The platform continuously matches school/college census data with APAAR IDs to proactively discover eligible ST students who haven't applied yet.

COMMUNICATION STYLE:
- Authoritative, clear, empathetic, and concise.
- Provide direct answers with bullet points and transaction numbers when relevant.
- Multilingual: If the student asks in Hindi, reply in Hindi. If in English, reply in English. If in Santali, support Santali.
''';

  Future<String> sendMessage({
    required String userMessage,
    required List<ChatMessage> history,
  }) async {
    final apiKey = dotenv.env['GROQ_API_KEY']?.trim() ?? '';

    if (apiKey.isEmpty) {
      return _generateOfflineFallback(userMessage);
    }

    try {
      final messages = [
        {'role': 'system', 'content': _systemPrompt},
        ...history.map((m) => {'role': m.role, 'content': m.content}),
        {'role': 'user', 'content': userMessage},
      ];

      final response = await http.post(
        Uri.parse(_endpoint),
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $apiKey',
        },
        body: jsonEncode({
          'model': _model,
          'messages': messages,
          'temperature': 0.3,
          'max_tokens': 600,
        }),
      ).timeout(const Duration(seconds: 15));

      if (response.statusCode == 200) {
        final data = jsonDecode(utf8.decode(response.bodyBytes));
        final content = data['choices']?[0]?['message']?['content'] as String?;
        if (content != null && content.trim().isNotEmpty) {
          return content.trim();
        }
      }
      return _generateOfflineFallback(userMessage);
    } catch (_) {
      return _generateOfflineFallback(userMessage);
    }
  }

  String _generateOfflineFallback(String query) {
    final q = query.toLowerCase();
    if (q.contains('pms') || q.contains('post-matric') || q.contains('apply another') || q.contains('two scholarship')) {
      return 'Under MoTA Guidelines & GFR Rule 230(1), a student can only avail ONE central scholarship scheme at a time.\n\n'
          'Since you currently have an active sanctioned grant under "Top Class Education for ST Students" (Application: MOTA-2026-ST-890241, Sanctioned: ₹84,500), '
          'PFMS and Aadhaar de-duplication will automatically reject concurrent PMS-ST applications. If you wish to switch schemes, a formal migration request must be lodged with your District Welfare Officer.';
    }

    if (q.contains('pfms') || q.contains('stipend') || q.contains('money') || q.contains('disburs') || q.contains('utr') || q.contains('84,500') || q.contains('payment')) {
      return 'Your scholarship grant of ₹84,500 for Academic Year 2026-2027 (Semesters 5 & 6) has been fully disbursed via DBT:\n\n'
          '• Credit Account: State Bank of India (*******4521)\n'
          '• PFMS Electronic Mandate UTR: PFMS2026091178219082\n'
          '• Disbursal Breakdown: Tuition ₹62,000 (direct to NIT JSR), Living Allowance ₹18,000, Book Grant ₹4,500.\n\n'
          'Your Aadhaar is verified and mapped to APBS.';
    }

    if (q.contains('nfst') || q.contains('fellowship') || q.contains('phd') || q.contains('research')) {
      return 'National Fellowship for Higher Education of ST Students (NFST) is a 100% Central Sector Scheme via SFMP (Canara Bank).\n\n'
          '• Eligibility: ST students pursuing regular full-time M.Phil or Ph.D. degrees.\n'
          '• Benefits: ₹31,000/month (JRF) or ₹35,000/month (SRF) + contingency allowance.\n'
          '• Your Status: You are currently enrolled in B.Tech at NIT Jamshedpur. You will become eligible upon admission into a postgraduate research program.';
    }

    if (q.contains('digilocker') || q.contains('document') || q.contains('certificate') || q.contains('caste') || q.contains('income')) {
      return 'Your DigiLocker Credential Vault is fully synchronized:\n\n'
          '1. ST Caste Certificate (JH-ST-2023-982173) - Santhal Tribe (Permanent)\n'
          '2. Family Income Certificate (JH-INC-2026-04192) - ₹1,80,000 / annum\n'
          '3. NIT Jamshedpur Enrollment & Fee Structure\n'
          '4. Aadhaar / APBS Bank Seeding (SBI *******4521)\n\n'
          'All documents are cryptographically signed. Zero physical scans or re-uploads are required for MoTA applications.';
    }

    return 'Welcome Ramesh Soren. I am JAGO, your MoTA Unified Scholarship AI Assistant.\n\n'
        'You are currently enrolled in Top Class Education for ST Students at NIT Jamshedpur with ₹84,500 successfully disbursed under PFMS UTR: PFMS2026091178219082.\n\n'
        'You can ask me about:\n'
        '• Disbursal timeline and UTR status\n'
        '• Why single-scheme concurrency applies to PMS-ST\n'
        '• DigiLocker certificate verification\n'
        '• Eligibility for NFST Fellowship or Overseas Scholarship (NOS)';
  }
}
