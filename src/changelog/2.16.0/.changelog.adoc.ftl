////
    Licensed to the Apache Software Foundation (ASF) under one or more
    contributor license agreements.  See the NOTICE file distributed with
    this work for additional information regarding copyright ownership.
    The ASF licenses this file to You under the Apache License, Version 2.0
    (the "License"); you may not use this file except in compliance with
    the License.  You may obtain a copy of the License at

         https://www.apache.org/licenses/LICENSE-2.0

    Unless required by applicable law or agreed to in writing, software
    distributed under the License is distributed on an "AS IS" BASIS,
    WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
    See the License for the specific language governing permissions and
    limitations under the License.
////

= ${release.version}<#if release.date?has_content> (${release.date})</#if>

This release contains one change which is noted below.

Due to a break in compatibility in the SLF4J binding, Log4j now ships with two versions of the SLF4J to Log4j adapters.
`log4j-slf4j-impl` should be used with SLF4J 1.7.x and earlier and `log4j-slf4j18-impl` should be used with SLF4J 1.8.x and later.
SLF4J-2.0.0 alpha releases are not fully supported.
See https://issues.apache.org/jira/browse/LOG4J2-2975[LOG4J2-2975] and https://jira.qos.ch/browse/SLF4J-511[SLF4J-511].

Some of the changes in Log4j 2.16.0 include:

* Removed Message Lookups.
This is a hardening related to changes made to prevent CVE-2021-44228.
While this change is recommended, it is NOT required to fix CVE-2021-44228.
* While release 2.15.0 removed the ability to resolve Lookups and log messages and addressed issues with how JNDI is accessed, the Log4j team feels that having JNDI enabled by default introduces an undue risk for our users.
Starting in version 2.16.0, JNDI functionality is disabled by default and can be re-enabled via the `log4j2.enableJndi` system property.
Use of JNDI in an unprotected context is a large security risk and should be treated as such in both this library and all other Java libraries using JNDI.
* Prior to version 2.15.0, Log4j would automatically resolve Lookups contained in the message or its parameters in the Pattern Layout.
This behavior is no longer the default and must be enabled by specifying `%msg\{lookup}`.

The Log4j 2.16.0 API, as well as many core components, maintains binary compatibility with previous releases.

Apache Log4j 2.16.0 requires a minimum of Java 8 to build and run.
Log4j 2.12.1 is the last release to support Java 7.
Java 7 is no longer supported by the Log4j team.

For complete information on Apache Log4j 2, including instructions on how to submit bug reports, patches, or suggestions for improvement, see http://logging.apache.org/log4j/2.x/[the Apache Log4j 2 website].

<#include "../.changelog-entries.adoc.ftl">
