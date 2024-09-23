package com.auggie.student_server.mapper;

import com.auggie.student_server.entity.Situation;
import org.apache.ibatis.annotations.MapKey;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.time.LocalDateTime;
import java.util.List;
import java.util.Map;


@Mapper
public interface SituationMapper {

    public boolean insertSituation(@Param("time") LocalDateTime time,
                                        @Param("topic") String topic,
                                        @Param("param") Integer param);
    public boolean insertWarnings(@Param("time") LocalDateTime time,
                                   @Param("topic") String topic,
                                   @Param("param") Integer param);


    default boolean checkAndInsertWarnings(@Param("time") LocalDateTime time, @Param("topic") String topic, @Param("param") Integer param) {
        Map<String, Object> resultMap = selectLimitsByTopic(topic);
        Map<String, Integer> limits = (Map<String, Integer>) resultMap.get(null);
//        System.out.println(resultMap.get(null));

        if (limits != null && !limits.isEmpty()) {
            Integer lowerLimit = (Integer) limits.get("down");
            Integer upperLimit = (Integer) limits.get("up");
            if (param < lowerLimit || param > upperLimit) {
                return insertWarnings(time, topic, param);
            }
        }

        return false;
    }
    @MapKey("topic")
    public Map<String, Object> selectLimitsByTopic(@Param("topic") String topic);
}
