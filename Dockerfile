FROM apache/airflow:1.10.10-python3.7
USER root
ARG AIRFLOW_USER_HOME=/usr/local/airflow
ENV AIRFLOW_HOME=${AIRFLOW_USER_HOME}

COPY script/entrypoint.sh /entrypoint.sh
COPY config/airflow.cfg ${AIRFLOW_USER_HOME}/airflow.cfg

RUN mkdir -p ${AIRFLOW_USER_HOME}; chown -R airflow:airflow ${AIRFLOW_USER_HOME}
EXPOSE 8080 5555 8793 
USER airflow 
WORKDIR ${AIRFLOW_USER_HOME} 
ENTRYPOINT ["/entrypoint.sh"] 
CMD ["webserver"]
