// ============================================================
// opportunity_data.dart
// ============================================================

import 'opportunity_model.dart';

final List<Opportunity> internships = [
  Opportunity(
    title: "Junior Frontend Intern",
    company: "Stardy Tech",
    location: "Remote",
    type: "PAID INTERNSHIP",
    category: "TECH",

    description:
        "Work with the frontend team to build modern mobile and web interfaces using Flutter and React.",

    duration: "3 Months",

    stipend: "₹15,000 / month",

    skills: ["Flutter", "React", "UI Design", "Git"],

    responsibilities: [
      "Develop responsive UI",
      "Fix frontend bugs",
      "Collaborate with backend team",
      "Write clean code",
    ],
  ),

  Opportunity(
    title: "Backend Developer Intern",
    company: "TechBuild",
    location: "Remote",
    type: "PAID INTERNSHIP",
    category: "TECH",

    description: "Build APIs and backend services using Node.js and MongoDB.",

    duration: "4 Months",

    stipend: "₹18,000 / month",

    skills: ["Node.js", "MongoDB", "Express", "REST API"],

    responsibilities: [
      "Create APIs",
      "Database integration",
      "Authentication setup",
      "Debug backend issues",
    ],
  ),
];

final List<Opportunity> projects = [
  Opportunity(
    title: "AI Chatbot Project",
    company: "Stardy AI",
    location: "Remote",
    type: "PROJECT",
    category: "TECH",

    description: "Build an AI chatbot using Flutter and AI APIs.",

    duration: "1 Month",

    stipend: "₹30,000 Fixed",

    skills: ["Flutter", "AI API", "Firebase"],

    responsibilities: [
      "Build chatbot UI",
      "Connect APIs",
      "Test chatbot",
      "Deploy project",
    ],
  ),
];
