# alpine-fpm
PHP-FPM for Alpine Linux.

```
# build
docker build -t fpm .

# configure
location ~ [^/]\.php(/|$) {
  fastcgi_split_path_info ^(.+?\.php)(/.*)$;
  fastcgi_param PATH_INFO $fastcgi_path_info;

  if (!-f $document_root$fastcgi_script_name) {
      return 404;
  }

  fastcgi_pass fpm:9000;
  fastcgi_index index.php;
  fastcgi_param SCRIPT_FILENAME $document_root$fastcgi_script_name;
  include fastcgi_params;
}

# run
docker run -it --name fpm --rm -v $(pwd):/app -p 9000:9000 fpm
docker run -it --rm -p 80:80 --name nginx --link fpm -v $(pwd):/app nginx

```
