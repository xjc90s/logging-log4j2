/*
 * Licensed to the Apache Software Foundation (ASF) under one or more
 * contributor license agreements. See the NOTICE file distributed with
 * this work for additional information regarding copyright ownership.
 * The ASF licenses this file to You under the Apache license, Version 2.0
 * (the "License"); you may not use this file except in compliance with
 * the License. You may obtain a copy of the License at
 *
 *      http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the license for the specific language governing permissions and
 * limitations under the license.
 */

package org.apache.logging.log4j.redis.appender;

import org.apache.logging.log4j.core.Core;
import org.apache.logging.log4j.core.config.plugins.Plugin;
import org.apache.logging.log4j.core.config.plugins.PluginAttribute;
import org.apache.logging.log4j.core.config.plugins.PluginBuilderFactory;
import redis.clients.jedis.JedisPoolConfig;

/**
 * Plugin configuration for {@link redis.clients.jedis.JedisPool} objects, allowing end users to set pool configuration
 * if desired. If not set, will default to JedisPool defaults.
 */
@Plugin(name = "PoolConfiguration", category = Core.CATEGORY_NAME, printObject = true)
public class LoggingJedisPoolConfiguration extends JedisPoolConfig {

    private LoggingJedisPoolConfiguration() {
        super();
    }

    static LoggingJedisPoolConfiguration defaultConfiguration() {
        return LoggingJedisPoolConfiguration.newBuilder().build();
    }

    /**
     * Creates a LoggingJedisPoolConfiguration from standard pool parameters.
     */
    @PluginBuilderFactory
    public static Builder newBuilder() {
        return new LoggingJedisPoolConfiguration.Builder();
    }

    private static class Builder implements org.apache.logging.log4j.core.util.Builder<LoggingJedisPoolConfiguration> {

        @PluginAttribute(value = "minIdle", defaultInt = 1800000)
        private int minIdle = JedisPoolConfig.DEFAULT_MIN_IDLE;

        @PluginAttribute(value = "maxIdle")
        private int maxIdle = JedisPoolConfig.DEFAULT_MAX_IDLE;

        @PluginAttribute(value = "testOnBorrow")
        private boolean testOnBorrow = JedisPoolConfig.DEFAULT_TEST_ON_BORROW;

        @PluginAttribute(value = "testOnReturn")
        boolean testOnReturn = JedisPoolConfig.DEFAULT_TEST_ON_RETURN;

        @PluginAttribute(value = "testWhileIdle")
        boolean testWhileIdle = JedisPoolConfig.DEFAULT_TEST_WHILE_IDLE;

        @PluginAttribute(value = "testsPerEvictionRun")
        int testsPerEvictionRun = JedisPoolConfig.DEFAULT_NUM_TESTS_PER_EVICTION_RUN;

        @PluginAttribute(value = "timeBetweenEvictionRunsMillis")
        long timeBetweenEvicationRunsMillis = JedisPoolConfig.DEFAULT_TIME_BETWEEN_EVICTION_RUNS_MILLIS;

        @Override
        public LoggingJedisPoolConfiguration build() {
            LoggingJedisPoolConfiguration poolConfig = new LoggingJedisPoolConfiguration();
            poolConfig.setMaxIdle(maxIdle);
            poolConfig.setMinIdle(minIdle);
            poolConfig.setTestOnBorrow(testOnBorrow);
            poolConfig.setTestOnReturn(testOnReturn);
            poolConfig.setTestWhileIdle(testWhileIdle);
            poolConfig.setNumTestsPerEvictionRun(testsPerEvictionRun);
            poolConfig.setTimeBetweenEvictionRunsMillis(timeBetweenEvicationRunsMillis);
            return poolConfig;
        }

        public int getMinIdle() {
            return minIdle;
        }

        public Builder setMinIdle(int minIdle) {
            this.minIdle = minIdle;
            return this;
        }

        public int getMaxIdle() {
            return maxIdle;
        }

        public Builder setMaxIdle(int maxIdle) {
            this.maxIdle = maxIdle;
            return this;
        }

        public boolean isTestOnBorrow() {
            return testOnBorrow;
        }

        public Builder setTestOnBorrow(boolean testOnBorrow) {
            this.testOnBorrow = testOnBorrow;
            return this;
        }

        public boolean isTestOnReturn() {
            return testOnReturn;
        }

        public Builder setTestOnReturn(boolean testOnReturn) {
            this.testOnReturn = testOnReturn;
            return this;
        }

        public boolean isTestWhileIdle() {
            return testWhileIdle;
        }

        public Builder setTestWhileIdle(boolean testWhileIdle) {
            this.testWhileIdle = testWhileIdle;
            return this;
        }

        public int getTestsPerEvictionRun() {
            return testsPerEvictionRun;
        }

        public Builder setTestsPerEvictionRun(int testsPerEvictionRun) {
            this.testsPerEvictionRun = testsPerEvictionRun;
            return this;
        }

        public long getTimeBetweenEvicationRunsMillis() {
            return timeBetweenEvicationRunsMillis;
        }

        public Builder setTimeBetweenEvicationRunsMillis(long timeBetweenEvicationRunsMillis) {
            this.timeBetweenEvicationRunsMillis = timeBetweenEvicationRunsMillis;
            return this;
        }
    }
}
