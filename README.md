# wait


[![CICD](https://github.com/clickbg/wait/workflows/CICD/badge.svg?branch=main)](https://github.com/clickbg/wait/actions/workflows/cicd.yaml)
[![UPDATE](https://github.com/clickbg/wait/workflows/UPDATE/badge.svg?branch=main)](https://github.com/clickbg/wait/actions/workflows/update.yaml)
[![PUBLISH](https://github.com/clickbg/wait/workflows/PUBLISH/badge.svg)](https://github.com/clickbg/wait/actions/workflows/publish.yaml)

<img src="https://www.docker.com/wp-content/uploads/2022/03/vertical-logo-monochromatic.png" width="20" height="20"> [Avaliable on DockerHub](https://hub.docker.com/r/clickbg/wait)

Pause for a time equal to the total of the args given, where each arg can
have an optional suffix of (s)econds, (m)inutes, (h)ours, or (d)ays  
The container will exit gracefully after the time period has passed.

**Usage**
--
Command Line:

    docker run --name wait clickbg/wait:latest 10m

Compose (v2.11.2):

      wait:
        image: clickbg/wait:latest
        container_name: wait
        restart: "no"
        command: 2m
    
      wwwlb:
        container_name: wwwlb
        restart: always
        image: nginx:latest
        depends_on:
          wait:
            condition: service_completed_successfully
        volumes:
          - ${CONFDIR}/wwwlb/nginx/nginx.conf:/etc/nginx/nginx.conf:ro
        ports:
          - "80:80"
          - "443:443"
