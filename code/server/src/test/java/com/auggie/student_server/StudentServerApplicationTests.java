package com.auggie.student_server;

import com.auggie.student_server.mapper.SituationMapper;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import java.time.LocalDateTime;

@SpringBootTest
class StudentServerApplicationTests {
    @Autowired
    SituationMapper situationMapper;

    @Test
    void contextLoads() {
        String year = "2019";
        // 补全为年初的第一天，且时间为00:00
        String fullDateTime = year + "-01-01T00:00";
        LocalDateTime time = LocalDateTime.parse(fullDateTime);
        String topic = "温度";
        Integer param = 10;
        System.out.println(situationMapper.insertSituation(time, topic, param));
        System.out.println(situationMapper.checkAndInsertWarnings(time, topic, param));
    }

}
