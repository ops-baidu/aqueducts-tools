aqueducts-tools
===============

astream tools and kpi tools by ruby.

usage
================
atream-tools 要求： 可以访问线上机器<br/>
aqueducts_kpi_ruby要求：可以访问线上机器，连接mongo数据

astream-tools：
  进入 astream-tools/script 目录下面<br/>
	$ ls <br/>
	astream_tools.rb strom-tools.rb
### strom-tools.rb
	action:
		search
	argument:
		topology
	options list:
		list(-l):           list all topology
		elasticsearch(-e):  es info for a perticular topology
		kafka(-k):          data flow of kafka for a perticular topology
		strom(-s):	        strom info for a topology
		host(-h):			host list for a perticular topology
	
### 1. list all topology name
	$ ruby strom-tools.rb search topology --list
	topology number: 22sf_deimos
	sf_vega
	sf_adcore
	im_asp
	sf_jupiter
	im_router
	jpaas_router
	...
### 2. list all hosts and cup_num for one perticular topologyu,eg. sf_adcore
	$ ruby strom-tools.rb search topology --name sf_adcore --host

###	astream_tools.rb
##      arguments default value:

### 1. print all product/service/period info in last 24 hours. --pretty means print info prettly in json
	$ ruby astream_tools.rb search --pretty
### 2. for a preticular product and service
	$ ruby astream_tools.rb search --pretty --product sf --service adcore
### 3. set starttime and end time 
	$ ruby astream_tools.rb search --pretty --product sf --service adcore --from 20140710123030 --to 20140711240000


aqueducts_kpi_ruby:
   进入script目录下：<br/>
###	aqueducts_kpi_ruby
	action:
		search
	options:
		one(-on) 	default false
		product(-p) default []
		service(-s) default []
		oneday(-o) 	default nil
		from(-f) 	default yesterday current time to default current time
		email(-e) 	default false
		show(-sh) 	default false, show process detail
	default: kpi will exclude those new p/s
	$ ls
	aqueducts_kpi_tool.rb
### 1. no argument,default time is yesterday
	$ ruby aqueducts_kpi_tool.rb search_kpi
### 2. search and email  kpi info in 2014-07-10, excepting product sf's services adcore vega
	$ ruby aqueducts_kpi_tool.rb search_kpi --oneday 2014-07-10 -p sf,sf -s adcore,vega --email
### 3. search kpi info in last 5 hours
	$ ruby aqueducts_kpi_tool.rb search_kpi --from -5
### 4. search kpi from 2014-07-10 00:00:00 to 2014-07-13 24:00:00
	ruby aqueducts_kpi_tool.rb search_kpi --from 2014-07-11 --to 2014-07-13
### 5. searh kpi in 2014-07-17 and show search process info
	ruby aqueducts_kpi_tool.rb search_kpi --oneday 2014-07-17 --show
### 6. search sf/adcore's kpi in 2014-07-10
	ruby aqueducts_kpi_tool.rb search_kpi --one -p sf -s adcore --oneday 2014-07-10
### 7. search sf/adcore, sf/vega, im/asp kpi info one by one
	ruby aqueducts_kpi_tool.rb search_kpi --one --from -24 -p sf,sf,im  -s adcore,vega,asp --show
##	NOTE:
        1. emial sender and reciver can be modified in aqueducts_kpi_ruby/gen/email.rb line 34 and 35
        2. kip查询的时候会剔除前一天的脏数据。
### 简单介绍各个文件的作用：

	
	
	
		
	

	
	
	
	
	
	
	
	
	
    
	
