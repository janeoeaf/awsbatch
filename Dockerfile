FROM r-base
WORKDIR /usr/src/
COPY . .
RUN pip3 install -r requirements.txt
RUN chmod +x ./run_code.sh
RUN apt install curl
RUN curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
RUN unzip awscliv2.zip
RUN ./aws/install
ENTRYPOINT ./run_code.sh
