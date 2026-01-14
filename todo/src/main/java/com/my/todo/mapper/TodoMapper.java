package com.my.todo.mapper;

import com.my.todo.dto.TodoDto;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface TodoMapper {
    List<TodoDto> findAll();
    void save(TodoDto todo);
    void update(TodoDto todo);
    void delete(Long id);
}
