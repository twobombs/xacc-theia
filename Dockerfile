FROM twobombs/cudacluster

RUN apt update && apt install cmake libssl-dev && apt clean all
RUN git clone https://github.com/eclipse/xacc.git && cd xacc && mkdir build && cd build && cmake .. -DXACC_BUILD_EXAMPLES=TRUE -DXACC_BUILD_TESTS=TRUE && make install 
RUN wget https://www.eclipse.org/downloads/download.php?file=/theia/latest/linux/TheiaBlueprint.AppImage&r=1 && chmod 744 TheiaBlueprint.AppImage 

COPY run /root/run
RUN chmod 744 /root/run

EXPOSE 6080
ENTRYPOINT /root/run
