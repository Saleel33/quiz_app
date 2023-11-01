import 'package:quiz_app_flutter/model/quizmodel.dart';

List<Quiz> general_questions = [
  Quiz(
      question: "what is the captial of america?",
      options: ['Los Angeles', 'whashington', 'paris', 'new york'],
      indexOfAnswer: 1),
  Quiz(
      question: "What is the largest planet in our solar system?",
      options: ['Jupiter', 'Mars', 'Earth', 'Venus'],
      indexOfAnswer: 0),
  Quiz(
    question:
        "Which famous scientist is best known for his theory of relativity, E=mc^2?",
    options: [
      ' Isaac Newton',
      'Galileo Galilei',
      'Albert Einstein',
      'Stephen Hawking'
    ],
    indexOfAnswer: 2,
  ),
  Quiz(
      question: "Which country is known as the Land Down Under?",
      options: ['Canada', 'Australia', 'Brazil', 'India'],
      indexOfAnswer: 1),
  Quiz(
      question: "What is the chemical symbol for gold?",
      options: ['Go', 'Ag', 'Ge', 'Au'],
      indexOfAnswer: 3),
];

List<Quiz> science_questions = [
  Quiz(
      question: "What is the Earth's largest organ?",
      options: ['Brain', ' Heart', 'Liver', 'Skin'],
      indexOfAnswer: 3),
  Quiz(
      question: 'What is the smallest unit of matter?',
      options: ['Atom', 'Nucleon', 'Molecule', 'Neutron'],
      indexOfAnswer: 0),
  Quiz(
      question: 'What is the chemical symbol for iron?',
      options: ['Ir', 'Fe', 'In', 'Au'],
      indexOfAnswer: 1),
  Quiz(
      question:
          'What is the force that opposes motion between two surfaces in contact?',
      options: ['Friction', 'Tension', 'Normal Force', 'Weight'],
      indexOfAnswer: 0),
  Quiz(
      question:
          'What is the process by which a cell engulfs a solid particle to form an internal vesicle known as a phagosome?',
      options: ['Endocytosis', 'Exocytosis', 'Pinocytosis', 'Phagocytosis'],
      indexOfAnswer: 3),
];
List<Quiz> technology_questions = [
  Quiz(
      question: "Who invented the first computer?",
      options: [
        'Charles Babbage',
        ' Ada Lovelace',
        'John Atanasoff',
        'Eugene Wigner'
      ],
      indexOfAnswer: 0),
  Quiz(
      question: "In computer programming, what does the term 'API' stand for?",
      options: [
        'Advanced Program Interface',
        'Automated Processing Instruction',
        ' Application Programming Interface',
        'Advanced Protocol Integration'
      ],
      indexOfAnswer: 2),
  Quiz(
      question:
          'Which encryption method is widely used to secure internet communication?',
      options: [
        ' AES (Advanced Encryption Standard)',
        'RSA (Rivest Shamir Adleman)',
        'DES (Data Encryption Standard)',
        'TLS (Transport Layer Security)'
      ],
      indexOfAnswer: 3),
  Quiz(
      question:
          ' What technology is the basis for blockchain and cryptocurrency systems like Bitcoin?',
      options: [
        ' Artificial Intelligence',
        'Quantum Computing',
        'Distributed Ledger',
        'Virtual Reality'
      ],
      indexOfAnswer: 2),
  Quiz(
      question: 'What is the purpose of a "CAPTCHA"?',
      options: [
        'Image Editing',
        'User Authentication',
        'Data Encryption',
        'Spam Prevention'
      ],
      indexOfAnswer: 3),
];

List<Quiz> history_questions = [
  Quiz(
      question:
          ' What ancient civilization is credited with the invention of the first written language?',
      options: ['Egyptians', 'Sumerians', 'Greeks', 'Romans'],
      indexOfAnswer: 1),
  Quiz(
      question:
          'Who was the first Emperor of China, known for the construction of the Great Wall?',
      options: ['Qin Shi Huang', 'Huang Di', 'Mao Zedong', 'Wen Dai'],
      indexOfAnswer: 0),
  Quiz(
      question: 'What event marked the beginning of World War I in 1914?',
      options: [
        'Assassination of Archduke Franz Ferdinand',
        'Outbreak of WWI',
        'Armistice Day',
        'Declaration of Independence'
      ],
      indexOfAnswer: 0),
  Quiz(
      question:
          'Which ancient city was destroyed and preserved by the eruption of Mount Vesuvius in 79 AD?',
      options: [' Athens', ' Rome', ' Pompeii', 'Alexandria'],
      indexOfAnswer: 2),
  Quiz(
      question:
          'Who was the first woman to win a Nobel Prize, recognized for her work in physics in 1903?',
      options: ['Marie Curie', 'Emmy Noether', 'Lise Meitner', 'Physics'],
      indexOfAnswer: 0),
];

final List<String> images = [
  'assets/images/general-knowledge.png',
  'assets/images/learning.png',
  'assets/images/science.png',
  'assets/images/history.png',
];

final List<String> names = [
  'General Knowledge',
  'Technology',
  'Science',
  'History',
];

List<String> marks = [];
