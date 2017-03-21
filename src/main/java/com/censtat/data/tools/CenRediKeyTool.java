package com.censtat.data.tools;

import com.lambdaworks.redis.RedisClient;
import com.lambdaworks.redis.api.StatefulRedisConnection;
import com.lambdaworks.redis.api.sync.RedisCommands;
/**
 * 
 * @author RafiS1
 *
 */
public class CenRediKeyTool {

	public CenRediKeyTool() {

	}

	public void connectToRedis() {
		RedisClient redisClient = RedisClient.create("redis://10.0.0.76:6379");
		StatefulRedisConnection<String, String> connection = redisClient.connect();
		RedisCommands<String, String> syncCommands = connection.sync();
		syncCommands.set("key", "Hello, Redis!");
		connection.close();
		redisClient.shutdown();
	}

	public static void main(String[] args) {

	}

}
