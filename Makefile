simple-test: libs/simple-test.jar
	cd simple-test && sbt assembly
	mkdir -p libs
	cp simple-test/target/scala-2.10/simple-test-assembly-0.1-SNAPSHOT.jar libs/simple-test.jar

prepare-data:
	chmod g+s data
	setfacl -d -m g::rwx data
