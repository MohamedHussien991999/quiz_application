class Question {
  final int id;
  final String question;
  final List<String> options;
  String selectedAns = '';
  String correctAns = '';
  bool isAnswered = false;

  Question({
    required this.id,
    required this.question,
    required this.correctAns,
    required this.options,
    required this.selectedAns,
  });
}

List<Question> questionsList = [
  Question(
      id: 1,
      question:
          "What programming language is primarily used for Flutter development?",
      options: ['a) Java', 'b) Swift', 'c) C++', 'd) Dart'],
      correctAns: 'd) Dart',
      selectedAns: '0' // Index of the correct answer in the options list
      ),
  Question(
      id: 2,
      question:
          "Which of the following is used to style and layout widgets in Flutter?",
      options: ['a) CSS', 'b) FlexBox', 'c) ThemeData', 'd) Widgets'],
      correctAns:
          'c) ThemeData', // Index of the correct answer in the options list
      selectedAns: '0'),
  Question(
      id: 3,
      question:
          "In Flutter, which widget is used to display a single box with a specified size and child?",
      options: ['a) Container', 'b) BoxWidget', 'c) Frame', 'd) ViewBox'],
      correctAns:
          'a) Container', // Index of the correct answer in the options list
      selectedAns: '0'),
  Question(
      id: 4,
      question:
          "What's the core principle behind the \"hot reload\" feature in Flutter?",
      options: [
        'a) It prevents your device from overheating.',
        'b) It reloads the entire app from scratch.',
        'c) It quickly updates the code changes without losing the app\'s state.',
        'd) It compiles the app to native code.'
      ],
      correctAns:
          'c) It quickly updates the code changes without losing the app\'s state.', // Index of the correct answer in the options list
      selectedAns: '0'),
  Question(
      id: 5,
      question:
          "Which widget is used to create a scrollable list of children with lazy loading?",
      options: [
        'a) ListView',
        'b) ScrollableList',
        'c) LazyList',
        'd) ListScrollView'
      ],
      correctAns:
          'a) ListView', // Index of the correct answer in the options list
      selectedAns: '0'),
  Question(
      id: 6,
      question: "What's the purpose of the \"BuildContext\" in Flutter?",
      options: [
        'a) It defines the build process of widgets.',
        'b) It represents the current state of a widget.',
        'c) It provides a reference to the parent widget.',
        'd) It\'s used to create instances of widgets.'
      ],
      correctAns:
          'c) It provides a reference to the parent widget.', // Index of the correct answer in the options list
      selectedAns: '0'),
  Question(
      id: 7,
      question:
          "Which widget in Flutter is used to display images from the internet with caching and error handling?",
      options: [
        'a) ImageWidget',
        'b) RemoteImage',
        'c) NetworkImage',
        'd) WebImage'
      ],
      correctAns:
          'c) NetworkImage', // Index of the correct answer in the options list
      selectedAns: '0'),
  Question(
      id: 8,
      question:
          "In Flutter, which function is called to create and configure the widgets for a screen?",
      options: [
        'a) initWidgets()',
        'b) createWidgets()',
        'c) build()',
        'd)  configure()'
      ],
      correctAns:
          'c) build()', // Index of the correct answer in the options list
      selectedAns: '0'),
  Question(
      id: 9,
      question:
          " What's the purpose of the \"main()\" function in a Flutter app?",
      options: [
        'a) It\'s the entry point of the app and where execution starts.',
        'b) It defines the main layout of the app.',
        'c) It handles all user interactions.',
        'd) It\'s responsible for managing the app\'s state.'
      ],
      correctAns:
          'a) It\'s the entry point of the app and where execution starts.', // Index of the correct answer in the options list
      selectedAns: '0'),
  Question(
      id: 10,
      question:
          "In Flutter, which function is called to create and configure the widgets for a screen?",
      options: [
        'a) Singleton',
        'b) MVC (Model-View-Controller)',
        'c) Redux',
        'd) Observer'
      ],
      correctAns: 'c) Redux', // Index of the correct answer in the options list
      selectedAns: '0'),
];
