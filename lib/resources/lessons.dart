import 'package:master_html/resources/models/lesson_model.dart';

const Map<String, List<LessonModel>> allLessons = {
  //First lesson
  "HTML Introduction": <LessonModel>[
    LessonModel(
        header: "What is HTML?",
        article: <String>[
          "HTML stands for Hyper Text Markup Language, it is the backbone of web development.",
          "It is a simple, easy-to-learn language that describes the structure of web pages and tells the browser how to display the content.",
        ],
        codeExample: "null",
        outPutExample: "null",
        fact: "null",
        update: "null",
        note: "null",
        warning: "null"),
    LessonModel(
        header: "What's the difference between HTML and HTML5?",
        article: <String>[
          "HTML5 is the fifth and current version of HTML.",
          "HTML5 introduced a lot of new features and improvements on top of it's previous version and it offers a lot of functionality for building websites.",
          "HTML5 was released in 2014 and has been the standard version of web since and it is what we will learn in the following lessons!",
          "Let's see an example of simple HTML code below.",
        ],
        codeExample: "null",
        outPutExample: "null",
        fact: "null",
        update: "null",
        note: "null",
        warning: "null"),

        // <!-- <meta name="viewport" content="width=device-width, initial-scale=1">  -->
LessonModel(
        header: "HTML Code Example -",
        article: <String>["null"],
        codeExample: '''<!DOCTYPE html>
 <html>
 <head>
     <title>Web page Title</title>
 </head>
 <body>
     <h1>This is a Heading</h1>
     <p>This is a paragraph.</p>
 </body>
 </html>''',
        outPutExample: "true",
        fact: "null",
        update: "null",
        note: "null",
        warning: "null"),
    LessonModel(
        header: "Example Breakdown -",
        article: <String>[
          "• The <!DOCTYPE html> declaration defines that this document is an HTML5 document.",
          "• The <html> element is the root element of an HTML page.",
          "• The <head> element contains meta information about the HTML page.",
          "• The <title> element specifies a title for the HTML page (which is shown in the browser's title bar or in the page's tab).",
          "• The <body> element defines the document's body, and is a container for all the visible contents, such as headings, paragraphs, images, links, embeds, tables, lists, etc.",
          "• The <h1> element defines a large heading.",
          "• The <p> element defines a paragraph.",
        ],
        // codeExample: "null",
        codeExample: "null",
        outPutExample: "null",
        fact: "null",
        update: "null",
        note: "null",
        warning: "null"),
    LessonModel(
        header: "How will you learn?",
        article: <String>[
          "In the following lessons, we will guide you through the basic and advance concepts of HTML. Whether you're a beginner or you already know how to code, our step-by-step approach will help you learn HTML easily, efficiently and quickly.",
          "And To make your learning experience more practical and interactive, we have implemented a small code editor that holds code examples which can be modified by the user. This will enable you to experiment with the HTML code examples and to see how they would actually look like on a real browser. There are also breakdown of each part from the examples so that it helps you understand clearly!",
        ],
        codeExample: "null",
        outPutExample: "null",
        fact: "HTML is a markup language and not a programming language.",
        update: "null",
        note: "null",
        warning: "null"),
  ],
  //Second lesson (code Editor)
  "Code Editor": <LessonModel>[
    LessonModel(
        header: "Where can I write HTML code?",
        article: <String>[
          "In a text editor! which is also known as code editor. There are code editors available for all sorts of device. So, whether you are on Computer or on an Android phone, you can create and write HTML. And the most popular code editors are completely free!",
          "Let's look at a list of some of the free and most popular code editors -",
          "      • Visual Studio Code (for computer)",
          "      • Sublime (for computer)",
          "      • Spck Code Editor",
          "      • TrebEdit",
          "      • This App!",
          "We implemented a code editor in our app so the users can both learn and practice HTML without having to leave this app.",
          "You can use any of those apps that are mentioned here to create, write and edit HTML files.",
        ],
        codeExample: "null",
        outPutExample: "null",
        fact: "null",
        update: "null",
        note: "null",
        warning: "null"),
    LessonModel(
        header: "How do I create a HTML file?",
        article: <String>[
          "In order to create a html file you have to give the file '.html' extension for example 'Home.html' or 'contact.html'. Otherwise it wouldn't work and browsers or code editors won't recognize the file.",
          "Below you can see us creating a HTML file named 'index.html' inside "
              'My First Website'
              "folder on a code editor - ",
          "photo1",
          "photo2",
        ],
        codeExample: "null",
        outPutExample: "null",
        fact: "null",
        update: "null",
        note: "null",
        warning: "null"),
  ],

  //Third lesson (Html Boilerplate)
  "HTML Boilerplate": <LessonModel>[
    LessonModel(
        header: "What is Boilerplate code?",
        article: <String>[
          "In programming, boilerplate code, or simply boilerplate, are sections of code that are repeated in multiple places with little to no difference.",
          "This is why rather than writing the same code over and over again, programmers take boilerplate code whenever needed and use it in their code. Note that it is important to understand what the code does and why it's needed and not just blindly copy and paste code.",
          "Following is HTML boilerplate code that is used in all HTML files. Some of the codes aren't required but due to their widespread use and functionalities, we have added them in our code editor and you should too whenever you are creating a new HTML file!",
        ],
        codeExample: "null",
        outPutExample: "null",
        fact: "null",
        update: "null",
        note: "null",
        warning: "null"),
    LessonModel(
        header: "HTML Boilerplate code -",
        article: <String>["null"],
        codeExample: '''
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Web page Title</title>
</head>
<body>
    
</body>
</html>''',
        outPutExample: "null",
        fact: "null",
        update: "null",
        note: "null",
        warning: "null"),
    LessonModel(
        header: "Boilerplate code breakdown - ",
        article: <String>[
          "we have learned most of the example above, the remaining part is explained here."
        ],
        codeExample: "null",
        outPutExample: "null",
        fact: "null",
        update: "null",
        note: "null",
        warning: "null"),
  ],
};
