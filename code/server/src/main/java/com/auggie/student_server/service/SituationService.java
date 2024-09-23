package com.auggie.student_server.service;

import com.auggie.student_server.mapper.SituationMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.time.LocalDateTime;
import java.util.Map;
@Service
public class SituationService {
    @Autowired
    private SituationMapper situationMapper;

    public boolean insertSituation(Map<String, String> map) {
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

        System.out.println("信息：" + map);
        System.out.println(time + " " + topic + " " + param);
        return situationMapper.insertSituation(time, topic, param);
    }
//    public boolean insertWarnings(Map<String, String> map) {
//        LocalDateTime time = null;
//        String topic = null;
//        Integer param = null;
//
//        if (map.containsKey("time")) {
//            try {
//                time = LocalDateTime.parse(map.get("time"));
//            }
//            catch (Exception e) {
//            }
//        }
//        if (map.containsKey("topic")) {
//            try {
//                topic = String.valueOf(map.get("topic"));
//            }
//            catch (Exception e) {
//            }
//        }
//        if (map.containsKey("param")) {
//            try {
//                param = Integer.valueOf(map.get("param"));
//            }
//            catch (Exception e) {
//            }
//        }
//
//        System.out.println("信息：" + map);
//        System.out.println(time + " " + topic + " " + param);
//        return situationMapper.insertWarnings(time, topic, param,0,70);
//    }
    public boolean checkAndInsertWarnings(Map<String, String> map) {
        LocalDateTime time = null;
        String topic = null;
        Integer param = null;

        try {
            // 解析时间
            if (map.containsKey("time")) {
                time = LocalDateTime.parse(map.get("time"));
            }
            // 获取topic
            if (map.containsKey("topic")) {
                topic = map.get("topic");
            }
            // 获取参数
            if (map.containsKey("param")) {
                param = Integer.valueOf(map.get("param"));
            }

            System.out.println("信息：" + map);
            System.out.println(time + " " + topic + " " + param);

            // 查询上下限
            Map<String, Object> limits = situationMapper.selectLimitsByTopic(topic);

            if (limits != null) {
                Integer lowerLimit = (Integer) limits.get("down");
                Integer upperLimit = (Integer) limits.get("up");

                // 判断参数是否在允许的范围内
                if (param != null && (param < lowerLimit || param > upperLimit)) {
                    // 插入记录
                    return situationMapper.insertWarnings(time, topic, param);
                } else {
                    System.out.println("参数不在允许的范围内：[" + lowerLimit + ", " + upperLimit + "]");
                    return false; // 参数在范围内，不进行插入
                }
            } else {
                System.out.println("没有找到指定topic的限制信息");
                return false;
            }
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }

}
