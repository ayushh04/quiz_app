class QuestionModal {
  final String question;
  final List<String> options;
  final int correctAnswerIndex;

  const QuestionModal({
    required this.correctAnswerIndex,
    required this.question,
    required this.options,
  });
}

const List<QuestionModal> question = [
  QuestionModal(
    question: '1. Which planet is known as the Red Planet?',
    correctAnswerIndex: 1,
    options: [
      'A) Earth',
      'B) Mars',
      'C) Jupiter',
      'D) Saturn',
    ],
  ),
  QuestionModal(
    question: '2. What is the capital of France?',
    correctAnswerIndex: 2,
    options: [
      'A) Rome',
      'B) Berlin',
      'C) Paris',
      'D) Madrid',
    ],
  ),
  QuestionModal(
    question: '3. Who wrote the play "Romeo and Juliet"?',
    correctAnswerIndex: 1,
    options: [
      'A) Charles Dickens',
      'B) William Shakespeare',
      'C) Mark Twain',
      'D) J.K. Rowling',
    ],
  ),
  QuestionModal(
    question: '4. What is the largest ocean on Earth?',
    correctAnswerIndex: 3,
    options: [
      'A) Atlantic Ocean',
      'B) Indian Ocean',
      'C) Arctic Ocean',
      'D) Pacific Ocean',
    ],
  ),
  QuestionModal(
    question: '5. In which year did the Titanic sink?',
    correctAnswerIndex: 0,
    options: [
      'A) 1912',
      'B) 1914',
      'C) 1918',
      'D) 1920',
    ],
  ),
  QuestionModal(
    question: '6. Which element has the chemical symbol "O"?',
    correctAnswerIndex: 1,
    options: [
      'A) Gold',
      'B) Oxygen',
      'C) Osmium',
      'D) Oganesson',
    ],
  ),
  QuestionModal(
    question: '7. What is the capital of Japan?',
    correctAnswerIndex: 2,
    options: [
      'A) Beijing',
      'B) Seoul',
      'C) Tokyo',
      'D) Bangkok',
    ],
  ),
  QuestionModal(
    question: '8. Which animal is known as the King of the Jungle?',
    correctAnswerIndex: 2,
    options: [
      'A) Tiger',
      'B) Elephant',
      'C) Lion',
      'D) Bear',
    ],
  ),
  QuestionModal(
    question: '9. What is the largest continent by land area?',
    correctAnswerIndex: 1,
    options: [
      'A) Africa',
      'B) Asia',
      'C) North America',
      'D) Europe',
    ],
  ),
  QuestionModal(
    question:
        '10. Which famous scientist developed the theory of general relativity?',
    correctAnswerIndex: 1,
    options: [
      'A) Isaac Newton',
      'B) Albert Einstein',
      'C) Galileo Galilei',
      'D) Nikola Tesla',
    ],
  ),
];
