package com.my.todo.dto;

import lombok.Data;
import java.time.LocalDateTime;

@Data
public class TodoDto {
    private Long id;
    private String content;
    private Boolean isCompleted;
    private LocalDateTime createdAt;
}
