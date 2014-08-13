aqueducts-tools
===============

astream tools and kpi tools by ruby.

一 usage
================
### atream-tools 要求： 
	1. 可以访问线上机器
	2. 安装thrift
### aqueducts_kpi_ruby要求：
	1. 可以访问线上机器，连接mongo数据
	2. gem 'mongo'
	3. gem 'bson_ext'
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
		list(-l):		list all topology
		elasticsearch(-e):	es info for a perticular topology
		kafka(-k):		data flow of kafka for a perticular topology
		strom(-s):		strom info for a topology
		host(-h):		host list for a perticular topology
		name(-n):		topology name
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
		one(-on):	default false
		product(-p):	default []
		service(-s):	default []
		oneday(-o):	default nil
		from(-f):	default yesterday current time to default current time
		email(-e):	default false
		show(-sh):	default false, show process detail
	default: kpi will exclude those new p/s

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

二 代码介绍：
=================
###	1. astream-tools struct
###	astream-tools/script:

	astream_tools.rb
	strom-tools.rb 
	
###	astream-tools/lib:
	astream_es_data.rb   
	astream_es_data_process.rb
	elasticsearch_data.rb
	kafka_flow.rb
	strom_info.rb
###	astream-tools/vender/gen-rb:
	product_service_info.rb
	...
	
###	1.1 astream_tools.rb  由thor构建的命令行工具。 
	引用了：
	astream-tools/lib/astream_es_data_process.rb 
	
	astream-tools/lib/astream_es_data_process.rb
	引用了 
	astream-tools/vender/gen-rb/product_service_info.rb 文件中的类
	astream-tools/lib/astream_es_data.rb 

###	1.2 aqueducts-tools / astream-tools / vendor / gen-rb / product_service_info.rb
	对于特定的 product service period 组合，该类的实例记录了详细信息
	主要的属性有：
	@product = pro  
	@service = ser
	@period  = per  # 1 or 60 
	@total_pv = total  #总PV
	@ave_response_time = ave_res  #平均响应时间
	@ave_search_period = ave_ser  #查询时间区间平均值
	@delay_pv_per = delay_pv      #查询时间大于timeout的pv百分比
	@delay_pv_num = 0             #查询时间大于timeout的pv总数
	@ave_delay_pv_response_time = ave_delay   #查询时间大于timeout的pv平均响应时间
	@max_delay_response_time = max            #最大超时时间
	@min_delay_response_time = min            #最小超时时间
	@ave_delay_search_period = ave_ser_per    #超时查询，平均时间区间

###	1.3 astream-tools/lib/astream_es_data.rb 	
	search 函数，根据传入参数，从es中查询相应数据，返回array
	buildJson 函数，构建用于查询es的json
	turnToUnixTimeStamp 函数，将输入的20140708000000 时间转换成unix时间戳
	
###	1.4 astream-tools/lib/astream_es_data_process.rb		
	用于处理 astream_es_data 返回的查询结果。
	get_es_data 函数，处理了from和to时间跨越两天的情况。
	getAllProducts 函数，获取所有的product
	getAllServices 函数，根据products获取所有相应的services
	print_all_info 函数，打印所有信息，根据参数判断是否print prettily json 
	...
###	


	
###	2. aqueducts_kpi_ruby struct 
###	aqueducts_kpi_ruby/script:
	aqueducts_kpi_tool.rb

###	aqueducts_kpi_ruby/lib
	aqueducts_kpi.rb
	table_kpi_avi.html.erb

###	aqueducts_kpi_ruby/gen
	email.rb



	
	
	
	
	
	
	
	
    
	
