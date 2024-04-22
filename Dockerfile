FROM ubuntu:latest AS BUILD_IMAGE
RUN apt update && apt install git unzip wget -y
RUN mkdir /tmpfile && cd /tmpfile && wget https://www.tooplate.com/zip-templates/2136_kool_form_pack.zip
RUN unzip /tmpfile/2136_kool_form_pack.zip && chmod 400 2136_kool_form_pack && cd 2136_kool_form_pack && tar -cvzf /tmpfile/project.tar.gz * 

FROM ubuntu:latest
RUN apt update && apt install apache2 -y && rm -rf /var/www/html/*
COPY --from=BUILD_IMAGE /tmpfile/project.tar.gz /tmpfile/project.tar.gz
RUN tar -xvzf /tmpfile/project.tar.gz -C /var/www/html/ 
EXPOSE 80
CMD ["/usr/sbin/apache2ctl", "-D", "FOREGROUND"]
