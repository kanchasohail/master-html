import 'package:master_html/resources/models/lesson_model.dart';

const Map<String, List<LessonModel>> allLessons = {
  //First lesson (HTML Introduction)
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

  "HTML Elements": <LessonModel>[
    LessonModel(
        header: "HTML Elements",
        article: <String>[
          "An HTML Element usually consists of a starting tag, element content and then ending tag or also known as closing tags.",
        ],
        codeExample: " <p>This is element content</p>",
        outPutExample: "true",
        fact: "null",
        update: "null",
        note: "null",
        warning: "null"),
    LessonModel(
        header: "null",
        article: <String>[
          "Here '<p>' is a starting tag, 'This is element content' is the content and '</p>' is the ending tag.",
          "For better and clear understanding, let's take a look at a screenshot -",
        ],
        codeExample: "null",
        outPutExample: "null",
        fact: "null",
        update: "null",
        note: "null",
        warning: "null"),

    // <!-- <meta name="viewport" content="width=device-width, initial-scale=1">  -->
    LessonModel(
        header: "Nested HTML Elements",
        article: <String>["There are some cases where we may use more than one HTML Element. That's where we nest one HTML Element inside another. This is how it looks like."],
        codeExample: "<p><i>I'm an italic paragraph</i></p>",
        outPutExample: "true",
        fact: "null",
        update: "null",
        note: "null",
        warning: "null"),
    LessonModel(
        header: "Empty Elements -",
        article: <String>[
          "Some elements in HTML doesn't have an ending tag and element content. They are called empty Elements.",
          "Some of the commonly used empty Elements are listed below.",
          "     • <link>",
          "     • <img>",
          "     • <meta>",
          "     • <br>",
          "     • <input>",
          "Some likes to put a forward slash '/' before the greater than symbol.",
          "But if you want to use it or not, both are correct and will work without any issues.",
        ],
        // codeExample: "null",
        codeExample: "null",
        outPutExample: "null",
        fact: "null",
        update: "null",
        note: "null",
        warning: "null"),
  ],

  //Fourth Lesson
  //Fifth Lesson
  //Sixth Lesson
  //Third lesson (Html Comments)
  "HTML Comments": <LessonModel>[
    LessonModel(
        header: "What are comments in HTML?",
        article: <String>[
          "Comments are texts kept as a note inside an HTML file.",
          "Comments aren't displayed by browsers and only the person writing or editing the code can see it.",
        ],
        codeExample: "null",
        outPutExample: "null",
        fact: "null",
        update: "null",
        note: "null",
        warning: "null"),
    LessonModel(
        header: "Why use comments in HTML?",
        article: <String>[
          "Comments can be used to explain the code, it acts as note to make the code more readable.",
          "It can also be used to prevent execution when testing alternative code.",
          "Comments in HTML looks like this <!- - comment goes here - ->",
          "Below we will see an example on how comments in HTML look like and proper use case."
        ],
        codeExample: "null",
        outPutExample: "null",
        fact: "null",
        update: "null",
        note: "null",
        warning: "null"),
    LessonModel(
        header: "HTML Comments Example -",
        article: <String>["null"],
        codeExample: '''<p>This is a paragraph</p>

<!-- This is a comment in HTML -->

<!-- This comment has multiple lines,
     also known as multi-line comment -->

<p>This is another paragraph</p>''',
        outPutExample: "true",
        fact: "null",
        update: "null",
        note: "null",
        warning: "null"),
    LessonModel(
        header: "When to use comments in HTML?",
        article: <String>[
          "Comments shouldn't be used everywhere and it should only be used to explain something difficult or something that should be done later.",
        ],
        codeExample: "null",
        outPutExample: "null",
        fact: "null",
        update: "null",
        note: "null",
        warning: "null"),
  ],
  // A
  //  Lot
  //  Of
  //  lessons
  //  to
  //  come
  //  here
  //Thirty seventh lesson (HTML Subscript Text)
  "HTML Subscript Text": <LessonModel>[
    LessonModel(
        header: "HTML Subscript Text",
        article: <String>[
          "Subscript texts are placed below baseline and smaller than usual.",
          "To make a text appear as subscript, we need to use the <sub> element.",
        ],
        codeExample: "null",
        outPutExample: "null",
        fact: "null",
        update: "null",
        note: "null",
        warning: "null"),
    LessonModel(
        header: "Example -",
        article: <String>["null"],
        codeExample: '''
<!-- writing a mathematical equation -->
    
<p> x<sub>3</sub> + 3x + 2x<sub>2</sub> + 6 </p>
   ''',
        // outPutExample: "null",
        outPutExample: "true",
        fact: "null",
        update: "null",
        note:
            "The <sub> element should be used for typographical reasons as shown in the example above and not for appearance or decoration purposes.",
        warning: "null"),
  ],
  //Thirty eighth lesson (Html Superscript Text)
  "Html Superscript Text": <LessonModel>[
    LessonModel(
        header: "HTML Superscript Text",
        article: <String>[
          "Superscript texts are placed above baseline and smaller than usual.",
          "To make a text appear as superscript, we need to use the <sup> element.",
        ],
        codeExample: "null",
        outPutExample: "null",
        fact: "null",
        update: "null",
        note: "null",
        warning: "null"),
    LessonModel(
        header: "Example -",
        article: <String>["null"],
        codeExample: '''
<!-- writing a chemical equation -->
    
<p> N<sup>2</sup> + H<sup>2</sup> &rarr; NH<sup>3</sup></p>
   ''',
        // outPutExample: "null",
        outPutExample: "true",
        fact: "null",
        update: "null",
        note:
            "The '<sup>' element should be used for typographical reasons as shown in the example above and not for appearance or decoration purposes.",
        warning: "null"),
  ],
};
