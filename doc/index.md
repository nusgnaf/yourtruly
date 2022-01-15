### Rails technique
#### Rails 用脚手架生成器做了CRUD基本代码后，model难免用migration变更，如何解决view没有对应同步的问题
``` ruby
rails g scaffold Student card_number:integer homework:text
rails g migration AddScoreToStudent  score:integer
```
解决方法：在*rails console* 里面
``` ruby
Student.column_names #=>["id", "card_number", "created_at", "updated_at", "homework", "score"]
```
看好你要用的列
``` bash
rm -rf app/views/students/* ###
rails g erb:scaffold Student card_number homework score
```
