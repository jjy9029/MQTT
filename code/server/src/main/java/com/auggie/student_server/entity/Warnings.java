package com.auggie.student_server.entity;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import org.apache.ibatis.type.Alias;

import java.time.LocalDateTime;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Alias("Warnings")
public class Warnings  {
    private LocalDateTime time;
    private String topic;
    private Integer param;
}
