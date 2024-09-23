package com.auggie.student_server.service;

import org.springframework.kafka.annotation.KafkaListener;
import org.springframework.stereotype.Service;

@Service
public class KafkaConsumerService {
    @KafkaListener(topics = "test-kafka0", groupId = "test-group")
    public void consume(String message) {
        System.out.println("Received message: " + message);
    }

}