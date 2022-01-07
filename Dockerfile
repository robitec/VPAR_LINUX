FROM ubuntu:20.04

RUN apt-get -qq update
RUN apt-get install ca-certificates libpsl5 libssl1.1 openssl publicsuffix unzip wget

RUN mkdir /neuralserver
WORKDIR /neuralserver

COPY VPAR_LINUX.zip /tmp
RUN unzip /tmp/VPAR_LINUX.zip


RUN ls -lar
WORKDIR /neuralserver/VPAR/DEPENDENCIES/LICENSE\ KEY/
RUN tar xvzf install_32bit_compatibility_package_for_x64.tar.gz
RUN chmod +x install_32bit_compatibility_package_for_x64/install_32bit_compatibility_package_for_x64.sh
RUN ./install_32bit_compatibility_package_for_x64/install_32bit_compatibility_package_for_x64.sh
RUN tar xf aksusbd-7.54.1-i386.tar
RUN chmod +x NeuralRUS
RUN cp -r /neuralserver/VPAR/RESOURCES/map/ /usr/lib/
RUN cp -r /neuralserver/VPAR/CONFIG_FILES/vpar7_cfg/ /usr/lib/

RUN echo "Add License!"
# curl --location --request POST '127.0.0.1:1947/_int_/checkin_file.html' --form 'check_in_file=@/tmp/file.V2C'

RUN echo "Add OpenCV"
RUN echo "Add Robitec API"
RUN echo "docker commit private Image"

EXPOSE 1947

# ENTRYPOINT ['/app/run.sh']
CMD ['/bin/bash']
# docker create -it neuralabs /bin/bash
# docker commit <container> <name:version> // TO PRESERVE CHANGES
# docker run -p 1947:1947 -it neuralabs /bin/bash
# docker start <container_name>
# docker exec -it <container_name> /bin/bash
