
user = User.create email: 'user@email.com', password: '123456'
admin = Admin.create email: 'admin@email.com', password: '123456', first_name: 'admin', last_name: 'admin'

categories = Category.create([
  { title: 'Frontend' }
])

frontend = categories.first

html = frontend.quizzes.create title: 'HTML', level: 0, creator_id: admin.id
css = frontend.quizzes.create title: 'CSS', level: 0, creator_id: admin.id

html.questions.create([
  { body: 'What does HTML stand for?' },
  { body: 'Where is the text of the title tag displayed?' },
  { body: 'What are the different levels of headings in HTML?' },
  { body: 'What happens if you forget a slash at the end of a header tag?' },
  { body: 'Which tag will return you to the next line and insert a blank line before the next line of text?' },
  { body: 'Do you need to add a tag after a horizontal rule tag to get your text to the next line?' },
  { body: 'What is the HTML tag to bold text?' },
  { body: 'What is the HTML tag for unsorted list?' },
  { body: 'For explaining, which new technology is used?' },
  { body: 'Metadata does not define' },
  { body: 'Relative URLs are used to ' },
  { body: 'Which one of the following is not the value of the target attribute?' },
  { body: 'What is the path for an image located in same folder as the current page?' }
])

html.questions[0].answers.create([
  { body: 'Hyper Text Markup Language', correct: true },
  { body: 'Home Tool Markup Language', correct: false },
  { body: 'Hyperlinks and Text Markup Language', correct: false }
])

html.questions[1].answers.create([
  { body: 'In the body of the page', correct: false },
  { body: 'In the status bar', correct: false },
  { body: 'In the title bar', correct: true },
])

html.questions[2].answers.create([
  { body: '1-6', correct: true },
  { body: '2-5', correct: false },
  { body: '1-4', correct: false }
])

html.questions[3].answers.create([
  { body: 'Nothing', correct: false },
  { body: 'A Netscape error', correct: false },
  { body: 'Everything following will be a heading format', correct: true }
])

html.questions[4].answers.create([
  { body: 'hr', correct: false },
  { body: 'br', correct: true },
  { body: 'b', correct: false }
])

html.questions[5].answers.create([
  { body: 'Yes', correct: false },
  { body: 'No', correct: true },
  { body: 'Sometimes', correct: false }
])

html.questions[6].answers.create([
  { body: 'Bold', correct: false },
  { body: 'b', correct: true },
  { body: 'bd', correct: false }
])

html.questions[7].answers.create([
  { body: 'ul', correct: true },
  { body: 'ol', correct: false },
  { body: 'list', correct: false }
])

html.questions[8].answers.create([
  { body: 'dfn', correct: true },
  { body: 'cite', correct: false },
  { body: 'abbr', correct: false },
  { body: 'address', correct: false }
])

html.questions[9].answers.create([
  { body: 'character set', correct: false },
  { body: 'links', correct: false },
  { body: 'scripts', correct: false },
  { body: 'color', correct: true }
])

html.questions[10].answers.create([
  { body: 'link other pages within the same site', correct: true },
  { body: 'link the same page with other sites', correct: false },
  { body: 'link other pages with other sites', correct: false },
  { body: 'does not link', correct: false }
])

html.questions[11].answers.create([
  { body: '_blank', correct: false },
  { body: '_top', correct: false },
  { body: '_self', correct: false },
  { body: '_empty', correct: true }
])

html.questions[12].answers.create([
  { body: '<img src= “pic.jpg”>', correct: true },
  { body: '<img src= “../pic.jpg”>', correct: false },
  { body: '<img src= “images/pic.jpg”>', correct: false },
  { body: '<img src= “/images/pic.jpg”>', correct: false }
])


css.questions.create([
  { body: 'Which of the following is NOT a valid border-style property value?' },
  { body: 'Which of the following is NOT a valid CSS length unit?' },
  { body: 'What is the CSS selector which allows you to target every element in a web page?' },
  { body: 'Which CSS property allows you to hide an element but still maintain the space it occupies in the web page?' },
  { body: 'There are 16 basic color keywords in CSS. Which of the following are NOT basic color keywords?' },
  { body: 'Which of the following CSS properties DOES NOT influence the box model?' },
  { body: 'When using media queries, which of the following is NOT a valid media type?' },
  { body: 'What is the color keyword that will always be equal to the calculated color property value of the selected element/elements? ' },
  { body: 'Which of the following is NOT a valid CSS unit?' },
  { body: 'Which of the following color keywords has NOT yet been proposed in a W3C specification?' },
  { body: 'What is the CSS at-rule that can allow you to define the character encoding of a stylesheet?' }
])

css.questions[0].answers.create([
  { body: 'dotted', correct: false },
  { body: 'inset', correct: false },
  { body: 'glazed', correct: true },
  { body: 'groove', correct: false },
])

css.questions[1].answers.create([
  { body: 'cm', correct: false },
  { body: 'dm', correct: true },
  { body: 'em', correct: false },
  { body: 'mm', correct: false }
])

css.questions[2].answers.create([
  { body: '+', correct: false },
  { body: '.', correct: false },
  { body: '*', correct: true }
])

css.questions[3].answers.create([
  { body: 'visibility', correct: true },
  { body: 'display', correct: false },
  { body: 'opacity', correct: true }
])

css.questions[4].answers.create([
  { body: 'olive', correct: false },
  { body: 'fuchsia', correct: false },
  { body: 'cyan', correct: true },
  { body: 'aqua', correct: false }
])

css.questions[5].answers.create([
  { body: 'Content', correct: false },
  { body: 'Padding', correct: false },
  { body: 'Outline', correct: true },
  { body: 'Border', correct: false }
])

css.questions[6].answers.create([
  { body: 'tv', correct: false },
  { body: 'voice', correct: true },
  { body: 'tty', correct: false },
  { body: 'braille', correct: false }
])

css.questions[7].answers.create([
  { body: 'current', correct: false },
  { body: 'color', correct: false },
  { body: 'currentColor', correct: true }
])

css.questions[8].answers.create([
  { body: 'ch', correct: false },
  { body: 'turn', correct: false },
  { body: 'ems', correct: true },
  { body: 'dpcm', correct: false }
])

css.questions[9].answers.create([
  { body: 'blanchedalmond', correct: false },
  { body: 'orchidblack', correct: true },
  { body: 'dodgerblue', correct: false },
  { body: 'navajowhite', correct: false }
])

css.questions[10].answers.create([
  { body: '@charset', correct: true },
  { body: '@encoding', correct: false },
  { body: '@char', correct: false }
])
