# micromdm-docker

Docker image containing micromdm and a few extras

## Config

Config using these environment variables:

| ENV VARIABLE                      | Default Value    | Description                                                                        |
|-----------------------------------|------------------|------------------------------------------------------------------------------------|
| MICROMDM_CONFIG_PATH              | /var/db/micromdm | Path to configuration directory                                                    |
| MICROMDM_SERVER_URL               |                  | Public HTTPS url of your server                                                    |
| MICROMDM_API_KEY                  |                  | API Token for mdmctl command                                                       |
| MICROMDM_TLS                      | true             | Use https                                                                          |
| MICROMDM_TLS_CERT                 |                  | Path to TLS certificate                                                            |
| MICROMDM_TLS_KEY                  |                  | Path to TLS private key                                                            |
| MICROMDM_HTTP_ADDR                | :https/:8000     | http(s) listen address of mdm server. defaults to :8080 if tls is false            |
| MICROMDM_HTTP_DEBUG               | false            | Enable debug for http(dumps full request)                                          |
| MICROMDM_HTTP_PROXY_HEADERS       | false            | Enable parsing of proxy headers for use behind a reverse proxy                     |
| MICROMDM_FILE_REPO                |                  | Path to http file repo                                                             |
| MICROMDM_DEPSIM_URL               |                  | Use depsim URL                                                                     |
| MICROMDM_WEBHOOK_URL              |                  | URL to send command responses                                                      |
| MICROMDM_WEBHOOK_AUTH_USERNAME    |                  | Basic auth user for webhook to send command responses.                             |
| MICROMDM_WEBHOOK_AUTH_PASSWORD    |                  | Basic auth password for webhook to send command responses.                         |
| MICROMDM_HTTP_HOMEPAGE            | true             | Hosts a simple built-in webpage at the / address                                   |
| MICROMDM_SCEP_CLIENT_VALIDITY     | 365              | Sets the scep certificate validity in days                                         |
| MICROMDM_NO_COMMAND_HISTORY       | false            | disables saving of command history                                                 |
| MICROMDM_USE_DYNAMIC_CHALLENGE    | false            | require dynamic SCEP challenges                                                    |
| MICROMDM_GEN_DYNAMIC_CHALLENGE    | false            | generate dynamic SCEP challenges in enrollment profile (built-in only)             |
| MICROMDM_VALIDATE_SCEP_ISSUER     | false            | validate only the issuer of the SCEP certificate rather than the whole certificate |
| MICROMDM_UDID_CERT_AUTH_WARN_ONLY | false            | warn only for udid cert mismatches                                                 |
| MICROMDM_VALIDATE_SCEP_EXPIRATION | false            | validate that the SCEP certificate is still valid                                  |
| MICROMDM_QUEUE                    | builtin          | command queue type                                                                 |

Optional automatic "upload" of APNS and Enrollment profile:

| ENV VARIABLE       | Description                                      |
|--------------------|--------------------------------------------------|
| APNS_PUSH_CERT     | Path to push cert in the container               |
| APNS_PUSH_CERT_KEY | Path to push cert private key in the container   |
| APNS_PASSWORD      | Password for the cert                            |
| ENROLLMENT_PROFILE | Path to enrollment certificate iin the container |

Use at you own peril
