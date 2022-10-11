#!/bin/bash
echo 'public class hellotest {
    public static void main(String[] args) {
        System.out.println("hello world");
    }
}' > hellotest.java
chmod +x hellotest.java
echo 'FROM openjdk
RUN mkdir /usr/src/myapp
COPY hellotest.java /usr/src/myapp
WORKDIR /usr/src/myapp
RUN javac hellotest.java
CMD ["java","hellotest"]' > Dockerfile
sudo docker build -t helloworldshell2 .
sudo docker run --name helloworld helloworldshell2
