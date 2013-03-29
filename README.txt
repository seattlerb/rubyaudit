Audit
    http://sf.net/projects/seattlerb/

DESCRIPTION:
  
Ruby Language Audit is our attempt to bring beneficial features to
ruby that don't require modifications to the ruby language
itself. Results of our audits are posted at:

  http://www.zenspider.com/Language/Ruby/Audit.html

FEATURES/PROBLEMS:
  
+ Tuple (python) - immutable arrays, can be used as hash keys.
+ Range (python) - allows for a skip values
+ more to come, see the URL above.

SYNOPSIS:

  t = Tuple.new("something", 2, 3)
  => ["something", 2, 3]
  t[0] = 'blah'
  => TypeError: can't modify frozen array
  r = Range.new(0, 10, 2)
  r.to_a
  => [0, 2, 4, 6, 8, 10]

REQUIREMENTS:

+ Just a ruby interpreter, should work w/ any version(?).

INSTALL:

+ copy them into your site_ruby directory. Nothing fancy here!

LICENSE:

(The MIT License)

Copyright (c) 2001-2002 Ryan Davis, Zen Spider Software

Permission is hereby granted, free of charge, to any person obtaining
a copy of this software and associated documentation files (the
"Software"), to deal in the Software without restriction, including
without limitation the rights to use, copy, modify, merge, publish,
distribute, sublicense, and/or sell copies of the Software, and to
permit persons to whom the Software is furnished to do so, subject to
the following conditions:

The above copyright notice and this permission notice shall be
included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.
IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY
CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT,
TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE
SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
