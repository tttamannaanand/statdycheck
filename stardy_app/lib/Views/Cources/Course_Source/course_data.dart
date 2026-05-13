import 'courseModel.dart';

final List<Course> courses = [
  /// ---------------- BEGINNER ----------------
  Course(
    title: "Mastering Python",
    image: "assets/images/stardy-logo.png",
    rating: 5.0,
    progress: 0.65,
    category: "Beginner",
    uploadDate: "Feb 10, 2026",
    duration: "8h 30m",
    description: "Learn Python from basics to advanced including OOP.",
    chapters: [
      Chapter(
        title: "Python Basics",
        topics: [
          Topic(
            title: "What is Python?",
            videoUrl: "https://youtu.be/kqtD5dpn9C8",
          ),
          Topic(
            title: "Variables & Data Types",
            videoUrl: "https://youtu.be/ohCDWZgNIU0",
          ),
        ],
      ),
    ],
  ),

  Course(
    title: "HTML & CSS Bootcamp",
    image: "assets/images/stardy-logo.png",
    rating: 4.7,
    progress: 0.40,
    category: "Beginner",
    uploadDate: "Jan 5, 2026",
    duration: "6h 10m",
    description: "Build beautiful websites using HTML & CSS.",
    chapters: [
      Chapter(
        title: "HTML Basics",
        topics: [
          Topic(
            title: "Tags & Elements",
            videoUrl: "https://youtu.be/UB1O30fR-EE",
          ),
        ],
      ),
    ],
  ),

  Course(
    title: "Java Programming Basics",
    image: "assets/images/stardy-logo.png",
    rating: 4.6,
    progress: 0.20,
    category: "Beginner",
    uploadDate: "Dec 12, 2025",
    duration: "7h 00m",
    description: "Learn core Java fundamentals.",
    chapters: [
      Chapter(
        title: "Java Intro",
        topics: [
          Topic(title: "JVM & JDK", videoUrl: "https://youtu.be/eIrMbAQSU34"),
        ],
      ),
    ],
  ),

  Course(
    title: "SQL for Beginners",
    image: "assets/images/stardy-logo.png",
    rating: 4.9,
    progress: 0.75,
    category: "Beginner",
    uploadDate: "Jan 20, 2026",
    duration: "5h 30m",
    description: "Master SQL queries and databases.",
    chapters: [
      Chapter(
        title: "SQL Basics",
        topics: [
          Topic(
            title: "SELECT Statement",
            videoUrl: "https://youtu.be/27axs9dO7AE",
          ),
        ],
      ),
    ],
  ),

  Course(
    title: "Git & GitHub Crash Course",
    image: "assets/images/stardy-logo.png",
    rating: 4.8,
    progress: 0.60,
    category: "Beginner",
    uploadDate: "Feb 1, 2026",
    duration: "4h 20m",
    description: "Version control with Git and GitHub.",
    chapters: [
      Chapter(
        title: "Git Basics",
        topics: [
          Topic(
            title: "Commits & Branches",
            videoUrl: "https://youtu.be/RGOj5yH7evk",
          ),
        ],
      ),
    ],
  ),

  /// ---------------- INTERMEDIATE ----------------
  Course(
    title: "Flutter UI Design",
    image: "assets/images/stardy-logo.png",
    rating: 4.8,
    progress: 0.30,
    category: "Intermediate",
    uploadDate: "Jan 28, 2026",
    duration: "6h 15m",
    description: "Build responsive Flutter UIs.",
    chapters: [
      Chapter(
        title: "Widgets Deep Dive",
        topics: [
          Topic(title: "Layouts", videoUrl: "https://youtu.be/x0uinJvhNxI"),
        ],
      ),
    ],
  ),

  Course(
    title: "ReactJS Complete Guide",
    image: "assets/images/stardy-logo.png",
    rating: 4.9,
    progress: 0.50,
    category: "Intermediate",
    uploadDate: "Feb 3, 2026",
    duration: "10h 00m",
    description: "Master ReactJS from scratch.",
    chapters: [
      Chapter(
        title: "Hooks",
        topics: [
          Topic(
            title: "useState & useEffect",
            videoUrl: "https://youtu.be/O6P86uwfdR0",
          ),
        ],
      ),
    ],
  ),

  Course(
    title: "NodeJS Backend Development",
    image: "assets/images/stardy-logo.png",
    rating: 4.7,
    progress: 0.35,
    category: "Intermediate",
    uploadDate: "Feb 15, 2026",
    duration: "8h 45m",
    description: "Build scalable backend APIs.",
    chapters: [
      Chapter(
        title: "Express Basics",
        topics: [
          Topic(title: "Routing", videoUrl: "https://youtu.be/L72fhGm1tfE"),
        ],
      ),
    ],
  ),

  Course(
    title: "Data Structures in Java",
    image: "assets/images/stardy-logo.png",
    rating: 4.6,
    progress: 0.25,
    category: "Intermediate",
    uploadDate: "Jan 10, 2026",
    duration: "9h 20m",
    description: "Master arrays, stacks, queues & trees.",
    chapters: [
      Chapter(
        title: "Arrays & LinkedList",
        topics: [
          Topic(
            title: "Array Implementation",
            videoUrl: "https://youtu.be/bum_19loj9A",
          ),
        ],
      ),
    ],
  ),

  Course(
    title: "UI/UX Design Principles",
    image: "assets/images/stardy-logo.png",
    rating: 4.8,
    progress: 0.45,
    category: "Intermediate",
    uploadDate: "Jan 22, 2026",
    duration: "5h 50m",
    description: "Design modern user experiences.",
    chapters: [
      Chapter(
        title: "Design Basics",
        topics: [
          Topic(
            title: "Color Theory",
            videoUrl: "https://youtu.be/AvgCkHrcj90",
          ),
        ],
      ),
    ],
  ),

  /// ---------------- ADVANCED ----------------
  Course(
    title: "Machine Learning Mastery",
    image: "assets/images/stardy-logo.png",
    rating: 5.0,
    progress: 0.10,
    category: "Advanced",
    uploadDate: "Feb 18, 2026",
    duration: "12h 30m",
    description: "Build ML models from scratch.",
    chapters: [
      Chapter(
        title: "Supervised Learning",
        topics: [
          Topic(
            title: "Linear Regression",
            videoUrl: "https://youtu.be/nk2CQITm_eo",
          ),
        ],
      ),
    ],
  ),

  Course(
    title: "Deep Learning with TensorFlow",
    image: "assets/images/stardy-logo.png",
    rating: 4.9,
    progress: 0.05,
    category: "Advanced",
    uploadDate: "Feb 20, 2026",
    duration: "14h 00m",
    description: "Neural networks & CNNs.",
    chapters: [
      Chapter(
        title: "Neural Networks",
        topics: [
          Topic(
            title: "Backpropagation",
            videoUrl: "https://youtu.be/aircAruvnKk",
          ),
        ],
      ),
    ],
  ),

  Course(
    title: "System Design Interview",
    image: "assets/images/stardy-logo.png",
    rating: 4.8,
    progress: 0.15,
    category: "Advanced",
    uploadDate: "Feb 12, 2026",
    duration: "11h 40m",
    description: "Crack FAANG interviews.",
    chapters: [
      Chapter(
        title: "Scalability",
        topics: [
          Topic(
            title: "Load Balancing",
            videoUrl: "https://youtu.be/UzLMhqg3_Wc",
          ),
        ],
      ),
    ],
  ),

  Course(
    title: "Advanced Flutter Architecture",
    image: "assets/images/stardy-logo.png",
    rating: 4.7,
    progress: 0.22,
    category: "Advanced",
    uploadDate: "Jan 30, 2026",
    duration: "9h 10m",
    description: "Bloc, Riverpod & Clean Architecture.",
    chapters: [
      Chapter(
        title: "State Management",
        topics: [
          Topic(
            title: "Bloc Pattern",
            videoUrl: "https://youtu.be/THCkkQ-V1-8",
          ),
        ],
      ),
    ],
  ),

  Course(
    title: "Cloud Computing with AWS",
    image: "assets/images/stardy-logo.png",
    rating: 4.9,
    progress: 0.33,
    category: "Advanced",
    uploadDate: "Feb 8, 2026",
    duration: "10h 50m",
    description: "Deploy scalable cloud apps.",
    chapters: [
      Chapter(
        title: "EC2 & S3",
        topics: [
          Topic(title: "AWS Basics", videoUrl: "https://youtu.be/ulprqHHWlng"),
        ],
      ),
    ],
  ),
];
