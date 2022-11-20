import 'package:quizup/models/question_model.dart';

List<QuestionModel> questions = [
  QuestionModel("Prefix notation is alsow known as", {
    "Reverse polish notation" : false,
    "Reverse Notation" : false,
    "Polish Reverse Notation" : false,
    "Polish Notation" : true
  }),

  QuestionModel("Queue data structure works on", {
    "LIFO" : false,
    "FIFO" : true,
    "LILO" :false,
    "FILO" : false,
  }),
  QuestionModel("Quick sort algorithm is an example of", {
    "Greedy approach" : false,
    "Improved binary search" : false,
    "Dynamic Programming" : false,
    "Divide and Conquer" : true,
  }),
  QuestionModel("Minimum number of spanning tree in a connected graph is",{
    "n" : false,
    "n^n - 1" : false,
    "1": true,
    "0" : false,
  }),
  QuestionModel("Graph traversal is different from a tree traversal, because", {
    "trees are not connected." : false,
    "graphs may have loops." : false,
    "C - trees have root." : true,
    "None is true as tree is a subset of graph." : false,
  }),
  QuestionModel("Time required to merge two sorted lists of size m and n, is", {
    "Ο(m | n)" : false,
    "Ο(m + n)" : true,
    "O(m log n)" : false,
    "Ο(n log m)" : false,
  }),
];