package com.my.todo.controller;

import com.my.todo.dto.TodoDto;
import com.my.todo.service.TodoService;
import lombok.RequiredArgsConstructor;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/api/todos")
@RequiredArgsConstructor
public class TodoController {

    private final TodoService todoService;

    @GetMapping
    public List<TodoDto> getAllTodos() {
        return todoService.getTodos();
    }

    @PostMapping
    public void createTodo(@RequestBody TodoDto todo) {
        todoService.addTodo(todo);
    }

    @PutMapping("/{id}")
    public void updateTodo(@PathVariable Long id, @RequestBody TodoDto todo) {
        todo.setId(id);
        todoService.toggleTodo(todo);
    }

    @DeleteMapping("/{id}")
    public void deleteTodo(@PathVariable Long id) {
        todoService.removeTodo(id);
    }
}
