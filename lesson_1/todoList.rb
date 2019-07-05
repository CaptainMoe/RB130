require 'pry'

class Todo
  DONE_MARKER = 'X'
  UNDONE_MARKER = ' '

  attr_accessor :title, :description, :done

  def initialize(title, description='')
    @title = title
    @description = description
    @done = false
  end

  def done!
    self.done = true
  end

  def done?
    done
  end

  def undone!
    self.done = false
  end

  def to_s
    "[#{done? ? DONE_MARKER : UNDONE_MARKER}] #{title}"
  end
end

class TodoList
  attr_accessor :title

  def initialize(title)
    @title = title
    @todos = []
  end

  def <<(todo)
    if todo.is_a? Todo
      @todos << todo
    else
      raise TypeError, "Can only add Todo objects"
    end
  end

  alias_method :add, :<<

  def size
    @todos.size
  end

  def first
    @todos[0]
  end

  def last
    @todos[-1]
  end

  def shift
    @todos.shift
  end

  def pop
    @todos.pop
  end

  def to_a
    @todos.clone
  end

  def done?
    @todos.all? { |todo| todo.done?}
  end

  def item_at(index)
    @todos.fetch(index)
  end

  def mark_done_at(index)
    item_at(index).done!
  end

  def mark_undone_at(index)
    item_at(index).undone!
  end

  def remove_at(idx)
    @todos.delete(item_at(idx))
  end

  def done!
    @todos.each do |todo|
      todo.done!
    end
  end

  def each
    @todos.each do |todo|
      yield(todo)
    end

    self
  end

  def select
    result = TodoList.new(@title)
    each do |todo|
      result << todo if yield(todo) == true
    end

    result
  end

  def find_by_title(title)
    binding.pry
    r = select do |todo|
      todo.title == title
    end
    resutl.item_at(0)
  end

  def all_done
    result = select do |todo|
      todo.done?
    end

    result
  end

  def all_not_done
    result = select do |todo|
      !todo.done?
    end

    result
  end

  def mark_done(title)
    find_by_title(title).done!
  end

  def mark_all_undone
    @todos.each do |todo|
      todo.undone!
    end
  end

  def to_s
    text = "----#{title}----\n"
    text << @todos.map(&:to_s).join("\n")
    text
  end
end

todo1 = Todo.new("Buy milk")
todo2 = Todo.new("Clean room")
todo3 = Todo.new("Go to gym")

list = TodoList.new("Today's Todos")
list.add(todo1)
list.add(todo2)
list.add(todo3)

list.mark_done_at(1)

puts list.all_not_done
