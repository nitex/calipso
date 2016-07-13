function question(answer, support, question, a, b, c, d)
{this.answer = answer;
 this.support = support;
 this.question = question;
 this.a = a;
 this.b = b;
 this.c = c;
 this.d = d;
 return this;
}

var units = new Array(
    new question('a','I know...','1First leter','a1','b','c','d'),
    new question('b','I know...','2First leter','a2','b','c','d'),
    new question('c','I know...','3First leter','a3','b','c','d'),
    new question('d','I know...','4First leter','a4','b','c','d'),
    new question('c','I know...','5First leter','a5','b','c','d'),
    new question('d','I know...','6First leter','a6','b','c','d'),
    new question('b','I know... too ...','7Second leter','a7','b','x','z'));