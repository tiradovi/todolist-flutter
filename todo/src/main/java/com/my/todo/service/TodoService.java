package com.my.todo.service;

import com.my.todo.dto.TodoDto;

import java.util.List;

public interface TodoService {
    List<TodoDto> getTodos();
    void addTodo(TodoDto todo);
    void toggleTodo(TodoDto todo);
    void removeTodo(Long id);
}
