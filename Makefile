all:
	rm -rf c* test_ebin/* test_src/*.beam src/*.beam *.beam ebin/*;
	rm -rf  *~ */*~  erl_cra*;
	rm -rf *_specs *_config *.log;
doc_gen:
	echo glurk not implemented
log_terminal:
	rm -rf terminal/ebin/*;
	rm -rf  *~ */*~  erl_cra*;
#	common
	erlc -o terminal/ebin ../services/common_src/src/*.erl;
#	application terminal
	erlc -o terminal/ebin ../services/terminal_src/src/*.erl;
	erl -pa terminal/ebin -s terminal start -sname log_terminal -setcookie abc
alert_ticket_terminal:
	erl -pa terminal/ebin -s terminal start -sname alert_ticket_terminal -setcookie abc
test:
	rm -rf c* test_ebin/* test_src/*.beam src/*.beam *.beam ebin/*;
	rm -rf  *~ */*~  erl_cra*;
	rm -rf *_specs *_config *.log;
#	test dirs
	mkdir c0;mkdir c1;mkdir c2;
# 	test object
#	erlc -o test_ebin ../services/control_src/src/*.erl;
#	Log service
#	erlc -o log/ebin ../services/common_src/src/*.erl;
#	erlc -o log/ebin ../services/log_src/src/*.erl;
#	erlc -o log/ebin app_files/log/*.erl;
#	cp app_files/log/*.app log/ebin;
#	Dbase service
#	erlc -o dbase/ebin ../services/common_src/src/*.erl;
#	erlc -o dbase/ebin ../services/dbase_src/src/*.erl;
#	erlc -o dbase/ebin app_files/dbase/*.erl;
#	cp app_files/dbase/*.app dbase/ebin;
#	test application
#	app_specs
#	git clone https://github.com/joq62/app_specs.git;
	cp test_src/*.app test_ebin;	
	erlc -o test_ebin test_src/*.erl;
	erl -pa test_ebin\
	    -setcookie abc\
	    -sname function_test\
	    -run function_test start_test test_src/test.config
