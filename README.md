# Web Redirector

A very simple container to redirect HTTP/HTTPS traffic to another server, based on `nginx`.

*Based on project: https://github.com/schmunk42/docker-nginx-redirect*

## Resources

- [Docker Hub](https://hub.docker.com/r/ahabid/web-redirector/)
- [GitHub](https://github.com/a-h-abid/docker-web-redirector)

## Configuration

### Environment variables

- `SERVER_ENABLE_HTTP_TRAFFIC` - serve traffic in HTTP (80)
- `SERVER_ENABLE_HTTPS_TRAFFIC` - serve traffic in HTTPS (443)
- `SERVER_SSL_CERTIFICATE_FILE_NAME` - Set certificate file name
- `SERVER_SSL_CERTIFICATE_KEY_NAME` - Set certificate key file name
- `SERVER_REDIRECT` - server to redirect to, eg. `www.example.com`
- `SERVER_NAME` - optionally define the server name to listen on eg. `~^www.(?<subdomain>.+).example.com`
   - useful for capturing variable to use in server_redirect.
- `SERVER_REDIRECT_PATH` - optionally define path to redirect all requests eg. `/landingpage`
   - if not set nginx var `$request_uri` is used
- `SERVER_REDIRECT_SCHEME` - optionally define scheme to redirect to
   - if not set but X-Forwarded-Proto is send as request header with value 'https' this will be used.
     In all other cases nginx var `$scheme` is used
- `SERVER_REDIRECT_CODE` - optionally define the http status code to use for redirection
   - if not set or not in list of allowed codes 301 is used as default
   - allowed Codes are: 301, 302, 303, 307, 308
 - `SERVER_REDIRECT_POST_CODE` - optionally define the http code to use for POST redirection
    - useful if client should not change the request method from POST to GET
    - if not set or not in allowed Codes `SERVER_REDIRECT_CODE` is used
    - so per default all requests will be redirected with the same status code
 - `SERVER_REDIRECT_PUT_PATCH_DELETE_CODE` - optionally define the http code to use for PUT, PATCH and DELETE redirection
    - useful if client should not change the request method from PUT, PATCH and DELETE to GET
    - if not set or not in allowed Codes `SERVER_REDIRECT_CODE` is used
    - so per default all requests will be redirected with the same status code
- `SERVER_ACCESS_LOG` - optionally define the location where nginx will write its access log
   - if not set /dev/stdout is used
- `SERVER_ERROR_LOG` - optionally define the location where nginx will write its error log
   - if not set /dev/stderr is used

See also `docker-compose.yml` file.

## Usage

With `docker`

    docker run -e SERVER_REDIRECT=www.example.com -p 8888:80 ahabid/web-redirector:1.0
    docker run -e SERVER_REDIRECT=www.example.com -e SERVER_REDIRECT_PATH=/landingpage -p 8888:80 ahabid/web-redirector:1.0
    docker run -e SERVER_REDIRECT=www.example.com -e SERVER_REDIRECT_PATH=/landingpage -e SERVER_REDIRECT_SCHEME=https -p 8888:80 ahabid/web-redirector:1.0

---

## License

MIT
