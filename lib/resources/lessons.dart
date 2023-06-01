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
        header: "null",
        article: <String>[
          "In the next lesson we will learn about HTML Element."
        ],
        codeExample: "null",
        outPutExample: "null",
        fact: "null",
        update: "null",
        note: "null",
        warning: "null"),
  ],
  //Fourth lesson (Html Elements)
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
          "photo3",
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
        article: <String>[
          "There are some cases where we may use more than one HTML Element. That's where we nest one HTML Element inside another. This is how it looks like."
        ],
        codeExample: "<p><i>I'm an italic paragraph</i></p>",
        outPutExample: "true",
        fact: "null",
        update: "null",
        note: "null",
        warning: "null"),
    LessonModel(
        header: "Empty Elements",
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

  //Third lesson (HTML Attributes)
  "HTML Attributes": <LessonModel>[
    LessonModel(
        header: "HTML Attributes",
        article: <String>[
          "HTML attributes are used to add other informations to an HTML Element.",
          "We can use attributes to modify an element or give the element some special type of values.",
        ],
        codeExample: "null",
        outPutExample: "null",
        fact: "null",
        update: "null",
        note: "null",
        warning: "null"),
    LessonModel(
        header: "Important Things to Remember -",
        article: <String>[
          "HTML attributes are only applied to start tags and will never be on end tags.",
          "An HTML elements can have multiple attributes.",
          "There are some attributes that can be used on all HTML Elements though they may not have effects on some elements. They are called Global Attributes.",
          "An HTML attribute is composed of - an attribute name, an equal = sign  and a value surrounded by quotation marks.",
          "It looks like this: 'theattributename =\"value\"'. Here is a screenshot of an attribute :",
          "photo4",
        ],
        codeExample: "null",
        outPutExample: "null",
        fact: "null",
        update: "null",
        note: "null",
        warning: "null"),
    LessonModel(
        header: "Attributes Examples",
        article: <String>[
          "In this part of the lesson we are going to learn some HTML Attributes with examples.",
          "In this example we have added a header with '<h1>' element and gave it orange color using 'style' attribute. Here 'style' is the attribute and 'orange' is the value.",
        ],
        codeExample: "<h1 style=\"color:orange\";>Hello world header</h1>",
        outPutExample: "true",
        fact: "null",
        update: "null",
        note: "null",
        warning: "null"),
    LessonModel(
        header: "Multiple value Attributes Example - ",
        article: <String>[
          "In this example we have added a paragraph element that has multiple attribute values.",
        ],
        codeExample:
            '''<p style="font-size: 35px; color: red;">I'm a paragraph and my font size is 35 pixels</p>''',
        outPutExample: "true",
        fact: "null",
        update: "null",
        note: "null",
        warning: "null"),
  ],

  //Sixth lesson (Html Comments)
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

  //Seventh lesson (HTML Headings)
  "HTML Headings": <LessonModel>[
    LessonModel(
        header: "HTML Headings -",
        article: <String>[
          "HTML Headings usually contain a title of the main topic of a certain section of a webpage.",
          "HTML Headings are crucial because when one searches something on search engines like Google, headings help search engines to find your website and represent to them.",
          "HTML Headings are block-level elements.",
        ],
        codeExample: '''<h1> Heading 1 </h1>

<h2> Heading 2 </h2>

<h3> Heading 3 </h3>

<h4> Heading 4 </h4>

<h5> Heading 5 </h5>

<h6> Heading 6 </h6>''',
        outPutExample: "true",
        fact: "null",
        update: "null",
        note: "null",
        warning: "null"),
    LessonModel(
        header: "null",
        article: <String>[
          "As you can see on the example that the elements used are the <h1>, <h2>, <h3>, <h4>, <h5> and <h6>.",
          "It's important to remember that there's no heading after <h6>.",
          "You should have noticed that the size of a heading depends on its corresponding number after the h. And the lower the number the larger the font-size.",
          "There should be only one <h1> in a web page.",
        ],
        codeExample: "null",
        outPutExample: "null",
        fact: "null",
        update: "null",
        note: "null",
        warning: "null"),
  ],

  //Eighth lesson (HTML Paragraphs)
  "HTML Paragraphs": <LessonModel>[
    LessonModel(
        header: "HTML Paragraphs",
        article: <String>[
          "HTML paragraphs are used to represent regular text in the website.",
          "The <p> element defines HTML paragraphs.",
          "HTML paragraphs are block-level element.",
        ],
        codeExample: '''<p>This is a paragraph in HTML</p>''',
        outPutExample: "true",
        fact: "null",
        update: "null",
        note: "null",
        warning: "null"),
    LessonModel(
        header: "Styling paragraph",
        article: <String>[
          "We can apply different kind of inline styles on paragraphs. Below we will see examples of some of them.",
        ],
        codeExample:
            '''<p style="text-align: center;">This is a centered paragraph<p>

<p style="color: red;">This is a red paragraph</p>

<p style="font-size: 25px;">This is a 25px font sized paragraph</p>

<p style="font-weight: bold;">This is a paragraph with bold font font</p>''',
        outPutExample: "true",
        fact: "null",
        update: "null",
        note: "null",
        warning: "null"),
  ],

  //Ninth lesson (HTML Styling)
  "HTML Styling": <LessonModel>[
    LessonModel(
        header: "HTML Styling",
        article: <String>[
          "We can use styling to change the appearance of any HTML element. We can their change default values.",
          "For example, the default color of text is black but using style we can change it to red. The default text size is 16px but we can change it to 20px and whatever we like.",
        ],
        codeExample: "null",
        outPutExample: "null",
        fact: "null",
        update: "null",
        note: "null",
        warning: "null"),
    LessonModel(
        header: "Internal Style Sheet",
        article: <String>[
          "Internal Style Sheet is composed Cascading Style Sheet (CSS) rule-set. And we can add as many rules on as many elements as we want.",
          "A CSS rule-set consists of an element selector and a declaration block closed by curly braces that contains CSS declarations separated by semicolons.",
          "They are all enclosed inside the <style> element with its type=\"value\" attribute which is included inside the <head> element.",
          "Internal Style Sheet Example -",
        ],
        codeExample: '''<style type="text/css">

P {
       color: red;
       font-size: 20px;
}

</style>''',
        outPutExample:"null",
        fact: "null",
        update: "null",
        note: "null",
        warning: "null"),
    LessonModel(
        header: "Inline Styling",
        article: <String>[
          "We can also style an element using the 'style' attribute and declaration inside the element and it is similar to internal styling.",
        ],
        codeExample: '''
<p style="color: red;">This is a paragraph that is yellow</p>

<p style="background-color: yellow;">This is a paragraph with yellow background</p>
''',
        outPutExample: "true",
        fact: "null",
        update: "null",
        note: "null",
        warning: "null"),
    LessonModel(
        header: "Font/Text sizing Example -",
        article: <String>[
          "null",
        ],
        codeExample:
            '''
<p style="font-size: 12px;">This is 12px font sized text</p>

<p>This is default font sized text</p>

<p style="font-size: 20px;">This is 20px font sized text</p>

<p style="font-size: 30px;">This is 30px font sized text</p>
''',
        outPutExample: "true",
        fact: "null",
        update: "null",
        note: "null",
        warning: "null"),
    LessonModel(
        header: "Text Alignment Example -",
        article: <String>[
          "null",
        ],
        codeExample: '''
<p style="text-align: left"> I am aligned left </p>
        
<p style="text-align: center"> I am aligned center. </p>

<p style="text-align: right"> I am aligned right. </p>
''',
        outPutExample: "true",
        fact: "null",
        update: "null",
        note:
            "There will be a lot of Internal and inline Styling throughout the whole course so keep going and enjoy!",
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
