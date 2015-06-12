Museum Tracker
Author: Enrique Esparza

Description: This app allows museum owner, to view, add, update and delete museums and artwork. And add artwork to specific museums

Github:https://github.com/EnriqueEsparza/museum_tracker_wDB.git
Heroku:

Setup: clone Github repo bundle the Gemfile in Terminal/CLI. Run $ bundle run $ ruby app.rb open browser window url: localhost:4567

Database setup:
epicodus-30:~ Guest$ psql
Guest=# CREATE DATABASE museum_tracker;
Guest=# \c museum_tracker;
museum_tracker=# CREATE TABLE artworks (id serial PRIMARY KEY, description varchar, museum_id int);
museum_tracker=# CREATE TABLE museums (id serial PRIMARY KEY, name varchar);
museum_tracker=# CREATE DATABASE museum_tracker_test WITH TEMPLATE museum_tracker;

License:
This is free and unencumbered software released into the public domain.

Anyone is free to copy, modify, publish, use, compile, sell, or distribute this software, either in source code form or as a compiled binary, for any purpose, commercial or non-commercial, and by any means.

In jurisdictions that recognize copyright laws, the author or authors of this software dedicate any and all copyright interest in the software to the public domain. We make this dedication for the benefit of the public at large and to the detriment of our heirs and successors. We intend this dedication to be an overt act of relinquishment in perpetuity of all present and future rights to this software under copyright law.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

For more information, please refer to http://unlicense.org/
