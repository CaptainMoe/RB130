require 'minitest/autorun'
require 'simplecov'
require "minitest/reporters"

Minitest::Reporters.use!
SimpleCov.start


require_relative 'todolist'

class TodoListTest < MiniTest::Test

  def setup
    @todo1 = Todo.new("Buy milk")
    @todo2 = Todo.new("Clean room")
    @todo3 = Todo.new("Go to gym")
    @todos = [@todo1, @todo2, @todo3]

    @list = TodoList.new("Today's Todos")
    @list.add(@todo1)
    @list.add(@todo2)
    @list.add(@todo3)
  end

  def test_to_a
    assert_equal(@todos, @list.to_a)
  end

  def test_size
    assert_equal(3, @list.size)
  end

  def test_first
    assert_equal(@todo1, @list.first)
  end

  def test_last
    assert_equal(@todo3, @list.last)
  end

  def test_shift
    list = @list.clone
    todo = list.shift
    assert_equal(@todo1, todo)
    assert_equal([@todo2, @todo3], list.to_a)
  end

  def test_pop
    list = @list.clone
    todo = list.pop
    assert_equal(@todo3, todo)
    assert_equal([@todo1, @todo2], list.to_a)
  end

  def test_done?
    assert_equal(false, @list.done?)
  end

  def test_add_raise_error
    assert_raises(TypeError) { @list.add(3)}
    assert_raises(TypeError) { @list.add('moe')}
  end

  def test_shovel
    todo = Todo.new('New todo')
    @list << todo
    assert_includes(@list.to_a, todo)
  end

  def test_add
    todo = Todo.new('New todo')
    @list << todo
    assert_includes(@list.to_a, todo)
  end

  def test_item_at
    assert_raises(IndexError) {@list.item_at(100)}
    assert_equal(@todos[0], @list.item_at(0))
    assert_equal(@todos[2], @list.item_at(2))
  end

  def test_mark_done_at
    assert_raises(IndexError) { @list.mark_done_at(100)}
    @list.mark_done_at(0)
    @list.mark_done_at(1)
    assert(@todo1.done?)
    assert(@todo2.done?)
  end

  def test_mark_undone_at
    assert_raises(IndexError) { @list.mark_done_at(100)}
    @list.mark_undone_at(0)
    @list.mark_undone_at(1)
    assert(!@todo1.done?)
    assert(!@todo2.done?)
  end

  def test_done!
    @list.done!
    @list.each do |todo|
      assert(todo.done?)
    end
  end

  def test_remove_at
    assert_raises(IndexError) { @list.mark_done_at(100)}
    @list.remove_at(0)
    assert_equal([@todo2, @todo3], @list.to_a)
  end

  def test_to_s
    output = <<~OUTPUT.chomp
    ---- Today's Todos ----
    [ ] Buy milk
    [ ] Clean room
    [ ] Go to gym
    OUTPUT
    assert_equal(output, @list.to_s)
  end

  def test_to_s2
    @list.mark_done_at(1)

    output = <<~OUTPUT.chomp
    ---- Today's Todos ----
    [ ] Buy milk
    [X] Clean room
    [ ] Go to gym
    OUTPUT
    assert_equal(output, @list.to_s)
  end

  def test_to_s2
    @list.done!

    output = <<~OUTPUT.chomp
    ---- Today's Todos ----
    [X] Buy milk
    [X] Clean room
    [X] Go to gym
    OUTPUT
    assert_equal(output, @list.to_s)
  end

  def test_each
    idx = 0
    @list.each do |todo|
      assert_equal(todo, @todos[idx])
      idx += 1
    end
  end

  def test_each2
    list = @list.each
    assert_equal(list, @list)
  end

  def test_select
    @list.mark_done_at(2)
    list = @list.select { |todo| todo.done?}
    assert_equal([@todo3], list.to_a)
  end
end
