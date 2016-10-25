<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE urlrewrite
        PUBLIC "-//tuckey.org//DTD UrlRewrite 3.2//EN"
        "http://tuckey.org/res/dtds/urlrewrite3.2.dtd">

<urlrewrite>

    <rule>
        <from>^/$</from>
        <to>/index.jsp</to>
    </rule>
	<!-- simple demo
	<rule>
		<from>^/test/detail_(\d+)_([a-zA-Z0-9]+).html$</from>
		<to>/test/detail.do?id=$1&amp;name=$2</to>
	</rule>
	-->
</urlrewrite>

