package com.auggie.student_server.mapper;

import com.auggie.student_server.entity.Warnings;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.time.LocalDateTime;
import java.util.List;


@Mapper
public interface WarningsMapper {
    public List<Warnings> findBySearch(@Param("time") LocalDateTime time,
                                      @Param("topic") String topic,
                                      @Param("param") Integer param);

    public Integer findWarning(@Param("warnings") Warnings warnings);
}
