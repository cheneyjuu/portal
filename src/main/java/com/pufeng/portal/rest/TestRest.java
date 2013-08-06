package com.pufeng.portal.rest;

import com.pufeng.portal.entity.Task;
import org.springframework.web.client.RestTemplate;

import java.net.URI;

/**
 * User: Juchen
 * Date: 13-7-11
 * Time: 上午10:05
 */
public class TestRest {

    public static void main(String[] args){
        String uri = "http://10.25.68.97:8080/api/v1/task";
        RestTemplate restTemplate = new RestTemplate();
        Task task = new Task();
        task.setTitle("Hello");
        task.setDescription("taks description");
        String json = "{title:123,description:qwe}";
        URI location = restTemplate.postForLocation(uri, json);
        System.out.println(location.toString());
    }
}
