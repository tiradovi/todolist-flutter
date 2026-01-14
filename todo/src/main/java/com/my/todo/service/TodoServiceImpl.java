package com.my.todo.service;

import com.my.todo.dto.TodoDto;
import com.my.todo.mapper.TodoMapper;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
@RequiredArgsConstructor
@Transactional
public class TodoServiceImpl implements TodoService {

    private final TodoMapper todoMapper;

    @Override
    @Transactional(readOnly = true)
    public List<TodoDto> getTodos() {
        return todoMapper.findAll();
    }

    @Override
    public void addTodo(TodoDto todo) {
        if (todo.getIsCompleted() == null) {
            todo.setIsCompleted(false);
        }
        todoMapper.save(todo);
    }

    @Override
    public void toggleTodo(TodoDto todo) {
        todoMapper.update(todo);
    }

    @Override
    public void removeTodo(Long id) {
        todoMapper.delete(id);
    }
}
