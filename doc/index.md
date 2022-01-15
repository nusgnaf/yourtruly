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
看好你要用的字段
``` bash
rm -rf app/views/students/* ###
rails g erb:scaffold Student card_number homework score
```

#### Rails ActionCable技术的潜力和缺陷
- Pro
    * 完美集成的实时通讯方案
    * 和Rails同进程同端口的websocket server，用户权限是集中解决的
- Cons
    * 内存消耗大
    * 前端balancer和ws服务器断连/再接入后有一致性问题
- 综合评价

