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

This release contains new features, bugfixes and minor enhancements.

Due to a break in compatibility in the SLF4J binding, Log4j now ships with two versions of the SLF4J to Log4j adapters.
`log4j-slf4j-impl` should be used with SLF4J 1.7.x and earlier and `log4j-slf4j18-impl` should be used with SLF4J 1.8.x and later.

As of Log4j 2.9.0, the Log4j API was modified to use `java.util.ServiceLoader` to locate Log4j implementations, although the former binding mechanism is still supported.
The Log4j API JAR is now a multi-release JAR to provide implementations of Java 9 specific classes.
Multi-release JARs are not supported by the OSGi specification so OSGi modules will not be able to take advantage of these implementations but will not lose functionality as they will fall back to the implementations used in Java 7 and 8.
More details on the new features and fixes are itemized below.
Note that some tools are not compatible with multi-release JARs and may fail trying to process class files in the `META-INF/versions/9` folder.
Those errors should be reported to the tool vendor.

Note that subsequent to the 2.9.0 release, for security reasons, `SerializedLayout` is deprecated and no longer used as default in the Socket and JMS appenders.
`SerializedLayout` can still be used as before, but has to be specified explicitly.
To retain old behaviour, you have to change configuration like:

[source,xml]
----
<Appenders>
  <Socket name="socket" host="localhost" port="9500"/>
</Appenders>
----

into:

[source,xml]
----
<Appenders>
  <Socket name="socket" host="localhost" port="9500">
    <SerializedLayout/>
  </Socket>
</Appenders>
----

We do, however, discourage the use of `SerializedLayout` and recommend `JsonLayout` as a replacement:

[source,xml]
----
<Appenders>
  <Socket name="socket" host="localhost" port="9500">
    <JsonLayout properties="true"/>
  </Socket>
</Appenders>
----

Note that subsequent to the 2.9.0 release, for security reasons, Log4j does not process DTD in XML files.
If you used DTD for including snippets, you have to use XInclude or Composite Configuration instead.

The Log4j 2.11.1 API, as well as many core components, maintains binary compatibility with previous releases.

Log4j 2.11.1 requires a minimum of Java 7 to build and run.
Log4j 2.3 was the last release that supported Java 6.

Basic compatibility with Log4j 1.x is provided through the `log4j-1.2-api` component, however it does
not implement some of the very implementation specific classes and methods.
The package names and Maven `groupId` have been changed to `org.apache.logging.log4j` to avoid any conflicts with Log4j 1.x.

For complete information on Apache Log4j 2, including instructions on how to submit bug reports, patches, or suggestions for improvement, see http://logging.apache.org/log4j/2.x/[the Apache Log4j 2 website].

<#include "../.changelog-entries.adoc.ftl">
