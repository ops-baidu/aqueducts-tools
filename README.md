aqueducts-tools
===============

astream tools and kpi tools by ruby.

usage
================
atream-tools 要求： 可以访问线上机器<br/>
aqueducts_kpi_ruby要求：可以访问线上机器，连接mongo数据

astream-tools：
  进入 astream-tools/script 目录下面<br/>
### usage
	$ls 
	astream_tools.rb strom-tools.rb
### strom-tools.rb
###	1. list all topology name
	$ ruby strom-tools.rb search topology --list
	topology number: 22sf_deimos
	sf_vega
	sf_adcore
	im_asp
	sf_jupiter
	im_router
	jpaas_router
	...
###	2. list all hosts and cup_num for one perticular topologyu,eg. sf_adcore
	$ ruby strom-tools.rb search topology --name sf_adcore --host

###	astream_tools.rb
###	1. print all product/service/period info in last 24 hours. --pretty means print info prettly in json
	$ ruby astream_tools.rb search --pretty
###	2. for a preticular product and service
	$ ruby astream_tools.rb search --pretty --product sf --service adcore
###	3. set starttime and end time 
	$ ruby astream_tools.rb search --pretty --product sf --service adcore --from 20140710123030 --to 20140711240000
	
	
	
	
	
