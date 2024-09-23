package com.auggie.student_server.service;

import com.auggie.student_server.entity.Warnings;
import com.auggie.student_server.mapper.WarningsMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.time.LocalDateTime;
import java.util.List;
import java.util.Map;
@Service
public class WarningsService {
    @Autowired
    private WarningsMapper warningsMapper;

    public List<Warnings> findBySearch(Map<String, String> map) {
        LocalDateTime time = null;
        String topic = null;
        Integer param = null;

        if (map.containsKey("time")) {
            try {
                time = LocalDateTime.parse(map.get("time"));
            }
            catch (Exception e) {
            }
        }
        if (map.containsKey("topic")) {
            try {
                topic = String.valueOf(map.get("topic"));
            }
            catch (Exception e) {
            }
        }
        if (map.containsKey("param")) {
            try {
                param = Integer.valueOf(map.get("param"));
            }
            catch (Exception e) {
            }
        }

        System.out.println("报警信息：" + map);
        System.out.println(time + " " + topic + " " + param);
        return warningsMapper.findBySearch(time, topic, param);
    }

    public Integer searchWarning(Warnings warnings) {
        return warningsMapper.findWarning(warnings);
    }


}
